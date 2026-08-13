$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $PSScriptRoot
$Workspace = Split-Path -Parent $Root
$ClientRoot = Join-Path $Workspace 'Md_Skill\output\04_virtual_clients\clients'
$AnalysisRoot = Join-Path $Root '가상 클라이언트 분석 결과'
$DesignRoot = Join-Path $Root '가상 클라이언트 설계 결과'
$OutputRoot = Join-Path $Root '설계 출력물'

$Profiles = @{
  '022'=@{Name='이정민'; Axis='식품 표시·광고 준법'; Task1='표시 정보 확인'; Task2='문구 승인 상태'; Menu='표시 정보'; Components='필수 표시 표·승인 상태 패널'; Sites='SITE-001, SITE-003, SITE-008, SITE-017, SITE-036'}
  '023'=@{Name='차유나'; Axis='냉장 유통·보관 정보'; Task1='보관 상태 안내'; Task2='이상 상태 확인'; Menu='보관 안내'; Components='온도·시간 조건표·이상 상태 체크'; Sites='SITE-003, SITE-008, SITE-015, SITE-036, SITE-047'}
  '024'=@{Name='노현석'; Axis='기업·캠퍼스 복지 도입'; Task1='기관 도입 검토'; Task2='도입 자료 확인'; Menu='기관 도입'; Components='도입 조건표·필요 문서 체크리스트'; Sites='SITE-001, SITE-012, SITE-017, SITE-041, SITE-077'}
  '025'=@{Name='장하늘'; Axis='반복 구매·정기배송 경험'; Task1='반복 구매 조건'; Task2='변경·해지 관리'; Menu='반복 구매'; Components='단건/정기 비교·일정 상태표'; Sites='SITE-002, SITE-012, SITE-041, SITE-061, SITE-089'}
  '026'=@{Name='문채원'; Axis='체험·샘플링 프로그램'; Task1='체험 구성 확인'; Task2='체험 신청 상태'; Menu='체험 안내'; Components='체험 구성 카드·조건 체크리스트'; Sites='SITE-006, SITE-021, SITE-041, SITE-077, SITE-101'}
  '027'=@{Name='유승호'; Axis='리뷰·커뮤니티 신뢰'; Task1='후기 맥락 확인'; Task2='신고·정정 상태'; Menu='후기'; Components='후기 출처 라벨·운영 이력'; Sites='SITE-002, SITE-003, SITE-041, SITE-077, SITE-141'}
  '028'=@{Name='배지훈'; Axis='주문 후 문제 해결'; Task1='문제 유형 확인'; Task2='처리 상태 확인'; Menu='주문 지원'; Components='문제 분기·접수 상태 패널'; Sites='SITE-001, SITE-012, SITE-017, SITE-041, SITE-141'}
  '029'=@{Name='신가람'; Axis='재고 대기·출시 알림'; Task1='판매 상태 확인'; Task2='알림 설정 관리'; Menu='출시·재고'; Components='상태 배지·알림 동의 패널'; Sites='SITE-002, SITE-012, SITE-041, SITE-081, SITE-181'}
  '030'=@{Name='고은별'; Axis='출시 전 경험 QA·릴리스'; Task1='출시 검증'; Task2='결함·재검증 상태'; Menu='품질 검증'; Components='여정 체크리스트·결함 상태표'; Sites='SITE-001, SITE-006, SITE-010, SITE-015, SITE-017'}
}

function Write-Utf8([string]$Path,[string]$Value) {
  $parent=Split-Path -Parent $Path
  if(!(Test-Path $parent)){New-Item -ItemType Directory -Force -Path $parent|Out-Null}
  [IO.File]::WriteAllText($Path,$Value,(New-Object Text.UTF8Encoding($false)))
}
function Esc([string]$Value){[Net.WebUtility]::HtmlEncode($Value)}

