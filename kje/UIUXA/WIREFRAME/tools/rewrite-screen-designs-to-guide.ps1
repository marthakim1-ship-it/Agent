param(
    [string]$ProjectRoot = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$sourceRoot = Join-Path $ProjectRoot '가상 클라이언트 설계 결과'
$archiveRoot = Join-Path $ProjectRoot ('archive\previous\screen-design-guide-rewrite\' + (Get-Date -Format 'yyyyMMdd_HHmmss'))
$guidePath = Join-Path $ProjectRoot '최종_와이어프레임_화면설계서_가이드.txt'

if (-not (Test-Path -LiteralPath $guidePath)) {
    throw "화면 설계서 가이드를 찾을 수 없습니다: $guidePath"
}

$requiredLabels = @(
    '화면명', '화면 목적', '주요 콘텐츠', '인터페이스 요소', '레이아웃',
    '작동 방식', '연결 화면', '사용자 경로', '비고·주석'
)

function Get-FieldValue {
    param([string]$Block, [string]$Label)
    $match = [regex]::Match($Block, '(?m)^- ' + [regex]::Escape($Label) + ':\s*(.+)$')
    if ($match.Success) { return $match.Groups[1].Value.Trim() }
    return ''
}

function Get-DefaultConnections {
    param([string]$ScreenId)
    switch ($ScreenId) {
        'MAIN-001' { return 'CATEGORY-001, BRAND-001' }
        'CATEGORY-001' { return 'TASK-001, MAIN-001' }
        'BRAND-001' { return 'CATEGORY-001, MAIN-001' }
        'TASK-001' { return 'TASK-002, CATEGORY-001' }
        'TASK-002' { return 'MAIN-001, TASK-001' }
        default { return 'NOT_VERIFIED' }
    }
}

function Get-LayoutDescription {
    param([string]$ScreenId, [string]$Content)
    switch ($ScreenId) {
        'MAIN-001' { return "본문 바로가기 → 헤더·전역 내비게이션 → 브랜드·제품 가치 → 카테고리 진입 → 상품 15개 → 브랜드 소개 → 검증 상태 → 푸터 순서로 배치한다. 모바일부터 데스크톱까지 상품 DOM 순서를 유지한다." }
        'CATEGORY-001' { return "헤더 → 현재 위치 → 정렬·필터 → 상품 결과 → 빈 상태·복구 → 푸터 순서로 배치한다. 모바일에서는 단일 열과 터치 스크롤을 우선한다." }
        'BRAND-001' { return "헤더 → 브랜드 정의 → 근거 상태 → 관련 제품 탐색 → 푸터 순서의 단일 읽기 흐름으로 배치한다." }
        'TASK-001' { return "헤더 → 현재 위치 → 핵심 과업 콘텐츠($Content) → 주요 행동 → 상태·복구 → 푸터 순서로 배치한다." }
        'TASK-002' { return "헤더 → 근거·기준일 → 상태·조건 → 다음 행동·복구 → 푸터 순서로 배치한다." }
        default { return "헤더 → 주요 콘텐츠 → 행동 → 상태·복구 → 푸터 순서로 배치한다." }
    }
}

function Get-InterfaceDescription {
    param([string]$ScreenId, [string]$Content, [string]$Actions)
    $base = switch ($ScreenId) {
        'MAIN-001' { '본문 바로가기, 헤더, 전역 내비게이션, 상품 카드 15개, 상태 라벨, 푸터' }
        'CATEGORY-001' { '브레드크럼, 정렬·필터 컨트롤, 상품 카드, 결과 상태 메시지, 복구 버튼' }
        'BRAND-001' { '페이지 제목, 브랜드 설명, 근거 상태 라벨, 관련 제품 링크, 메인 복귀 링크' }
        'TASK-001' { '페이지 제목, 과업 정보 영역, 상태 패널, 이전·다음 단계 버튼' }
        'TASK-002' { '페이지 제목, 근거·기준일 영역, 상태 라벨, 다음 행동 및 복구 링크' }
        default { '페이지 제목, 콘텐츠 영역, 상태 메시지, 이동 버튼' }
    }
    return "$base. 화면 고유 콘텐츠는 ‘$Content’이며 주요 조작은 ‘$Actions’이다."
}

$files = Get-ChildItem -LiteralPath $sourceRoot -Directory | Sort-Object Name | ForEach-Object {
    Join-Path $_.FullName '화면_설계서.md'
} | Where-Object { Test-Path -LiteralPath $_ }

if ($files.Count -ne 30) {
    throw "예상한 화면 설계서 30개와 실제 파일 수가 다릅니다: $($files.Count)"
}

New-Item -ItemType Directory -Path $archiveRoot -Force | Out-Null
$rewritten = 0
$screenCount = 0

foreach ($file in $files) {
    $clientFolder = Split-Path -Leaf (Split-Path -Parent $file)
    $archiveClient = Join-Path $archiveRoot $clientFolder
    New-Item -ItemType Directory -Path $archiveClient -Force | Out-Null
    Copy-Item -LiteralPath $file -Destination (Join-Path $archiveClient '화면_설계서.md')

    $text = Get-Content -LiteralPath $file -Raw -Encoding UTF8
    $sectionMatch = [regex]::Match($text, '(?s)(?<prefix>^.*?## 화면별 설계\r?\n)(?<screens>.*?)(?=\r?\n## MAIN-001 상품 슬롯)(?<suffix>\r?\n## MAIN-001 상품 슬롯.*$)')
    if (-not $sectionMatch.Success) {
        throw "화면별 설계 구간을 해석할 수 없습니다: $file"
    }

    $screenMatches = [regex]::Matches($sectionMatch.Groups['screens'].Value, '(?ms)^###\s+(?<id>[A-Z]+-\d+)\s+(?<name>[^\r\n]+)\r?\n(?<body>.*?)(?=^###\s+|\z)')
    if ($screenMatches.Count -ne 5) {
        throw "예상 화면 수 5개와 다릅니다: $file ($($screenMatches.Count))"
    }

    $newBlocks = [System.Collections.Generic.List[string]]::new()
    foreach ($screen in $screenMatches) {
        $id = $screen.Groups['id'].Value.Trim()
        $name = $screen.Groups['name'].Value.Trim()
        $body = $screen.Groups['body'].Value
        $purpose = Get-FieldValue $body '목적'
        $entry = Get-FieldValue $body '진입'
        $content = Get-FieldValue $body '구성'
        $actions = Get-FieldValue $body '행동'
        $states = Get-FieldValue $body '상태'
        $movement = Get-FieldValue $body '이동'
        $accessibility = Get-FieldValue $body '접근성'

        if ([string]::IsNullOrWhiteSpace($movement)) { $movement = Get-DefaultConnections $id }
        if ([string]::IsNullOrWhiteSpace($accessibility)) { $accessibility = '제목, 상태 텍스트, 키보드 포커스, 오류 복구' }
        $layout = Get-LayoutDescription $id $content
        $interface = Get-InterfaceDescription $id $content $actions
        $operation = "‘$actions’를 수행한다. 지원 상태는 ${states}이며, 오류 발생 시 재시도·수정·이전 단계 중 적절한 복구 수단을 제공한다."
        $path = "$entry → $actions → $movement"
        $notes = "$accessibility. 확인되지 않은 상품·가격·재고·정책·효능·인증 정보는 NOT_VERIFIED 또는 HOLD로 표시하고 활성 CTA로 확정하지 않는다."

        $block = @"
### $id — $name

| 구분 | 화면 설계 내용 |
|---|---|
| 화면명 | $name ($id) |
| 화면 목적 | $purpose |
| 주요 콘텐츠 | $content |
| 인터페이스 요소 | $interface |
| 레이아웃 | $layout |
| 작동 방식 | $operation |
| 연결 화면 | $movement |
| 사용자 경로 | $path |
| 비고·주석 | $notes |
"@
        $newBlocks.Add($block.Trim())
        $screenCount++
    }

    $notice = @"
> 작성 기준: `최종_와이어프레임_화면설계서_가이드.txt`<br>
> 변환 원칙: 기존 화면 목적·콘텐츠·행동·상태·연결·접근성 정보를 유지하고 새 9개 항목 양식으로 재구성했다.

"@
    $prefix = $sectionMatch.Groups['prefix'].Value
    $prefix = $prefix -replace '(?m)^(# .+\r?\n)', "`$1$notice"
    $newText = $prefix + ($newBlocks -join "`r`n`r`n") + $sectionMatch.Groups['suffix'].Value
    Set-Content -LiteralPath $file -Value $newText.TrimEnd() -Encoding UTF8 -NoNewline
    $rewritten++
}

foreach ($file in $files) {
    $updated = Get-Content -LiteralPath $file -Raw -Encoding UTF8
    foreach ($label in $requiredLabels) {
        $count = ([regex]::Matches($updated, '\| ' + [regex]::Escape($label) + ' \|')).Count
        if ($count -lt 5) {
            throw "필수 항목 검증 실패: $file / $label / $count"
        }
    }
}

Write-Output "Archive=$archiveRoot"
Write-Output "Documents=$rewritten"
Write-Output "Screens=$screenCount"
Write-Output 'Validation=PASS'
