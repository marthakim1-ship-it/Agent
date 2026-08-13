$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $PSScriptRoot
$AnalysisRoot = Join-Path $Root '가상 클라이언트 분석 결과'
$DesignRoot = Join-Path $Root '가상 클라이언트 설계 결과'

$clients = @(
  @{Id='013'; Name='윤가은'; Topic='검증 FAQ와 고객지원 연결'; Menus=@('도움말','FAQ','문의'); Journey='질문 선택 → 검증 답변 → 관련 제품 확인 → 문의'; Pages=@(
    @('홈','검증된 도움말과 제품 탐색의 시작점','도움말, 제품 안내, 중요 주의 정보','도움말 보기','FAQ'),
    @('FAQ','사용법·보관·성분·구매 질문 분류','질문 유형, 검증 상태, 중요 주의','답변 선택','FAQ 상세'),
    @('FAQ 상세','검증 답변과 관련 제품·문의 연결','답변, 근거 상태, 주의 정보, 관련 제품','문의하기','문의'),
    @('문의','미해결 문제 접수','문의 유형, 내용, 개인정보 안내','접수하기','문의 완료'),
    @('문의 완료','접수 결과와 복귀 행동 안내','접수 상태, 후속 안내','FAQ로 돌아가기','FAQ'),
    @('제품 안내','FAQ 맥락의 제품 정보 제공','제품 정의, 사용 맥락, 검증 정보','FAQ 보기','FAQ'),
    @('오류 안내','실패 원인과 복구 행동 제공','오류 설명, 재시도, 대체 문의','이전 화면','홈')
  )},
  @{Id='014'; Name='최현우'; Topic='개인정보 동의와 데이터 최소화'; Menus=@('제품 정보','개인정보 안내','동의 설정'); Journey='목적 확인 → 선택 → 핵심 정보 이용 → 설정 변경'; Pages=@(
    @('홈','동의 없이도 핵심 제품 정보 접근','제품 정의, 개인정보 선택 안내','제품 정보 보기','제품 정보'),
    @('제품 정보','비필수 동의와 무관한 제품 탐색','제품 설명, 사용 정보','지역 정보 보기','지역 선택'),
    @('개인정보 안내','수집 항목·목적·필수 여부 설명','수집 목적, 항목, 상태','선택 관리','동의 설정'),
    @('동의 설정','수락·거부·철회를 동등하게 제공','필수/선택 구분, 현재 상태','설정 저장','설정 완료'),
    @('설정 완료','변경 결과와 재변경 경로 안내','반영 상태, 다음 행동','제품 정보로 이동','제품 정보'),
    @('지역 선택','위치 권한 거부의 직접 선택 대안','지역 목록, 직접 선택','지역 적용','제품 정보'),
    @('오류 안내','설정 실패 시 복구 제공','오류 설명, 재시도, 설정 유지','다시 시도','동의 설정')
  )},
  @{Id='015'; Name='문지호'; Topic='모바일 성능과 안정성'; Menus=@('제품','사용법','구매'); Journey='핵심 텍스트 탐색 → 제품 선택 → 상세 확인 → 외부 연결'; Pages=@(
    @('홈','느린 환경에서도 핵심 정의와 탐색 제공','텍스트 우선 소개, 제품 링크','제품 보기','제품 목록'),
    @('제품 목록','가벼운 목록에서 제품 선택','텍스트 카드, 이미지 대체 자산','상세 보기','제품 상세'),
    @('제품 상세','핵심 사실과 CTA 우선 표시','제품 정의, 이미지 상태, CTA','사용법 보기','사용법'),
    @('사용법','텍스트 중심 사용 안내','단계 안내, 대체 미디어','구매 경로 보기','구매 안내'),
    @('구매 안내','확정된 외부 연결 후보 제공','연결 조건, 외부 이동 안내','외부 연결','외부 연결 결과'),
    @('외부 연결 결과','성공·실패와 복귀 경로 표시','연결 상태, 재시도','제품으로 돌아가기','제품 상세'),
    @('오류 안내','미디어·네트워크 실패 복구','텍스트 대안, 재시도','목록으로 이동','제품 목록')
  )},
  @{Id='016'; Name='송예진'; Topic='언어·지역별 정보 일관성'; Menus=@('언어·지역','제품','판매 정보'); Journey='지역 선택 → 동일 제품 유지 → 지역 정보 확인 → 행동'; Pages=@(
    @('홈','공통 브랜드 정의와 지역 맥락 제공','브랜드 정의, 현재 언어·지역','언어·지역 변경','언어·지역 선택'),
    @('언어·지역 선택','텍스트로 언어와 지역 선택','언어명, 지역명, 적용 범위','선택 적용','지역 적용 결과'),
    @('지역 적용 결과','현재 맥락 유지 여부 확인','적용 언어·지역, 유지된 제품','제품 보기','제품 상세'),
    @('제품 목록','현재 지역에 공개 가능한 제품 탐색','공개 상태, 지역 적용 범위','상세 보기','제품 상세'),
    @('제품 상세','공통 사실과 지역 정보를 구분','공통 정의, 지역별 정보, 기준일','판매 정보 보기','판매 정보'),
    @('판매 정보','확정된 지역 정보만 안내','출처, 기준일, 적용 범위','지역 변경','언어·지역 선택'),
    @('미지원 지역 안내','미확정 지역의 공개 보류와 대안','보류 상태, 공통 정보 링크','홈으로 이동','홈')
  )},
  @{Id='017'; Name='백승아'; Topic='콘텐츠와 자산 수명주기'; Menus=@('제품','사용법','검증 정보'); Journey='제품 탐색 → 승인 사실 확인 → 자산 상태 확인 → 관련 정보 이동'; Pages=@(
    @('홈','승인된 제품 사실 중심 진입','승인 제품, 최신 갱신 상태','제품 보기','제품 목록'),
    @('제품 목록','승인 상태의 제품만 탐색','제품 카드, 자산 상태','상세 보기','제품 상세'),
    @('제품 상세','단일 승인 출처의 핵심 사실 제공','제품 사실, 이미지 유형, 기준일','사용법 보기','사용법'),
    @('사용법','제품 버전과 연결된 사용 정보','관련 제품, 갱신 조건','검증 정보 보기','검증 정보'),
    @('검증 정보','콘텐츠 근거와 상태 설명','소유자, 기준일, 갱신 상태','변경 이력 보기','변경 이력'),
    @('변경 이력','현재·이전 승인 상태 구분','버전, 변경 항목, 관련 콘텐츠','현재 제품 보기','제품 상세'),
    @('비공개 안내','만료·미승인 자산의 대체 경로','비공개 사유, 승인 콘텐츠 링크','제품 목록','제품 목록')
  )},
  @{Id='018'; Name='나유찬'; Topic='캠페인과 상시 제품 경험 연결'; Menus=@('캠페인','제품','이용 조건'); Journey='캠페인 유입 → 조건 확인 → 제품 근거 확인 → 핵심 행동'; Pages=@(
    @('캠페인 랜딩','유입 약속과 첫 화면 메시지 일치','캠페인 메시지, 상태, 조건','조건 확인','이용 조건'),
    @('이용 조건','기간·대상·상태를 CTA 전에 설명','조건, 적용 범위, 기준일','제품 근거 보기','제품 상세'),
    @('제품 상세','캠페인과 검증된 제품 사실 연결','제품 정의, 근거, 관련 캠페인','핵심 행동','행동 결과'),
    @('행동 결과','행동 성공·실패와 다음 경로 제공','처리 상태, 다음 행동','캠페인으로 돌아가기','캠페인 랜딩'),
    @('캠페인 목록','진행·종료 상태별 캠페인 탐색','상태 텍스트, 캠페인 카드','캠페인 보기','캠페인 랜딩'),
    @('종료·품절 안내','종료·품절 시 상시 제품으로 연결','종료 상태, 관련 제품','제품 보기','제품 상세'),
    @('오류 안내','딥링크·외부 연결 오류 복구','유입 맥락, 재시도, 대체 경로','목록으로 이동','캠페인 목록')
  )},
  @{Id='019'; Name='권세아'; Topic='최소 측정과 안전한 실험'; Menus=@('제품','사용법','판매처'); Journey='목표 선택 → 행동 → 결과 확인 → 동의 범위 내 측정'; Pages=@(
    @('홈','사용자 목표별 명확한 시작점 제공','제품 이해, 사용법, 판매처 목표','제품 이해','제품 상세'),
    @('제품 상세','제품 이해 행동과 결과 분리','제품 사실, 관련 행동','사용법 확인','사용법'),
    @('사용법','사용법 목표를 독립적으로 완료','단계 안내, 완료 상태','판매처 이동','판매처 안내'),
    @('판매처 안내','외부 이동 조건과 복귀 경로 안내','판매처 후보, 외부 이동 안내','외부 이동','외부 이동 결과'),
    @('외부 이동 결과','성공·취소·오류를 구분','이동 상태, 복귀 행동','제품으로 돌아가기','제품 상세'),
    @('측정 동의','비필수 측정 선택과 제한 설명','측정 목적, 선택 상태','선택 저장','설정 완료'),
    @('설정 완료','동의 반영 결과 확인','반영 상태, 변경 경로','홈으로 이동','홈')
  )},
  @{Id='020'; Name='홍준서'; Topic='품질 이슈와 안전 공지 대응'; Menus=@('안전 공지','제품 확인','문의'); Journey='공지 확인 → 영향 제품 확인 → 행동 지침 → 문의·갱신 확인'; Pages=@(
    @('홈','중요 안전 공지를 일반 콘텐츠보다 우선 제시','공지 상태, 제품 탐색','안전 공지 보기','안전 공지 목록'),
    @('안전 공지 목록','상태·기준일별 공지 탐색','공지 카드, 상태 텍스트','공지 상세','안전 공지 상세'),
    @('안전 공지 상세','영향 범위와 승인 행동 안내','범위, 기준일, 행동 지침','제품 확인','영향 제품 확인'),
    @('영향 제품 확인','사용자 제품의 영향 여부 확인 후보','제품 식별 입력, 결과 상태','확인하기','확인 결과'),
    @('확인 결과','영향 여부와 다음 행동 제공','결과, 행동 지침, 문의','문의하기','문의'),
    @('문의','공지 맥락을 유지한 문의 경로','공지 참조, 문의 내용','접수하기','문의 완료'),
    @('문의 완료','접수 상태와 공지 복귀 제공','접수 상태, 갱신 확인','공지로 돌아가기','안전 공지 상세'),
    @('이전 버전','공지 갱신 이력을 현재 버전과 연결','버전, 변경 사항, 기준일','현재 공지 보기','안전 공지 상세')
  )}
)