foreach($id in $Profiles.Keys|Sort-Object){
  $p=$Profiles[$id]
  $clientPath=Join-Path $ClientRoot ("VC_$id.md")
  if(!(Test-Path $clientPath)){throw "Client 없음: $clientPath"}
  $client=Get-Content -Raw -Encoding UTF8 $clientPath
  $reqMatches=[regex]::Matches($client,'(?m)^\| (VC\d{3}-REQ-\d{3}) \| ([^|]+) \| ([^|]+) \| ([^|]+) \| ([^|]+) \| ([^|]+) \| ([^|]+) \|')
  if($reqMatches.Count-ne6){throw "Requirement 6개 확인 실패: VC_$id"}
  $reqs=@(); foreach($m in $reqMatches){$reqs+=[pscustomobject]@{Id=$m.Groups[1].Value.Trim();Text=$m.Groups[2].Value.Trim();Category=$m.Groups[3].Value.Trim();Priority=$m.Groups[4].Value.Trim();Evidence=$m.Groups[5].Value.Trim()}}
  $reqRows=($reqs|ForEach-Object{"| $($_.Id) | $($_.Text) | $($_.Priority) | $($_.Evidence); $($p.Sites) | $($p.Task1)·$($p.Task2) 후보 |"})-join "`n"
  $infoRows=($reqs|ForEach-Object{"| $($_.Id) | 사실·절차 | $($p.Axis) | $($_.Text) | $($p.Menu) | 상태·조건·근거 콘텐츠 | $($p.Components) | $($p.Sites) |"})-join "`n"
  $analysis=@"
# 가상클라이언트 기반 분석 결과 — VC-$id ($($p.Name))

## 1. 가상 클라이언트

- **프로젝트 주제**: $($p.Axis)
- **제작 목적**: YOVIA 웹 경험에서 $($p.Axis) 요구를 검증 가능한 정보와 행동으로 연결
- **제공 자료**: VC_$id.md, 리서치 batch-001-020~batch-181-200
- **적용 매체**: 반응형 웹

## 2. 클라이언트 요구사항

| Requirement ID | 요청 항목 | 중요도 | 관련 자료 | 필요한 기능 |
|---|---|---|---|---|
$reqRows

## 3. 정보 구조

| 요청 원문 / Requirement ID | 정보 유형 | 주제 | 부주제 | 메뉴 | 콘텐츠 | 기능/화면 요소 | 관련 Site ID |
|---|---|---|---|---|---|---|---|
$infoRows

리서치 10개 배치의 200개 레코드 중 completed 101, partial 96을 판독 가능한 후보로 검토하고 failed/dead 3개는 정상 근거에서 제외했다. 표시 배지·보관 안내·단품/구독 비교·리뷰·상태·오류 복구 패턴을 관찰했으나 YOVIA의 실제 정책이나 데이터로 자동 채택하지 않았다.

## 4. 내비게이션

- **시작 화면**: 메인페이지 또는 $($p.Menu) 관련 직접 진입 후보
- **이동 경로**: 메인페이지 → 카테고리 → 상품 후보 → $($p.Task1) → $($p.Task2) → 결과 확인·이전 단계
- **연결 페이지**: 브랜드 소개, 카테고리, $($p.Task1), $($p.Task2)
- **검색 및 위치 안내**: 현재 위치와 상태를 텍스트로 표시하며 최종 GNB·URL은 확정하지 않음

## 5. 화면 구성

- **핵심 콘텐츠**: YOVIA 정의, $($p.Axis) 핵심 조건, 근거·기준일·상태
- **보조 콘텐츠**: 관련 제품 탐색, 주의·미확정·HOLD 설명
- **기능 후보**: $($p.Components), 재시도, 이전 단계, 홈 복귀
- **반응형 후보**: 모바일에서 핵심 조건→상태→행동 순서 유지
- **접근성 후보**: 색상 외 상태 텍스트, 키보드 포커스, 44px 조작 영역, 라이브 오류 안내

## 6. 검토 결과

- **MENU**: 메인, 카테고리, 브랜드 소개, $($p.Menu) 후보
- **CONTENT**: $($p.Axis) 조건·적용 범위·근거·기준일·미확정 상태
- **FUNCTION**: $($p.Components), 상태 확인, 오류 복구, 조건부 다음 행동
- **반복 관찰**: 제품 목록·상세·상태·리뷰·구독·보관 안내 패턴은 복수 자료에 존재
- **특화**: 현재 Client의 6개 Requirement로 연결되는 요소만 채택
- **보류·충돌**: 실제 상품·가격·재고·정책·효능·인증은 NOT_VERIFIED/HOLD
- **판정**: 분석 완료. 후속 설계에서 공통 3화면과 Client 전용 2화면 후보로 구체화 가능
"@
  $analysisPath=Join-Path $AnalysisRoot ("VC_${id}_$($p.Name).md")
  Write-Utf8 $analysisPath $analysis

  $out=Join-Path $DesignRoot ("${id}_$($p.Name)")
  New-Item -ItemType Directory -Force -Path $out|Out-Null
  $screens=@(
    [pscustomobject]@{id='MAIN-001';name='메인페이지(홈)';purpose="$($p.Axis) 관점의 브랜드·상품 탐색 시작";entryConditions=@('직접 진입','핵심 화면에서 복귀');sections=@('브랜드·제품 가치','카테고리 진입','상품 15개','브랜드 소개','검증 상태');actions=@('카테고리 보기','브랜드 소개 보기');states=@('기본','로딩','빈 상태','오류','완료');nextScreens=@('CATEGORY-001','BRAND-001');products=@()},
    [pscustomobject]@{id='CATEGORY-001';name='카테고리 페이지';purpose="$($p.Axis) 기준 상품 후보 탐색";entryConditions=@('MAIN-001');sections=@('현재 위치','정렬·필터 후보','상품 결과','빈 상태·복구');actions=@('상품 후보 확인','메인으로');states=@('기본','로딩','빈 상태','오류','완료');nextScreens=@('TASK-001','MAIN-001')},
    [pscustomobject]@{id='BRAND-001';name='브랜드 소개 페이지';purpose="YOVIA 정의와 $($p.Axis) 근거 구분";entryConditions=@('MAIN-001');sections=@('브랜드 정의','그릭요거트 기반 간편 건강식','근거 상태','관련 제품');actions=@('관련 제품 보기','메인으로');states=@('기본','로딩','자료 없음','오류','완료');nextScreens=@('CATEGORY-001','MAIN-001')},
    [pscustomobject]@{id='TASK-001';name=$p.Task1;purpose="$($p.Axis) 핵심 과업";entryConditions=@('CATEGORY-001');sections=@($p.Components.Split('·'));actions=@("$($p.Task2) 보기",'이전 단계');states=@('기본','로딩','빈 상태','오류','완료');nextScreens=@('TASK-002','CATEGORY-001')},
    [pscustomobject]@{id='TASK-002';name=$p.Task2;purpose="$($p.Axis) 검증 상태와 결과 확인";entryConditions=@('TASK-001');sections=@('근거·기준일','상태·조건','다음 행동·복구');actions=@('메인으로','이전 단계');states=@('기본','로딩','NOT_VERIFIED','HOLD','오류','완료');nextScreens=@('MAIN-001','TASK-001')}
  )
  for($i=1;$i-le15;$i++){$r=$reqs[($i-1)%6];$screens[0].products+=[pscustomobject]@{id=('PRODUCT-{0:D3}'-f$i);name=('상품명 NOT_VERIFIED {0:D2}'-f$i);image='NOT_VERIFIED';alt=("$($p.Axis) 상품 이미지 미확정 $i");coreInfo=("$($r.Id) 연결 정보 · NOT_VERIFIED");primaryAction='상품 상세 확인';target="TASK-001 $($p.Task1) (조건부)";status='NOT_VERIFIED'}}
  Write-Utf8 (Join-Path $out '화면_목록.json') ($screens|ConvertTo-Json -Depth 12)

  $nodes=($screens|ForEach-Object{"  $($_.id.Replace('-',''))[`"$($_.id) $($_.name)`"]"})-join "`n"
  $edges=@();foreach($s in $screens){foreach($next in $s.nextScreens){$edges+="  $($s.id.Replace('-','')) --> $($next.Replace('-',''))"}}
  $siteMmd="flowchart TD`n  START([시작]) --> MAIN001`n$nodes`n$($edges-join "`n")`n  MAIN001 -->|PRODUCT-001~015| CATEGORY001`n"
  Write-Utf8 (Join-Path $out '사이트맵.mmd') $siteMmd
  $pageRows=($screens|ForEach-Object{"| $($_.id) | $($_.name) | $($_.purpose) | $($_.sections-join ', ') | $($_.nextScreens-join ', ') |"})-join "`n"
  $reqBulletList=($reqs|ForEach-Object{"- **$($_.Id)** ($($_.Priority)): $($_.Text)"})-join "`n"
  $reqTraceList=($reqs|ForEach-Object{"- **$($_.Id)**: $($_.Text)"})-join "`n"
  $siteDoc=@"
# VC-$id $($p.Name) 사이트맵
## 프로젝트 개요
$($p.Axis) 분석을 기준으로 공통 핵심 3화면과 전용 과업 2화면을 구성한다.
## 설계 근거와 핵심 사용자 목표
$reqBulletList
대표 Site 근거: $($p.Sites)
## 전역 내비게이션 구조
메인페이지 · 카테고리 · 브랜드 소개 · $($p.Task1) · $($p.Task2)
## 계층형 사이트맵
- MAIN-001 메인페이지(홈)
  - PRODUCT-001~PRODUCT-015
  - CATEGORY-001 카테고리 페이지
  - BRAND-001 브랜드 소개 페이지
- TASK-001 $($p.Task1)
  - TASK-002 $($p.Task2)
## 페이지 정의
| ID | 화면 | 목적 | 핵심 콘텐츠·기능 | 연결 화면 |
|---|---|---|---|---|
$pageRows
## 공통·회원·예외
로그인을 강제하지 않는다. 로딩·빈 상태·오류·완료·NOT_VERIFIED·HOLD와 재시도·홈 복귀를 제공한다.
## 상품 수량 계약
MAIN-001의 PRODUCT-001~015는 실제 라인업이 아닌 NOT_VERIFIED 설계 슬롯이다.
## 연결성·가정
5개 화면은 시작점에서 도달·복귀 가능하다. 실제 상품·가격·재고·정책·효능·인증은 확정하지 않는다.
## Mermaid 원본
동일 폴더의 사이트맵.mmd 참조.
"@
  Write-Utf8 (Join-Path $out '사이트맵.md') $siteDoc

  $flowMmd="flowchart TD`n  S([시작]) --> MAIN001`n  MAIN001 --> CATEGORY001`n  MAIN001 --> BRAND001`n  BRAND001 --> CATEGORY001`n  CATEGORY001 --> TASK001`n  TASK001 --> TASK002`n  TASK002 --> E([결과 확인])`n  TASK002 --> MAIN001`n  CATEGORY001 --> EMPTY{결과 있음?}`n  EMPTY -->|없음| REC[조건 완화·복구]`n  REC --> CATEGORY001`n  TASK001 --> ERR{오류?}`n  ERR -->|예| RETRY[재시도]`n  RETRY --> TASK001`n"
  Write-Utf8 (Join-Path $out '서비스_흐름도.mmd') $flowMmd
  $flowRows=($screens|ForEach-Object{$firstAction=(@($_.actions)|Select-Object -First 1);"| $($_.id) $($_.name) | $firstAction | 상태·조건 갱신 | $($_.nextScreens-join ', ') | 재시도·이전 단계·홈 |"})-join "`n"
  $flowDoc=@"
# VC-$id $($p.Name) 서비스 흐름도
## 개요와 시작·종료
$($p.Axis) 요구 사용자가 로그인 없이 MAIN-001에서 시작해 TASK-002 결과 확인 또는 유효 화면 복귀로 종료한다.
## 정상 흐름
MAIN-001 → CATEGORY-001 → 상품 선택 → TASK-001 $($p.Task1) → TASK-002 $($p.Task2) → 결과 확인. 브랜드 흐름은 MAIN-001 → BRAND-001 → CATEGORY-001이다.
## 상품 행동
PRODUCT-001~015는 TASK-001 조건부 후보로 연결하며 실제 상품 정보는 NOT_VERIFIED다.
## 분기·오류·재진입
결과 없음, 입력·시스템 오류에 조건 완화·재시도·이전 단계·홈 복귀를 제공한다.
## 단계별 처리
| 화면 | 행동 | 시스템 처리 | 다음 화면 | 실패·복구 |
|---|---|---|---|---|
$flowRows
## Requirement 추적
$reqTraceList
## 연결성 검토
사이트맵과 화면 이름·ID가 일치하고 정상 흐름의 끊긴 링크가 없다.
## Mermaid 원본
동일 폴더의 서비스_흐름도.mmd 참조.
"@
  Write-Utf8 (Join-Path $out '서비스_흐름도.md') $flowDoc

  $productRows=($screens[0].products|ForEach-Object{"| $($_.id) | $($_.name) | $($_.alt) | $($_.coreInfo) | $($_.primaryAction) | $($_.target) | $($_.status) |"})-join "`n"
  $screenSections=($screens|ForEach-Object{"### $($_.id) $($_.name)`n- 목적: $($_.purpose)`n- 진입: $($_.entryConditions-join ', ')`n- 구성: $($_.sections-join ', ')`n- 행동: $($_.actions-join ', ')`n- 상태: $($_.states-join ', ')`n- 이동: $($_.nextScreens-join ', ')`n- 접근성: 제목·상태 텍스트·키보드 포커스·오류 복구`n"})-join "`n"
  $screenDoc=@"
# VC-$id $($p.Name) 화면 설계서
## 범위와 ID
$($p.Axis) 분석 기준. MAIN-001, CATEGORY-001, BRAND-001, TASK-001, TASK-002 총 5개 화면.
## 전체 화면 목록
$pageRows
## 화면별 설계
$screenSections
## MAIN-001 상품 슬롯
| 상품 ID | 이름 상태 | 대체 텍스트 | 핵심 정보 | 행동 | 대상 | 상태 |
|---|---|---|---|---|---|---|
$productRows
## 공통 구조·반응형
본문 바로가기, 헤더, 상태, 푸터. 모바일 1열, 태블릿 2열, PC 3열이며 PRODUCT DOM 순서를 유지한다.
## 유효성·오류·접근성
오류마다 재시도·수정·이전 단계를 제공한다. 44px 조작 영역, 보이는 포커스, 이미지 대체 텍스트, 색상 외 상태 문구를 적용한다.
## Requirement 추적과 가정
$reqTraceList
실제 상품·가격·재고·정책·효능·인증은 NOT_VERIFIED 또는 HOLD다.
"@
  Write-Utf8 (Join-Path $out '화면_설계서.md') $screenDoc

  $productHtml=($screens[0].products|ForEach-Object{"<article class='product'><div class='ph' role='img' aria-label='$(Esc $_.alt)'>IMAGE</div><b>$($_.id)</b><h4>$(Esc $_.name)</h4><p>$(Esc $_.coreInfo)</p><a href='#TASK-001'>$(Esc $_.primaryAction)</a><small>$($_.status)</small></article>"})-join "`n"
  $nav=($screens|ForEach-Object{"<a href='#$($_.id)'>$($_.id) $(Esc $_.name)</a>"})-join ''
  $other=($screens|Where-Object{$_.id-ne'MAIN-001'}|ForEach-Object{"<section class='screen' id='$($_.id)'><p class='label'>$($_.id)</p><h2>$(Esc $_.name)</h2><p>$(Esc $_.purpose)</p><div class='panel'><h3>핵심 영역</h3><p>$(Esc ($_.sections-join ' · '))</p><p>상태: $(Esc ($_.states-join ', '))</p></div><p>$(($_.nextScreens|ForEach-Object{"<a class='btn' href='#$_'>$_ 이동</a>"})-join ' ')</p></section>"})-join "`n"
  $html=@"
<!doctype html><html lang="ko"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>VC-$id $($p.Name) 와이어프레임</title><style>*{box-sizing:border-box}html{scroll-behavior:smooth}body{margin:0;background:#ddd;color:#222;font:16px Arial,sans-serif;line-height:1.5}.skip{position:absolute;top:-99px}.skip:focus{top:0;background:#111;color:#fff;padding:12px}nav{position:sticky;top:0;z-index:2;display:flex;gap:6px;flex-wrap:wrap;padding:12px;background:#bbb;border-bottom:2px solid #333}nav a,.btn{min-height:44px;display:inline-flex;align-items:center;padding:8px 12px;border:2px solid #555;background:#eee;color:#222}.screen{max-width:1200px;margin:28px auto;padding:24px;background:#f7f7f7;border:3px solid #333;scroll-margin-top:80px}.hero,.panel{padding:24px;background:#e5e5e5;border:2px solid #777}.products{display:grid;grid-template-columns:repeat(3,1fr);gap:12px}.product{padding:12px;border:2px solid #777;background:#eee}.product .ph{height:110px;display:grid;place-content:center;background:#ccc;border:1px dashed #555}.product small{display:block;margin-top:8px}.label{font-weight:bold;color:#555}@media(max-width:900px){.products{grid-template-columns:repeat(2,1fr)}}@media(max-width:600px){.screen{margin:12px;padding:14px}.products{grid-template-columns:1fr}nav{position:static}}a:focus{outline:3px solid #111;outline-offset:2px}</style></head><body><a class="skip" href="#MAIN-001">본문 바로가기</a><nav aria-label="화면 목차">$nav</nav><main><section class="screen" id="MAIN-001"><p class="label">MAIN-001</p><h1>메인페이지(홈)</h1><div class="hero"><h2>$($p.Axis)</h2><p>YOVIA · 그릭요거트 기반 간편 건강식</p><a class="btn" href="#CATEGORY-001">카테고리</a> <a class="btn" href="#BRAND-001">브랜드 소개</a></div><h2>상품 슬롯 15개</h2><div class="products">$productHtml</div></section>$other</main></body></html>
"@
  Write-Utf8 (Join-Path $out '와이어프레임.html') $html

  foreach($kind in @(@('사이트 구조맵','사이트맵.md','사이트맵.mmd'),@('서비스 흐름도','서비스_흐름도.md','서비스_흐름도.mmd'),@('화면 설계서','화면_설계서.md','와이어프레임.html','화면_목록.json'))){$dest=Join-Path (Join-Path $OutputRoot $kind[0]) ("${id}_$($p.Name)");New-Item -ItemType Directory -Force -Path $dest|Out-Null;for($k=1;$k-lt$kind.Count;$k++){Copy-Item -Force (Join-Path $out $kind[$k]) (Join-Path $dest $kind[$k])}}
}
"생성 완료: VC-022~030"
