param(
    [string]$ProjectRoot = (Split-Path -Parent $PSScriptRoot)
)

$ErrorActionPreference = 'Stop'
$storyRoot = Join-Path $ProjectRoot '스토리보드 결과'
$outputDir = Join-Path $storyRoot '001-030_통합_스토리보드'
$outputFile = Join-Path $outputDir '최종_통합_스토리보드.md'

$items = foreach ($number in 1..30) {
    $id = '{0:D3}' -f $number
    $source = Join-Path $storyRoot ($id + '_스토리보드\최종_스토리보드.md')
    if (-not (Test-Path -LiteralPath $source)) {
        throw "입력 스토리보드가 없습니다: $source"
    }

    $designDir = Get-ChildItem -LiteralPath (Join-Path $ProjectRoot '가상 클라이언트 설계 결과') -Directory |
        Where-Object { $_.Name -like ($id + '_*') } |
        Select-Object -First 1
    if (-not $designDir) {
        throw "클라이언트 설계 폴더가 없습니다: $id"
    }

    $design = Get-Content -LiteralPath (Join-Path $designDir.FullName '화면_설계서.md') -Raw -Encoding UTF8
    $titleMatch = [regex]::Match($design, '(?m)^# VC-(\d{3}) (.+?) 화면 설계서$')
    $axisMatch = [regex]::Match($design, '(?m)^(.+?) 분석만을 기준으로')
    [pscustomobject]@{
        Id = $id
        Name = if ($titleMatch.Success) { $titleMatch.Groups[2].Value } else { $designDir.Name.Substring(4) }
        Axis = if ($axisMatch.Success) { $axisMatch.Groups[1].Value } else { '목적별 설계' }
        Source = $source
    }
}

$lines = [System.Collections.Generic.List[string]]::new()
$lines.Add('# YOVIA 001~030 통합 스토리보드')
$lines.Add('')
$lines.Add('> 001번부터 030번까지의 개별 최종 스토리보드를 하나의 문서로 합성한 통합본이다.  ')
$lines.Add('> 각 클라이언트의 독립 설계 내용과 `MAIN-001`, `CATEGORY-001`, `BRAND-001`, `PRODUCT-001~015` 명세를 원문 순서대로 보존한다.')
$lines.Add('')
$lines.Add('## 1. 통합 문서 정보')
$lines.Add('')
$lines.Add('| 항목 | 결과 |')
$lines.Add('|---|---|')
$lines.Add('| 통합 범위 | VC-001~VC-030 |')
$lines.Add('| 포함 문서 | 개별 최종 스토리보드 30개 |')
$lines.Add('| 핵심 화면 명세 | 클라이언트별 3장, 총 90개 화면 섹션 |')
$lines.Add('| 상품 명세 | 클라이언트별 PRODUCT-001~015 |')
$lines.Add('| 합성 방식 | 원문 보존형 순차 병합 |')
$lines.Add('| 원본 처리 | 기존 001~030 파일 수정 없음 |')
$lines.Add('| 미확정 정보 | NOT_VERIFIED 또는 HOLD 유지 |')
$lines.Add('')
$lines.Add('## 2. 클라이언트 목차')
$lines.Add('')
$lines.Add('| 순번 | Client | 이름 | 설계 관점 | 통합 문서 장 |')
$lines.Add('|---:|---|---|---|---|')
foreach ($item in $items) {
    $lines.Add("| $([int]$item.Id) | VC-$($item.Id) | $($item.Name) | $($item.Axis) | VC-$($item.Id) 개별 스토리보드 |")
}
$lines.Add('')
$lines.Add('## 3. 공통 합성 원칙')
$lines.Add('')
$lines.Add('- 각 Client 결과는 독립적인 요구와 근거를 유지한다.')
$lines.Add('- 동일한 화면 ID는 Client 내부에서 해석하며 다른 Client의 화면과 자동 병합하지 않는다.')
$lines.Add('- 실제 상품·가격·후기·정책·효능 정보가 없는 항목은 확정하지 않는다.')
$lines.Add('- 각 개별 문서의 상태·반응형·접근성·오류 복구 기준을 그대로 수록한다.')
$lines.Add('')
$lines.Add('---')

foreach ($item in $items) {
    $raw = Get-Content -LiteralPath $item.Source -Raw -Encoding UTF8
    $raw = $raw.Replace('${id}', $item.Id).Trim()
    $raw = [regex]::Replace($raw, '(?m)^(#{1,6})\s+', {
        param($match)
        $level = [Math]::Min(6, $match.Groups[1].Value.Length + 2)
        return ('#' * $level) + ' '
    })

    $lines.Add('')
    $lines.Add("## VC-$($item.Id) $($item.Name) — $($item.Axis)")
    $lines.Add('')
    $lines.Add("- 원본: ../$($item.Id)_스토리보드/최종_스토리보드.md")
    $lines.Add("- 설계 기준: ../../가상 클라이언트 설계 결과/$($item.Id)_$($item.Name)/화면_설계서.md")
    $lines.Add('')
    $lines.Add($raw)
    $lines.Add('')
    $lines.Add('---')
}

New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
$content = ($lines -join "`r`n").TrimEnd() + "`r`n"
[System.IO.File]::WriteAllText($outputFile, $content, [System.Text.UTF8Encoding]::new($true))

Write-Output "Output=$outputFile"
Write-Output "Clients=$($items.Count)"
Write-Output "Bytes=$((Get-Item -LiteralPath $outputFile).Length)"