$uiProfiles = @{
  '013'=@{Pattern='질문 중심 지원 허브';Components='카테고리 탭, FAQ 아코디언, 고정 주의 정보, 문의 폼, 접수 상태 패널';State='답변 검증 상태와 문의 처리 상태를 단계별로 표시';Class='support'}
  '014'=@{Pattern='동의 전 설명과 선택 제어';Components='수집 목적 요약, 필수/선택 구분표, 동등한 수락·거부 버튼, 위치 직접 선택, 철회 패널';State='현재 동의값·변경값·저장 결과를 분리 표시';Class='privacy'}
  '015'=@{Pattern='텍스트 우선 점진 로딩';Components='핵심 텍스트 셸, 이미지 스켈레톤, 저용량 대체 자산, 연결 재시도, 네트워크 상태 배너';State='텍스트 성공과 미디어 실패를 독립적으로 처리';Class='performance'}
  '016'=@{Pattern='지역 맥락 유지형 탐색';Components='언어·지역 선택기, 현재 맥락 칩, 공통/지역 정보 분할 패널, 기준일 표, 미지원 지역 안내';State='변경 전·적용 중·적용 후·미지원 상태를 표시';Class='locale'}
  '017'=@{Pattern='승인 자산·버전 추적';Components='승인 상태 배지, 자산 유형 라벨, 소유자·기준일 메타데이터, 변경 이력 타임라인, 비공개 대체 링크';State='초안·승인·만료·비공개 상태를 텍스트로 구분';Class='lifecycle'}
  '018'=@{Pattern='유입 메시지 연속형 캠페인';Components='유입 약속 히어로, 기간·대상 조건 카드, 제품 근거 패널, 행동 결과 영수증, 종료·품절 대체 카드';State='진행·종료·품절·딥링크 오류 상태별 CTA 변경';Class='campaign'}
  '019'=@{Pattern='목표·이벤트 분리형 측정';Components='목표 선택 카드, 행동 체크포인트, 동의 범위 패널, 외부 이동 결과, 측정 이벤트 설명';State='성공·취소·오류와 측정 허용 여부를 별도 기록';Class='measurement'}
  '020'=@{Pattern='안전 공지 우선 대응';Components='고우선 공지 배너, 영향 범위 표, 제품 식별 입력, 행동 지침 체크리스트, 공지 버전 타임라인, 문의 연결';State='공지 활성·갱신·해제와 제품 영향 여부를 명시';Class='safety'}
}

