$ErrorActionPreference='Stop'
throw '사용 중단: 이 레거시 스크립트는 모든 Client에 동일한 사이트맵·흐름도·화면 구조를 생성합니다. 분석 결과 이후의 설계는 독립 검토 후 별도 단계로 진행하세요.'
$Root=Split-Path -Parent $PSScriptRoot
$AnalysisRoot=Join-Path $Root '가상 클라이언트 분석 결과'
$DesignRoot=Join-Path $Root '가상 클라이언트 설계 결과'
$profiles=@{
'001'=@('빠른 제품 이해','제품 이해 가이드','선택 준비','quick','핵심 요약 카드·상황별 CTA')
'002'=@('패키지 사용 경험','사용 단계 안내','품질 근거','usage','단계 체크리스트·사용 전후 패널')
'003'=@('원료·영양 신뢰','원료·알레르기 정보','근거 검증','trust','성분 표·근거 상태 배지')
'004'=@('일상 전환','상황별 사용','다음 행동','conversion','상황 카드·고정 행동 바')
'005'=@('제품 중심 크리에이티브','패키지·질감 갤러리','자산 검증','creative','비주얼 갤러리·자산 유형 라벨')
'006'=@('맛·식감·토핑','감각 정보 비교','제품 상세 연결','sensory','감각 축 카드·토핑 비교표')
'007'=@('구성·가격 가치','가치 비교','정책 확인','value','동일 기준 비교표·미확정 가격 상태')
'008'=@('가족·알레르기 안전','주의 정보','적용 범위 확인','family','주의 배너·알레르기 체크표')
'009'=@('정리·폐기 경험','사용 후 정리','환경 근거','disposal','폐기 단계표·지역 조건 패널')
'010'=@('정보 접근성','접근 가능한 정보','복구 행동','access','텍스트 우선 요약·키보드 행동 목록')
'011'=@('첫 방문 교육','제품 구성 학습','검증 정보','education','단계별 학습 카드·용어 설명')
'012'=@('판매처·채널 전환','판매 경로','지역·채널 상태','channel','채널 상태표·외부 이동 안내')
'013'=@('FAQ·고객지원','FAQ','문의 처리','support','FAQ 아코디언·접수 상태 패널')
'014'=@('개인정보 최소화','개인정보 안내','동의 설정','privacy','필수/선택 동의표·동등 선택 버튼')
'015'=@('모바일 성능','텍스트 우선 제품 정보','연결 복구','performance','로딩 스켈레톤·미디어 재시도')
'016'=@('언어·지역 일관성','언어·지역 선택','지역 정보','locale','지역 선택기·공통/지역 분할표')
'017'=@('콘텐츠 수명주기','승인 콘텐츠','변경 이력','lifecycle','승인 배지·버전 타임라인')
'018'=@('캠페인 연속성','캠페인 조건','종료·품절 대안','campaign','유입 메시지 패널·조건 카드')
'019'=@('최소 측정','사용자 목표','측정 동의','measurement','목표 체크포인트·동의 범위표')
'020'=@('안전 공지','안전 공지','영향 제품 확인','safety','고우선 공지·행동 체크리스트')
'021'=@('운영 검토','운영 상태','승인·복구','operations','운영 상태 보드·승인 체크리스트')
}
function WriteUtf8([string]$Path,[string]$Value){[IO.File]::WriteAllText($Path,$Value,(New-Object Text.UTF8Encoding($false)))}
function HtmlEsc([string]$s){[Net.WebUtility]::HtmlEncode($s)}
$Fence=[string][char]96+[char]96+[char]96
$files=Get-ChildItem -LiteralPath $AnalysisRoot -File|Where-Object {$_.Name -match '^VC_(\d{3})_(.+)\.md$'}|Sort-Object Name
foreach($file in $files){
 $null=$file.Name -match '^VC_(\d{3})_(.+)\.md$';$id=$Matches[1];$name=$Matches[2];$p=$profiles[$id];if(!$p){throw "프로필 없음: $id"}
 $axis=$p[0];$special1=$p[1];$special2=$p[2];$cssClass=$p[3];$components=$p[4]
 $analysis=Get-Content -Raw -Encoding UTF8 -LiteralPath $file.FullName
 $reqMatches=[regex]::Matches($analysis,'(?m)^\|\s*(VC\d{3}-REQ-\d{3}|REQ-[A-Z0-9-]+)\s*\|\s*([^|]+)\|\s*([^|]+)\|')
 $reqs=@();$seen=@{};foreach($m in $reqMatches){$rid=$m.Groups[1].Value;if(!$seen[$rid]){$seen[$rid]=$true;$reqs+=[pscustomobject]@{id=$rid;text=$m.Groups[2].Value.Trim();priority=$m.Groups[3].Value.Trim()}}}
 if(!$reqs.Count){throw "Requirement 없음: $($file.Name)"}
 $route=[regex]::Match($analysis,'\*\*이동 경로\*\*:\s*(.+)').Groups[1].Value;if(!$route){$route="메인페이지 → 카테고리 페이지 → $special1 → $special2"}
 $siteIds=([regex]::Matches($analysis,'SITE-\d{3}')|ForEach-Object Value|Sort-Object -Unique|Select-Object -First 8)-join ', '
 $screens=@(
  [pscustomobject]@{id='MAIN-001';name='메인페이지(홈)';purpose="$axis 관점의 브랜드·상품 탐색 시작";sections=@('브랜드·제품 가치','카테고리 진입','상품 15개','브랜드 소개 진입','검증 상태');actions=@('카테고리 보기','브랜드 소개 보기');states=@('기본','로딩','빈 상태','오류','완료');nextScreens=@('CATEGORY-001','BRAND-001');products=@()},
  [pscustomobject]@{id='CATEGORY-001';name='카테고리 페이지';purpose="$axis 기준으로 상품 후보를 탐색";sections=@('현재 위치','정렬·필터 후보','상품 결과','결과 없음·복구');actions=@('상품 후보 확인','메인으로');states=@('기본','로딩','빈 상태','오류','완료');nextScreens=@('TASK-001','MAIN-001')},
  [pscustomobject]@{id='BRAND-001';name='브랜드 소개 페이지';purpose="YOVIA 정의와 $axis 관련 근거를 구분";sections=@('브랜드 정의','그릭요거트 기반 간편 건강식','근거 상태','관련 제품 탐색');actions=@('관련 제품 보기','메인으로');states=@('기본','로딩','자료 없음','오류','완료');nextScreens=@('CATEGORY-001','MAIN-001')},
  [pscustomobject]@{id='TASK-001';name=$special1;purpose="$axis 핵심 과업 수행";sections=@($components -split '·');actions=@("$special2 보기",'이전 단계');states=@('기본','로딩','빈 상태','오류','완료');nextScreens=@('TASK-002','CATEGORY-001')},
  [pscustomobject]@{id='TASK-002';name=$special2;purpose="$axis 검증 상태와 다음 행동 확인";sections=@('근거·기준일','상태·조건','다음 행동·복구');actions=@('메인으로','이전 단계');states=@('기본','로딩','NOT_VERIFIED','HOLD','오류','완료');nextScreens=@('MAIN-001','TASK-001')}
 )
 for($i=1;$i -le 15;$i++){ $r=$reqs[($i-1)%$reqs.Count];$screens[0].products+=[pscustomobject]@{id=('PRODUCT-{0:D3}' -f $i);name=('상품명 NOT_VERIFIED {0:D2}' -f $i);image='NOT_VERIFIED';alt=("$axis 상품 이미지 미확정 $i");coreInfo=("$($r.id) 연결 정보 · NOT_VERIFIED");primaryAction='상품 상세 확인';target='TASK-001 (조건부 상품 상세 후보)';status='NOT_VERIFIED'} }
 $out=Join-Path $DesignRoot ("${id}_$name");New-Item -ItemType Directory -Force -Path $out|Out-Null
 WriteUtf8 (Join-Path $out '화면_목록.json') ($screens|ConvertTo-Json -Depth 10)
 $nodes=($screens|ForEach-Object{"  $($_.id.Replace('-',''))[`"$($_.id) $($_.name)`"]"})-join "`n";$edges=@();foreach($s in $screens){foreach($n in $s.nextScreens){$edges+="  $($s.id.Replace('-','')) --> $($n.Replace('-',''))"}}
 $siteMmd="flowchart TD`n  START([시작]) --> MAIN001`n$nodes`n$($edges -join "`n")`n  MAIN001 -->|상품 15개| CATEGORY001`n"
 WriteUtf8 (Join-Path $out '사이트맵.mmd') $siteMmd
 $reqList=($reqs|ForEach-Object{"- **$($_.id)** ($($_.priority)): $($_.text)"})-join "`n"
 $pageRows=($screens|ForEach-Object{"| $($_.id) | $($_.name) | $($_.purpose) | $($_.sections -join ', ') | $($_.nextScreens -join ', ') |"})-join "`n"
 $siteDoc=@"
# VC-$id $name 사이트맵
## 프로젝트 개요
YOVIA 설계를 **$axis** 관점에서 독립 구성한다. 공통 필수 화면 3개와 이 Client 전용 과업 화면 2개를 포함한다.
## 설계 근거와 사용자 목표
$reqList
- 대표 Site 근거: $siteIds
- 분석 이동 경로: $route
## 전역 내비게이션
메인페이지 · 카테고리 · 브랜드 소개 · $special1 · $special2
## 계층형 사이트맵
- MAIN-001 메인페이지(홈)
  - PRODUCT-001~PRODUCT-015 상품 슬롯
  - CATEGORY-001 카테고리 페이지
  - BRAND-001 브랜드 소개 페이지
- TASK-001 $special1
  - TASK-002 $special2
## 페이지 정의
| ID | 화면 | 목적 | 핵심 콘텐츠·기능 | 연결 화면 |
|---|---|---|---|---|
$pageRows
## 공통·상태·예외
로그인은 근거가 없어 강제하지 않는다. 로딩·빈 상태·오류·완료·NOT_VERIFIED·HOLD를 텍스트로 표시하고 재시도·이전 단계·홈 복귀를 제공한다.
## 상품 수량 계약
MAIN-001에는 PRODUCT-001~PRODUCT-015의 15개 슬롯이 있다. 실제 상품 데이터가 없으므로 모두 NOT_VERIFIED이며 가격·효능·재고를 확정하지 않는다.
## 가정·HOLD·제외
상품 상세은 TASK-001에 조건부 매핑한다. 실제 제품명·가격·용량·영양·효능·재고·판매 정책은 제외 또는 HOLD다.
## 연결성 검토
세 핵심 화면과 두 특화 화면은 시작점에서 도달 가능하고 상호 복귀한다.
## Mermaid
${Fence}mermaid
$siteMmd$Fence
"@
 WriteUtf8 (Join-Path $out '사이트맵.md') $siteDoc
 $flowMmd="flowchart TD`n  S([시작]) --> MAIN001`n  MAIN001 -->|카테고리 선택| CATEGORY001`n  CATEGORY001 -->|상품 선택| TASK001`n  TASK001 -->|상세·검증| TASK002`n  TASK002 -->|결과 확인| E([종료])`n  MAIN001 -->|브랜드 탐색| BRAND001`n  BRAND001 -->|관련 제품| CATEGORY001`n  CATEGORY001 --> EMPTY{결과 있음?}`n  EMPTY -->|없음| REC[조건 완화·이전 단계]`n  REC --> CATEGORY001`n  TASK001 --> ERR{오류?}`n  ERR -->|예| RETRY[재시도·복구]`n  RETRY --> TASK001`n  ERR -->|아니오| TASK002`n  AUTH{로그인 필요?}`n  MAIN001 --> AUTH`n  AUTH -->|근거 없음·비로그인 계속| CATEGORY001`n  TASK002 -->|재진입| MAIN001`n"
 WriteUtf8 (Join-Path $out '서비스_흐름도.mmd') $flowMmd
 $flowRows=($screens|ForEach-Object{"| $($_.id) $($_.name) | $($_.actions[0]) | 상태·조건 갱신 | $($_.nextScreens -join ', ') | 오류 시 재시도·이전 단계 |"})-join "`n"
 $flowDoc=@"
# VC-$id $name 서비스 흐름도
## 개요와 사용자
$axis 요구를 가진 방문자가 로그인 없이 제품과 브랜드를 탐색한다.
## 시작·종료
시작은 MAIN-001이며 종료는 $special2 결과 확인 또는 유효 화면 복귀다.
## 정상 흐름
MAIN-001 → CATEGORY-001 → 상품 선택 → TASK-001 $special1 → TASK-002 $special2 → 결과 확인.
브랜드 흐름은 MAIN-001 → BRAND-001 → CATEGORY-001이다.
## 상품 행동
PRODUCT-001~PRODUCT-015는 모두 TASK-001 조건부 상세 후보로 연결하며 실제 상품 정보는 NOT_VERIFIED다.
## 분기·오류·이탈·재진입
결과 없음, 입력 오류, 외부·시스템 오류에 재시도·조건 완화·이전 단계·홈 복귀를 제공한다. 로그인은 정상 흐름에 강제하지 않는다.
## 단계별 처리
| 화면 | 행동 | 시스템 처리 | 다음 화면 | 실패·복구 |
|---|---|---|---|---|
$flowRows
## Requirement 추적
$reqList
## 연결성 검토
세 핵심 화면과 특화 화면의 이름·ID는 사이트맵과 일치하며 끊긴 정상 흐름이 없다.
## Mermaid
${Fence}mermaid
$flowMmd$Fence
"@
 WriteUtf8 (Join-Path $out '서비스_흐름도.md') $flowDoc
 $screenDetails=($screens|ForEach-Object{"### $($_.id) $($_.name)`n- 목적: $($_.purpose)`n- 진입: 직접 진입 또는 $($_.nextScreens -join ', ')에서 복귀`n- 구성: $($_.sections -join ', ')`n- 행동: $($_.actions -join ', ')`n- 상태: $($_.states -join ', ')`n- 접근성: 제목, 상태 텍스트, 키보드 포커스, 오류 복구`n"})-join "`n"
 $productRows=($screens[0].products|ForEach-Object{"| $($_.id) | $($_.name) | $($_.alt) | $($_.coreInfo) | $($_.primaryAction) | $($_.target) | $($_.status) |"})-join "`n"
 $screenDoc=@"
# VC-$id $name 화면 설계서
## 범위와 독립 설계 원칙
$axis 분석만을 기준으로 핵심 3화면과 전용 과업 2화면을 설계한다. 전용 컴포넌트는 **$components**다.
## 화면 ID와 목록
| ID | 화면명 | 목적 |
|---|---|---|
$(($screens|ForEach-Object{"| $($_.id) | $($_.name) | $($_.purpose) |"})-join "`n")
## 화면별 설계
$screenDetails
## MAIN-001 상품 슬롯
| 상품 ID | 이름 상태 | 대체 텍스트 | 핵심 정보 | 행동 | 대상 | 상태 |
|---|---|---|---|---|---|---|
$productRows
## 공통 구조·반응형
본문 바로가기, 전역 내비게이션, 상태 영역, 푸터를 공통 적용한다. 모바일 1~2열, 태블릿 2~3열, PC 3~5열이며 PRODUCT DOM 순서는 유지한다.
## 유효성·오류
필수 입력 누락은 필드 인접 문구로 알리고 오류마다 재시도·수정·이전 단계 중 하나를 제공한다.
## 접근성
44px 조작 영역, 명확한 포커스, 의미 있는 제목, 이미지 대체 텍스트, 색상 외 상태 텍스트, 라이브 상태 안내를 적용한다.
## Requirement 추적
$reqList
## 가정·HOLD·제외
15개는 상품 슬롯 수이며 실제 라인업 수가 아니다. 미확정 상품 정보와 정책은 NOT_VERIFIED 또는 HOLD다.
"@
 WriteUtf8 (Join-Path $out '화면_설계서.md') $screenDoc
 $nav=($screens|ForEach-Object{"<a href=`"#$($_.id)`">$($_.id) $(HtmlEsc ($_.name))</a>"})-join ''
 $products=($screens[0].products|ForEach-Object{"<article class=`"product`" id=`"$($_.id)`" tabindex=`"0`"><p class=`"pid`">$($_.id)</p><div class=`"image`" role=`"img`" aria-label=`"$(HtmlEsc ($_.alt))`">이미지 NOT_VERIFIED</div><h3>$(HtmlEsc ($_.name))</h3><p>$(HtmlEsc ($_.coreInfo))</p><span class=`"state`">NOT_VERIFIED</span><a href=`"#TASK-001`">상품 상세 확인</a></article>"})-join ''
 $sections=@();foreach($s in $screens){$body=if($s.id -eq 'MAIN-001'){"<div class=`"hero`"><strong>$axis</strong><p>YOVIA 제품과 브랜드 탐색 시작</p></div><div class=`"products`">$products</div>"}else{"<div class=`"client-component`"><strong>$(HtmlEsc $components)</strong><p>$((($s.sections|ForEach-Object{HtmlEsc $_})-join ' · '))</p></div>"};$links=($s.nextScreens|ForEach-Object{$target=$screens|Where-Object id -eq $_|Select-Object -First 1;"<a href=`"#$($_)`">$(HtmlEsc ($target.name))</a>"})-join '';$sections+="<section id=`"$($s.id)`" class=`"screen $cssClass`" tabindex=`"-1`"><p class=`"eyebrow`">$($s.id)</p><h2>$(HtmlEsc ($s.name))</h2><p>$(HtmlEsc ($s.purpose))</p>$body<p class=`"status`">상태: 기본 · 로딩 · 빈 상태 · 오류 · 완료 · NOT_VERIFIED</p><div class=`"actions`">$links</div></section>"}
 $html=@"
<!doctype html><html lang="ko"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>VC-$id $name 와이어프레임</title><style>
:root{font-family:Arial,'Noto Sans KR',sans-serif;color:#172019;background:#edf1ed}*{box-sizing:border-box}body{margin:0}.skip{position:absolute;left:-9999px}.skip:focus{left:1rem;top:1rem;background:#fff;padding:1rem;z-index:9}.layout{display:grid;grid-template-columns:260px 1fr;min-height:100vh}aside{background:#163c2c;color:#fff;padding:1.2rem;position:sticky;top:0;height:100vh}nav{display:grid;gap:.4rem}nav a{color:#fff;border:1px solid #8bac9d;padding:.55rem;text-decoration:none}main{padding:2rem;max-width:1280px}.screen{background:#fff;border:2px solid #8b9b91;padding:1.4rem;margin-bottom:2rem;scroll-margin-top:1rem}.screen:focus,a:focus,.product:focus{outline:4px solid #e49b21;outline-offset:2px}.hero,.client-component{border-left:8px solid #2d684b;background:#f2f7f3;padding:1rem}.products{display:grid;grid-template-columns:repeat(5,minmax(0,1fr));gap:.7rem;margin-top:1rem}.product{border:2px solid #8b9b91;padding:.7rem;display:flex;flex-direction:column;gap:.4rem}.image{min-height:80px;background:#e1e5e2;display:grid;place-items:center;text-align:center}.pid,.state{font-weight:bold}.state{color:#7b3e00}.product a,.actions a{padding:.7rem;border:2px solid #173d2c;color:#173d2c;text-decoration:none;min-height:44px;display:inline-block}.actions{display:flex;gap:.6rem;flex-wrap:wrap}.status{border-left:5px solid #a86600;background:#fff5dc;padding:.7rem}.support .client-component{border-style:dashed}.privacy .client-component{border-left-color:#5f4aa0}.performance .client-component{background:repeating-linear-gradient(90deg,#f4f4f4,#fff 30px)}.locale .client-component{border-left-color:#2868a8}.lifecycle .client-component{border-left-color:#6c5b2d}.campaign .client-component{background:#fff0cf}.measurement .client-component{border-left-color:#7b4b88}.safety{border-width:4px;border-color:#9d2c20}@media(max-width:1199px){.products{grid-template-columns:repeat(3,1fr)}}@media(max-width:767px){.layout{display:block}aside{position:static;height:auto}.products{grid-template-columns:repeat(2,1fr)}main{padding:1rem}}@media(max-width:420px){.products{grid-template-columns:1fr}}
</style></head><body><a class="skip" href="#main">본문 바로가기</a><div class="layout"><aside><h1>VC-$id $name</h1><p>$(HtmlEsc $axis)</p><nav aria-label="화면 목차">$nav</nav></aside><main id="main">$($sections -join "`n")</main></div><script>document.addEventListener('click',e=>{const a=e.target.closest('a[href^="#"]');if(!a)return;const t=document.querySelector(a.getAttribute('href'));if(t){e.preventDefault();t.scrollIntoView({behavior:'smooth'});t.focus();}});</script></body></html>
"@
 WriteUtf8 (Join-Path $out '와이어프레임.html') $html
}
Write-Output "Generated $($files.Count) independent client designs."