function Esc([string]$s) { return [System.Net.WebUtility]::HtmlEncode($s) }
function WriteUtf8([string]$Path,[string]$Value) { [IO.File]::WriteAllText($Path,$Value,(New-Object Text.UTF8Encoding($false))) }
$Fence = [string][char]96 + [char]96 + [char]96

foreach ($c in $clients) {
  $profile=$uiProfiles[$c.Id]
  $analysisPath = Join-Path $AnalysisRoot ("VC_{0}_{1}.md" -f $c.Id,$c.Name)
  if (!(Test-Path -LiteralPath $analysisPath)) { throw "분석 파일 없음: $analysisPath" }
  $analysis = Get-Content -Raw -Encoding UTF8 -LiteralPath $analysisPath
  $reqMatches = [regex]::Matches($analysis,'(?m)^\| (VC\d{3}-REQ-\d{3}) \| ([^|]+) \| ([^|]+) \|')
  $reqs = @(); $seen=@{}
  foreach($m in $reqMatches){ if(!$seen[$m.Groups[1].Value]){$seen[$m.Groups[1].Value]=$true;$reqs += [pscustomobject]@{Id=$m.Groups[1].Value;Text=$m.Groups[2].Value.Trim();Priority=$m.Groups[3].Value.Trim()}} }
  if($reqs.Count -ne 6){throw "$($c.Id) Requirement 수 오류: $($reqs.Count)"}
  $out = Join-Path $DesignRoot ("{0}_{1}" -f $c.Id,$c.Name)
  New-Item -ItemType Directory -Force -Path $out | Out-Null
  $screens=@(); for($i=0;$i -lt $c.Pages.Count;$i++){ $p=$c.Pages[$i]; $screens += [pscustomobject]@{id=('SCR-{0:D3}' -f ($i+1));name=$p[0];purpose=$p[1];entryConditions=@($(if($i -eq 0){'직접 진입 또는 전역 내비게이션'}else{'이전 화면의 행동 선택'}));sections=@($p[2] -split ', ');actions=@($p[3],'이전 단계 이동');states=@('기본','로딩','빈 상태','오류','완료');nextScreens=@()} }
  for($i=0;$i -lt $screens.Count;$i++){ $target=$c.Pages[$i][4]; $next=$screens|Where-Object name -eq $target|Select-Object -First 1; if($next){$screens[$i].nextScreens=@($next.id)} }
  $json=$screens|ConvertTo-Json -Depth 8
  WriteUtf8 (Join-Path $out '화면_목록.json') $json

  $nodes=@(); $edges=@(); foreach($s in $screens){$nodes += ('  {0}["{0} {1}"]' -f ($s.id -replace '-',''),$s.name); foreach($n in $s.nextScreens){$edges += ('  {0} --> {1}' -f ($s.id -replace '-',''),($n -replace '-',''))}}
  $mmd="flowchart TD`n  START([시작]) --> $($screens[0].id -replace '-','')`n"+($nodes -join "`n")+"`n"+($edges -join "`n")+"`n  $($screens[-1].id -replace '-','') -. 복구·재진입 .-> $($screens[0].id -replace '-','')`n"
  WriteUtf8 (Join-Path $out '사이트맵.mmd') $mmd
  $reqText=($reqs|ForEach-Object{"- **$($_.Id)** ($($_.Priority)): $($_.Text)"}) -join "`n"
  $hier=($screens|ForEach-Object{"- 1차 **$($_.name)** ($($_.id))`n  - 2차: $($_.sections -join ', ')`n  - 3차: 상태·오류·복구 안내"}) -join "`n"
  $pageRows=($screens|ForEach-Object{"| $($_.id) | $($_.name) | $($_.purpose) | $($_.sections -join ', ') | $($_.actions[0]) | $((($_.nextScreens|ForEach-Object{($screens|Where-Object id -eq $_).name}) -join ', ')) |"}) -join "`n"
  $siteDocument=@"
# VC-$($c.Id) $($c.Name) 사이트맵

## 프로젝트 개요
YOVIA의 그릭요거트 기반 간편 건강식 정보를 $($c.Topic) 관점에서 구성한 모바일 우선 반응형 웹 설계다. 가격·영양 수치·효능·판매 정책은 입력에서 확정되지 않아 사실로 만들지 않는다.

## 설계 근거와 핵심 사용자 목표
$reqText

핵심 여정: **$($c.Journey)**. 근거는 분석 파일의 EVD 및 Site ID 연결을 유지한다.

## 전역 내비게이션 구조
$($c.Menus -join ' · ') · 홈. 현재 위치와 상태는 색상 외 텍스트로 병기한다.

## 계층형 사이트맵
$hier

## 페이지별 정의
| 화면 ID | 페이지 | 목적 | 핵심 콘텐츠 | 주요 기능 | 연결 페이지 |
|---|---|---|---|---|---|
$pageRows

## 공통·회원 상태별 영역
- 공통: 본문 바로가기, 헤더, 현재 위치, 상태 메시지, 푸터, 오류 복구.
- 회원 상태: 분석 근거에 회원 기능이 없으므로 로그인을 강제하지 않는다. 개인화·저장 기능은 **HOLD**다.

## 주요 사용자 여정과 예외 페이지
- 정상: $($c.Journey)
- 예외: 빈 상태·입력 오류·외부 연결 오류에서 재시도, 이전 단계, 홈 복귀를 제공한다.

## 가정·HOLD·제외 항목
- 가정: 화면 간 이동은 로컬 프로토타입 수준이며 실제 API 처리는 하지 않는다.
- HOLD: $($reqs[-1].Id) — $($reqs[-1].Text)
- 제외: 미확정 가격·재고·배송·효능·인증·로그인·결제 정책.

## 링크·중복·도달 가능성 검토
모든 화면은 홈 또는 핵심 여정에서 도달하며 화면 목적은 중복되지 않는다. 예외 상태에는 복구 행동을 연결했다.

## Mermaid
${Fence}mermaid
$mmd$Fence
"@
  WriteUtf8 (Join-Path $out '사이트맵.md') $siteDocument

  $flowNodes=@(); $flowEdges=@(); foreach($s in $screens){$flowNodes += ('  {0}["{1}<br/>{2}"]' -f ($s.id -replace '-',''),$s.id,$s.name); foreach($n in $s.nextScreens){$flowEdges += ('  {0} -->|주요 행동| {1}' -f ($s.id -replace '-',''),($n -replace '-',''))}}
  $flowDiagram="flowchart TD`n  START([시작]) --> $($screens[0].id -replace '-','')`n"+($flowNodes -join "`n")+"`n"+($flowEdges -join "`n")+"`n  ERR{오류 또는 결과 없음?}`n  $($screens[1].id -replace '-','') --> ERR`n  ERR -->|예| REC[복구 행동: 재시도·이전 단계]`n  REC --> $($screens[0].id -replace '-','')`n  ERR -->|아니오| $($screens[2].id -replace '-','')`n  AUTH{로그인이 필요한가?}`n  $($screens[0].id -replace '-','') --> AUTH`n  AUTH -->|근거 없음: 로그인 없이 계속| $($screens[1].id -replace '-','')`n  END([종료])`n  $($screens[-1].id -replace '-','') --> END`n"
  WriteUtf8 (Join-Path $out '서비스_흐름도.mmd') $flowDiagram
  $flowRowList=@(); foreach($s in $screens){$action=($s.actions|Select-Object -First 1);$nextNames=@();foreach($nextId in $s.nextScreens){$nextNames+=(($screens|Where-Object id -eq $nextId|Select-Object -First 1).name)};$flowRowList+=("| {0} {1} | {2} | 상태를 텍스트로 갱신 | {1} | {3} |" -f $s.id,$s.name,$action,($nextNames -join ', '))};$flowRows=$flowRowList -join "`n"
  $flowDocument=@"
# VC-$($c.Id) $($c.Name) 서비스 흐름도

## 서비스 흐름 개요
$($c.Topic) 목표를 $($c.Journey) 순서로 지원한다.

## 사용자 유형과 시작·종료 조건
- 사용자: 모바일 우선 환경에서 YOVIA 제품 관련 정보를 확인하는 방문자.
- 시작: 직접 URL, 전역 내비게이션 또는 외부 유입.
- 종료: 필요한 정보를 확인하거나 행동 결과와 복귀 경로를 확인한 때.
- 로그인: 근거가 없어 정상 흐름에 포함하지 않는다.

## 핵심 정상 흐름
$($c.Journey)

## 분기·오류·이탈·재진입
- 입력 오류: 필드 인접 오류 문구와 수정 방법을 제공한다.
- 결과 없음: 조건을 완화하거나 이전 화면으로 이동한다.
- 시스템·외부 연결 오류: 재시도와 내부 정보 복귀를 함께 제공한다.
- 이탈·재진입: 공유·뒤로 가기 후 현재 화면의 핵심 맥락을 다시 표시한다.

## 단계별 처리
| 단계 | 사용자 행동 | 시스템 처리 | 화면 | 다음 조건 |
|---|---|---|---|---|
$flowRows

## 연결성 및 Requirement 검토
$reqText

모든 화면명과 ID는 사이트맵 및 화면 목록과 일치한다. 정상 화면은 시작점에서 도달 가능하며 오류 흐름은 복구 후 재진입한다.

## Mermaid
${Fence}mermaid
$flowDiagram$Fence
"@
  WriteUtf8 (Join-Path $out '서비스_흐름도.md') $flowDocument

  $screenSections=($screens|ForEach-Object{$firstAction=($_.actions|Select-Object -First 1);"### $($_.id) $($_.name)`n- 목적: $($_.purpose)`n- 진입 조건: $($_.entryConditions -join ', ')`n- 종료 조건: $firstAction 수행 또는 이전 단계 이동`n- 구성/UI: $($_.sections -join ', '), 상태 메시지, 주요/보조 버튼`n- 표시 데이터: 승인된 입력 정보와 검증 상태만 표시`n- 인터랙션·이동: $($_.actions -join ', ') → $($_.nextScreens -join ', ')`n- 상태: $($_.states -join ', ')`n- 검증: 필수 입력 누락 시 인접 오류와 복구 행동 제공`n"}) -join "`n"
  $screenDocument=@"
# VC-$($c.Id) $($c.Name) 화면 설계서

## 프로젝트 및 설계 범위
$($c.Topic)을 위한 $($screens.Count)개 저충실도 화면을 정의한다. 실제 거래·회원·외부 시스템 구현은 범위 밖이다.

## 화면 ID 규칙과 전체 목록
SCR-001부터 연속 부여하며 사이트맵·서비스 흐름도·JSON·HTML에서 동일하게 사용한다.

| ID | 화면명 | 목적 |
|---|---|---|
$(($screens|ForEach-Object{"| $($_.id) | $($_.name) | $($_.purpose) |"}) -join "`n")

## 공통 구조
- 헤더: 홈과 $($c.Menus -join ', ') 탐색.
- 본문: 제목, 목적, 핵심 콘텐츠, 상태, 주요·복구 행동.
- 푸터: 검증된 정책·문의 링크만 배치.

## 클라이언트 전용 화면 설계 원칙
- 화면 패턴: $($profile.Pattern)
- 전용 컴포넌트: $($profile.Components)
- 상태 설계: $($profile.State)
- 다른 Client의 화면 배열과 컴포넌트를 자동 병합하지 않는다.

## 화면별 설계
$screenSections

## 반응형 기준
- 모바일(0~767px): 단일 열, 44px 이상 조작 영역, 핵심 행동 우선.
- 태블릿(768~1023px): 내비게이션과 본문 균형, 카드 2열 허용.
- PC(1024px 이상): 고정 목차와 본문 2열, 읽기 폭 제한.

## 접근성 요구사항
본문 바로가기, 명확한 포커스, 의미 있는 제목 구조, 이미지 대체 텍스트, 상태 텍스트, 키보드 이동, 오류 복구 안내를 제공한다.

## Requirement 추적
$reqText

## 가정·HOLD·제외
- 가정: 프로토타입의 버튼은 같은 문서 내 화면으로 이동한다.
- HOLD: $($reqs[-1].Id) 및 승인되지 않은 운영 문구.
- 제외: 미확정 가격·영양 수치·재고·배송·효능·인증·로그인 정책.
"@
  WriteUtf8 (Join-Path $out '화면_설계서.md') $screenDocument

  $nav=($screens|ForEach-Object{"<a href=`"#$($_.id)`">$($_.id) $(Esc $_.name)</a>"}) -join "`n"
  $cards=($screens|ForEach-Object{ $screen=$_;$next=''; if($screen.nextScreens.Count){$nextId=($screen.nextScreens|Select-Object -First 1);$t=$screens|Where-Object id -eq $nextId|Select-Object -First 1;$firstAction=($screen.actions|Select-Object -First 1);$next="<a class=`"primary`" href=`"#$($t.id)`">$(Esc $firstAction) →</a>"}; $sections=($screen.sections|ForEach-Object{ $label=Esc $_; switch($c.Id){'013'{"<details class=`"faq-unit`" open><summary>$label</summary><p>검증 상태 · 핵심 답변 · 관련 문의 경로</p></details>"};'014'{"<fieldset class=`"choice-unit`"><legend>$label</legend><label><input type=`"radio`" name=`"$($screen.id)-$label`"> 허용</label><label><input type=`"radio`" name=`"$($screen.id)-$label`"> 거부</label><small>필수 여부와 목적을 행동 전에 설명</small></fieldset>"};'015'{"<div class=`"load-unit`"><strong>$label</strong><p class=`"text-ready`">핵심 텍스트 사용 가능</p><div class=`"skeleton`" aria-label=`"지연 로딩 영역`"></div><button type=`"button`">미디어 다시 불러오기</button></div>"};'016'{"<div class=`"locale-unit`"><strong>$label</strong><p><span class=`"context-chip`">현재 지역</span> 공통 정보 / 지역 정보</p><button type=`"button`">언어·지역 적용</button></div>"};'017'{"<article class=`"asset-unit`"><header><strong>$label</strong><span class=`"badge`">승인 상태</span></header><dl><dt>소유자</dt><dd>검증 필요</dd><dt>기준일</dt><dd>미확정</dd></dl></article>"};'018'{"<article class=`"campaign-unit`"><p class=`"campaign-tag`">유입 메시지</p><h3>$label</h3><p>기간·대상·상태를 CTA 전에 확인</p><button type=`"button`">조건 확인</button></article>"};'019'{"<div class=`"metric-unit`"><strong>$label</strong><ol><li>사용자 목표</li><li>행동</li><li>결과</li></ol><label><input type=`"checkbox`"> 비필수 측정 허용</label></div>"};'020'{"<section class=`"alert-unit`" aria-label=`"안전 공지 영역`"><strong>주의 · $label</strong><p>영향 범위와 기준일을 텍스트로 확인</p><label>제품 식별 <input aria-label=`"제품 식별 정보`"></label></section>"}} }) -join ''; "<section class=`"screen $($profile.Class)`" id=`"$($screen.id)`" tabindex=`"-1`"><header class=`"screen-head`"><p class=`"eyebrow`">$($screen.id) · $(Esc $profile.Pattern)</p><h2>$(Esc $screen.name)</h2><p>$(Esc $screen.purpose)</p></header><div class=`"blocks`">$sections</div><p class=`"status`"><strong>상태 설계:</strong> $(Esc $profile.State)</p><div class=`"actions`">$next<a href=`"#SCR-001`">홈으로</a></div></section>"}) -join "`n"
  $html=@"
<!doctype html><html lang="ko"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>VC-$($c.Id) $($c.Name) 와이어프레임</title><style>
:root{font-family:Arial,'Noto Sans KR',sans-serif;color:#17221b;background:#eef2ee}*{box-sizing:border-box}body{margin:0}.skip{position:absolute;left:-9999px}.skip:focus{left:1rem;top:1rem;background:#fff;padding:.8rem;z-index:9}.layout{display:grid;grid-template-columns:260px 1fr;min-height:100vh}aside{background:#183d2d;color:#fff;padding:1.2rem;position:sticky;top:0;height:100vh;overflow:auto}nav{display:grid;gap:.45rem}nav a{color:#fff;padding:.55rem;border:1px solid #719183;border-radius:.35rem;text-decoration:none}main{padding:2rem;max-width:1100px}.screen{background:#fff;border:2px solid #94a69d;border-radius:.7rem;padding:1.4rem;margin:0 0 2rem;scroll-margin-top:1rem}.screen:focus{outline:4px solid #e49b21}.eyebrow{font-weight:bold}.blocks{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:.8rem}.blocks>*{border:2px solid #839188;padding:1rem;min-height:110px}.status{border-left:5px solid #a86600;padding:.7rem;background:#fff6df}.actions{display:flex;gap:.6rem;flex-wrap:wrap}.actions a,.blocks button{display:inline-block;padding:.75rem 1rem;border:2px solid #183d2d;color:#183d2d;background:#fff;text-decoration:none;min-height:44px}.actions .primary{background:#183d2d;color:#fff}.faq-unit summary{font-weight:bold;cursor:pointer}.choice-unit{display:grid;gap:.6rem}.choice-unit label{padding:.5rem;border:1px solid #aaa}.performance .blocks{grid-template-columns:1fr}.skeleton{height:36px;background:repeating-linear-gradient(90deg,#ddd,#eee 20px,#ddd 40px);margin:.7rem 0}.locale-unit{border-inline-start:8px solid #3568a8}.context-chip,.badge,.campaign-tag{display:inline-block;padding:.25rem .5rem;background:#dce8df;font-weight:bold}.asset-unit header{display:flex;justify-content:space-between}.asset-unit dl{display:grid;grid-template-columns:auto 1fr;gap:.3rem}.campaign .screen-head{background:#fff0cf;padding:1rem}.campaign-unit{border-radius:1rem}.measurement .blocks{grid-template-columns:repeat(3,minmax(0,1fr))}.metric-unit ol{padding-left:1.2rem}.safety{border-width:4px}.alert-unit{border-color:#9d2c20!important;background:#fff1ef}.alert-unit strong{color:#7d160d}a:focus,button:focus,input:focus{outline:4px solid #e49b21;outline-offset:2px}@media(max-width:1023px){.layout{grid-template-columns:210px 1fr}.measurement .blocks{grid-template-columns:1fr 1fr}}@media(max-width:767px){.layout{display:block}aside{position:static;height:auto}nav{grid-template-columns:1fr 1fr}main{padding:1rem}.screen{padding:1rem}.blocks,.measurement .blocks{grid-template-columns:1fr}.privacy .actions{flex-direction:column}.safety .actions{position:sticky;bottom:0;background:#fff;padding:.5rem}}
</style></head><body><a class="skip" href="#main">본문 바로가기</a><div class="layout"><aside><h1>VC-$($c.Id) $($c.Name)</h1><p>$(Esc $c.Topic)</p><nav aria-label="화면 목차">$nav</nav></aside><main id="main"><h1>저충실도 와이어프레임</h1><p>가격·효능·재고 등 미확정 정보는 표시하지 않습니다.</p>$cards</main></div><script>document.addEventListener('click',function(e){const a=e.target.closest('a[href^="#SCR-"]');if(a){const t=document.querySelector(a.getAttribute('href'));if(t){e.preventDefault();t.scrollIntoView({behavior:'smooth'});t.focus();}}});</script></body></html>
"@
  WriteUtf8 (Join-Path $out '와이어프레임.html') $html
}

Write-Output "Generated design sources for $($clients.Count) clients."
