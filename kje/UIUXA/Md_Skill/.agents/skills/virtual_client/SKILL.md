---
name: yovia-virtual-client-synthesis
description: YOVIA 브랜드 자료와 사전 분석된 가상 클라이언트·페르소나 자료를 통합하여, 근거 추적 가능한 다수의 YOVIA 전용 가상 클라이언트와 상세 요구사항을 생성하는 Skill. 페르소나를 단순 복제하지 않고 실제 UX/UI 프로젝트 발주자 관점으로 변환하며, 요구사항의 출처·우선순위·브랜드 적합성·충돌 관계를 보존한다.
---

# YOVIA 가상 클라이언트 생성 Skill

## 1. 역할

이 Skill은 YOVIA UX/UI 설계의 다음 단계를 위한 **가상 클라이언트 합성 엔진**이다.

현재 단계의 목적은 자료를 하나의 평균 페르소나로 요약하는 것이 아니다.

다음 자료에서 확인된 사용자 행동, 문제, 니즈, 구매 판단 기준, 디자인 기대, 기능 요구, 사용 상황을 근거 단위로 추출하고, 이를 **YOVIA 프로젝트를 실제로 발주하는 가상의 이해관계자 관점**으로 변환한다.

```text
브랜드 자료
+ 가상 클라이언트 PDF 분석 결과
+ 페르소나 TXT 분석 결과
+ 사용 가능한 기타 검증 분석 결과
↓
근거 추출
↓
사용자 문제·니즈·판단 기준 구조화
↓
페르소나 → 발주자 관점 변환
↓
YOVIA 전용 가상 클라이언트 생성
↓
클라이언트별 상세 요구사항 생성
↓
공통·특화·충돌·예외 요구 관계 분석
↓
다음 화면 구성요소 도출 단계의 입력 데이터 생성
```

이 Skill은 최종 IA, 화면 설계, 와이어프레임, Figma, 스토리보드를 생성하지 않는다.

---

## 2. YOVIA 최상위 브랜드 고정 조건

사용자가 직접 확정한 다음 정의를 최상위 고정 조건으로 사용한다.

> **YOVIA는 그릭요거트를 베이스로, 바쁜 일상에서도 간편하게 건강한 식습관을 이어갈 수 있도록 돕는 간편 건강식 브랜드다.**

이 정의는 다른 분석 결과, 레퍼런스, 페르소나 요구, 모델 추론으로 변경하지 않는다.

### 해석 규칙

- YOVIA의 현재 핵심 카테고리는 **그릭요거트 기반 간편 건강식**이다.
- 일반적인 건강식 브랜드로 범위를 임의 확장하지 않는다.
- 샐러드, 프로틴바, 건강음료 등 그릭요거트와 직접 관련 없는 제품을 현재 핵심 제품으로 임의 생성하지 않는다.
- 브랜드 자료에서 향후 확장 제품이 명시된 경우에만 `CANDIDATE`로 기록한다.
- 페르소나가 새로운 제품이나 기능을 요구하더라도 이를 YOVIA의 확정 제품으로 자동 승격하지 않는다.

---

## 3. 정보 우선순위

자료 간 내용이 다르거나 충돌하면 다음 순서로 판단한다.

```text
1. 사용자의 현재 명시적 확정사항
2. 사용자가 제공한 YOVIA 원본 브랜드 자료
3. 검증 완료된 가상 클라이언트 PDF 분석 결과
4. 검증 완료된 페르소나 TXT 분석 결과
5. 기존 YOVIA 리서치·분류·분석 결과
6. 모델의 분석적 추론
```

하위 자료가 상위 자료를 덮어쓰지 않는다.

모델 추론은 브랜드 사실로 기록하지 않고 반드시 `derived` 또는 `hypothesis`로 표시한다.

---

## 4. 기본 입력 경로

프로젝트 루트:

```text
C:\kje\UIUXA\Md_Skill
```

권장 입력 위치:

```text
input/
├─ 00_brand/
│  └─ YOVIA 관련 브랜드 원본 자료
├─ 02_virtual_client/
│  └─ 가상 클라이언트 PDF 및/또는 검증된 분석 결과
└─ 03_persona/
   └─ 페르소나 TXT 및/또는 검증된 분석 결과
```

기존 파이프라인 자료를 보조 근거로 사용할 수 있다.

```text
output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
output/02_classification/YOVIA_REFERENCE_CLASSIFICATION.md
output/03_analysis/YOVIA_RESEARCH_ANALYSIS.md
```

### 현재 인터뷰 음성 처리

검증된 전사본 또는 검증 완료된 인터뷰 분석 결과가 없는 M4A 파일은 현재 가상 클라이언트 생성 근거로 사용하지 않는다.

```text
source_status: pending_transcription
```

음성 내용을 추측하거나 보완 생성하지 않는다.

---

## 5. 브랜드 기준 정보 자동 추출

가상 클라이언트를 생성하기 전에 `input/00_brand/`의 YOVIA 브랜드 자료를 읽고 내부 브랜드 기준을 구성한다.

추출 대상:

- 브랜드 정의
- 제품 정의
- 핵심 제품 형태
- 현재 제품 범위
- 향후 확장 후보
- 핵심 타깃
- 보조 타깃
- 주요 사용 상황
- 해결하려는 사용자 문제
- 핵심 가치
- 차별점
- 패키지 특징
- 브랜드 톤과 성격
- 구매·사용 경험
- 확정 기능
- 검토 중 기능
- 금지·회피 방향
- 검증이 필요한 건강·효능 표현

각 항목은 다음 상태 중 하나로 표시한다.

```text
CONFIRMED
CANDIDATE
HYPOTHESIS
NOT_VERIFIED
```

### 상태 정의

- `CONFIRMED`: 사용자가 직접 확정했거나 원본 브랜드 자료에서 명확하게 확인되는 내용
- `CANDIDATE`: 기획·분석에서 제안됐지만 최종 확정 여부가 불명확한 내용
- `HYPOTHESIS`: 페르소나·사용자 조사 또는 분석에서 나온 가설
- `NOT_VERIFIED`: 현재 자료로 확인할 수 없는 내용

`CANDIDATE`, `HYPOTHESIS`, `NOT_VERIFIED`를 브랜드 확정 사실처럼 사용하지 않는다.

---

## 6. Source ID 규칙

사용되는 모든 주요 자료에 Source ID를 부여한다.

```text
SRC-BRAND-001
SRC-BRAND-002

SRC-PDF-001
SRC-PDF-002
SRC-PDF-003

SRC-PER-001
SRC-PER-002

SRC-REF-001
```

이미 기존 문서에 고유 ID가 있다면 가능한 한 기존 ID를 유지하고 Source ID와 연결한다.

---

## 7. Evidence 추출 규칙

원자료를 바로 가상 클라이언트 요구사항으로 변환하지 않는다.

반드시 다음 변환 체인을 사용한다.

```text
SOURCE
→ EVIDENCE
→ INSIGHT
→ NEED
→ DESIGN IMPLICATION
→ VIRTUAL CLIENT
→ REQUIREMENT
```

각 Evidence에 ID를 부여한다.

```text
EVD-0001
EVD-0002
EVD-0003
```

### Evidence 상태

각 Evidence는 다음 중 하나로 표시한다.

```text
observed
stated
derived
hypothesis
synthetic
not_verified
conflict
```

- `observed`: 자료에서 직접 확인된 행동 또는 사실
- `stated`: 사용자가 직접 표현한 요구·선호·불편
- `derived`: 둘 이상의 근거를 분석하여 도출한 내용
- `hypothesis`: 아직 검증되지 않은 가설
- `synthetic`: 가상 클라이언트화 과정에서 만든 이름·직책·발주 표현
- `not_verified`: 확인 불가
- `conflict`: 다른 근거와 상충

실제 사용자 행동과 모델의 추론을 동일한 사실처럼 작성하지 않는다.

---

## 8. 페르소나와 가상 클라이언트의 구분

### 페르소나

YOVIA를 사용하거나 구매할 가능성이 있는 **사용자 관점**이다.

예:

```text
아침 시간이 부족하다.
숟가락을 챙기기 번거롭다.
제품이 가방에서 새는 것이 걱정된다.
```

### 가상 클라이언트

위 사용자 문제를 해결하기 위해 YOVIA 브랜드·제품·웹사이트 UX/UI 프로젝트를 발주하는 **가상의 이해관계자 관점**이다.

예:

```text
출근형 사용자의 모바일 제품 경험을 담당하는 Product Manager
```

요구사항:

```text
첫 화면에서 사용자가 제품을 보자마자
도구 없이 간편하게 섭취할 수 있는 제품이라는 점을
이해할 수 있도록 구성해주세요.
```

페르소나 문장을 이름만 바꾸어 가상 클라이언트로 복제하지 않는다.

---

## 9. 가상 클라이언트 생성 원칙

### 9.1 수량 원칙

가상 클라이언트 수를 임의로 최소화하지 않는다.

`5명 정도면 충분하다`와 같은 임의 상한을 두지 않는다.

**새로운 설계 의사결정 축이 더 이상 나오지 않을 때까지** 의미 있는 관점을 계속 분리한다.

다만 단순히 수량을 늘리기 위한 중복 생성은 금지한다.

### 9.2 별도 클라이언트로 분리할 판단 축

다음 중 하나 이상이 실질적으로 다르면 별도 가상 클라이언트 후보로 유지한다.

- 사업 목표
- 타깃 세그먼트
- 핵심 사용 상황
- Pain Point
- 구매 판단 기준
- 정보 우선순위
- 제품 기대
- UX 요구
- UI 요구
- 콘텐츠 요구
- 디자인 요구
- 신뢰 기준
- 가격 태도
- 접근성 요구
- 사용 기기
- 사용 장소
- 구매·전환 목표
- 반복 구매 조건
- 브랜드에 기대하는 정서

### 9.3 분리하지 않는 경우

다음처럼 표현만 다른 요구는 새 클라이언트를 만들기 위한 근거로 사용하지 않는다.

```text
사용이 편해야 한다.
쉽게 사용할 수 있어야 한다.
사용성이 좋아야 한다.
```

동일한 설계 의사결정으로 귀결되면 하나의 상위 요구로 연결한다.

---

## 10. 가상 클라이언트 ID

각 클라이언트에는 고유 ID를 부여한다.

```text
VC-001
VC-002
VC-003
...
```

기존 정상 결과를 갱신할 때는 기존 ID를 가능한 한 유지한다.

새로운 클라이언트는 마지막 번호 다음부터 추가한다.

---

## 11. 가상 클라이언트 생성 정보

각 가상 클라이언트에는 최소 다음 필드를 작성한다.

```text
Client ID
Client Name
Synthetic Role
Client Type
Source IDs
Evidence IDs
Evidence Confidence
Target User
Project Context
Business Goal
Conversion Goal
Main User Problem
Primary Decision Criteria
Important Values
Information Priorities
Functional Priorities
UX Priorities
UI Priorities
Content Priorities
Visual Priorities
Trust Priorities
Responsive / Device Priorities
Constraints
Avoid
Open Questions
```

가상 클라이언트의 이름·직책은 `synthetic`일 수 있다.

그러나 핵심 요구, 판단 기준, 사용자 문제는 반드시 Source/Evidence에 연결한다.

---

## 12. 요구사항 생성 원칙

한 가상 클라이언트당 요구사항 개수를 임의로 제한하지 않는다.

자료에서 근거가 충분하다면 10개, 20개, 30개 이상도 유지할 수 있다.

### 금지

- 같은 요구를 문장만 바꾸어 반복
- 근거 없이 기능 추가
- 현재 제품과 무관한 제품군 생성
- 가설을 확정 기능처럼 표현
- 브랜드와 충돌하는 요구를 몰래 삭제

### 요구사항 작성 형태

가능한 한 실제 발주자가 디자이너·기획자에게 요청하는 형태로 작성한다.

나쁜 예:

```text
휴대성 중요.
```

좋은 예:

```text
제품 상세 정보를 보기 전에도 사용자가 YOVIA가 이동 상황에서 간편하게 섭취할 수 있는 제품이라는 점을 이해할 수 있도록 핵심 사용 장면을 명확하게 보여주세요.
```

---

## 13. Requirement ID

```text
VC001-REQ-001
VC001-REQ-002
VC002-REQ-001
...
```

각 Requirement는 하나 이상의 Source/Evidence와 연결한다.

---

## 14. 요구사항 필드

모든 Requirement에는 다음 필드를 기록한다.

```text
Requirement ID
Virtual Client ID
Request
Category
Priority
Source IDs
Evidence IDs
Evidence Type
Evidence Confidence
Brand Fit
Brand Fit Reason
Relationship Type
Conflict With
Validation Needed
Notes
```

---

## 15. 요구사항 Category

기본 카테고리:

```text
Business
Brand
Content
Information
UX
UI
Navigation
Interaction
Conversion
Product Understanding
Trust
Accessibility
Responsive
Visual
Purchase
Retention
Technical
Constraint
```

필요하면 세부 카테고리를 추가할 수 있으나, 같은 의미의 카테고리를 새 이름으로 중복 생성하지 않는다.

---

## 16. Priority

```text
Must
Should
Could
Hold
```

### 정의

- `Must`: 목표 달성에 필수 또는 고정 조건
- `Should`: 중요하지만 상황에 따라 조정 가능
- `Could`: 여건이 되면 적용할 가치가 있음
- `Hold`: 추가 검증 전 채택하지 않음

---

## 17. Evidence Confidence

```text
High
Medium
Low
Not verified
```

중요도와 근거 강도를 혼동하지 않는다.

예:

```text
Priority: Must
Evidence Confidence: Low
```

도 가능하다.

---

## 18. YOVIA Brand Fit

모든 Requirement는 다음 중 하나로 평가한다.

```text
High
Medium
Low
Conflict
```

반드시 판정 이유를 기록한다.

### 규칙

- 사용자가 원한다고 해서 YOVIA에 자동 채택하지 않는다.
- `Conflict` 요구도 삭제하지 않는다.
- YOVIA가 그릭요거트 기반 간편 건강식 브랜드라는 최상위 조건과 충돌하는 요구는 특별히 표시한다.
- 건강·효능 관련 주장은 브랜드 자료에서 확정되지 않았다면 `Validation Needed: true`로 처리한다.

---

## 19. 요구사항 관계 분석

전체 Requirement를 다음 관계로 연결한다.

```text
COMMON
MAJORITY
SPECIALIZED
CONFLICT
EXCEPTION
DERIVED
VALIDATION_REQUIRED
BRAND_CONFLICT
```

### 의미

- `COMMON`: 다수의 서로 다른 가상 클라이언트에서 반복
- `MAJORITY`: 주요 세그먼트 여러 개에서 반복
- `SPECIALIZED`: 특정 사용 상황에 특화
- `CONFLICT`: 다른 요구와 동시에 만족하기 어려움
- `EXCEPTION`: 특수 환경에서만 중요
- `DERIVED`: 직접 발언이 아니라 근거를 통해 논리적으로 도출
- `VALIDATION_REQUIRED`: 추가 조사 필요
- `BRAND_CONFLICT`: YOVIA 브랜드 기준과 충돌

충돌 요구를 억지로 하나의 평균 요구로 합치지 않는다.

---

## 20. 유사 요구 처리

유사 요구는 삭제하지 않고 **상위 Need로 연결**한다.

예:

```text
출근 중 한 손 섭취
업무 중 책상 오염 방지
운동 후 빠른 섭취
```

상위 Need:

```text
빠르고 번거롭지 않은 섭취 경험
```

세부 요구는 각각 유지한다.

이 Skill의 통합 원칙은 다음과 같다.

> **합치되, 세부 맥락을 줄이지 않는다.**

---

## 21. 가상 클라이언트 상세 문서 구조

각 `VC_XXX.md`는 다음 구조를 따른다.

```md
# VC-XXX — [가상 클라이언트명]

## 1. 생성 정보
- Client ID:
- 생성 유형: synthetic virtual client
- 기반 Source:
- 기반 Evidence:
- Evidence Confidence:

## 2. 기본 정보
- 역할:
- 담당 영역:
- 프로젝트 관점:
- 핵심 타깃:
- 주요 사용 상황:
- 사업 목표:
- 전환 목표:

## 3. 핵심 사용자 문제
- ...

## 4. 중요하게 보는 가치
- ...

## 5. 정보 우선순위
- ...

## 6. 기능 요구
- ...

## 7. UX 요구
- ...

## 8. UI 요구
- ...

## 9. 콘텐츠 요구
- ...

## 10. 비주얼 요구
- ...

## 11. 신뢰 요구
- ...

## 12. 전환·구매 요구
- ...

## 13. 반응형·디바이스 요구
- ...

## 14. 금지·회피 사항
- ...

## 15. 전체 요구사항
| ID | 요구사항 | Category | Priority | Evidence | Confidence | Brand Fit |
|---|---|---|---|---|---|---|

## 16. 다른 가상 클라이언트와의 관계
- 공통:
- 보완:
- 충돌:
- 특화:

## 17. 추가 검증 필요
- ...
```

---

## 22. Master 출력 구조

### `YOVIA_VIRTUAL_CLIENT_MASTER.md`

다음을 포함한다.

- 생성 기준
- 사용 Source 목록
- 제외·보류 Source
- 전체 가상 클라이언트 수
- 가상 클라이언트 목록
- 클라이언트별 핵심 관점
- 클라이언트별 Requirement 수
- 주요 공통 관점
- 주요 충돌 관점
- 추가 검증 필요 관점

### `YOVIA_REQUIREMENT_MASTER.md`

모든 Requirement를 통합 관리한다.

최소 필드:

```text
Requirement ID
Virtual Client
Request
Category
Priority
Source
Evidence
Confidence
Brand Fit
Relationship Type
Conflict
Validation Needed
```

### `YOVIA_SOURCE_TRACEABILITY.md`

다음 경로를 추적할 수 있어야 한다.

```text
Source
→ Evidence
→ Insight / Need
→ Virtual Client
→ Requirement
```

---

## 23. Coverage Matrix

전체 가상 클라이언트와 핵심 요구 영역을 교차 분석한다.

예:

| 요구 영역 | VC-001 | VC-002 | VC-003 | 반복 수 | Must 수 | 평균 근거 강도 |
|---|---|---|---|---:|---:|---|
| 간편 섭취 | ● | ● |  | 2 | 2 | High |
| 영양 정보 | ● | ● | ● | 3 | 2 | High |
| 프리미엄 비주얼 |  |  | ● | 1 | 0 | Medium |

Coverage Matrix는 다음 단계에서 화면 구성요소 우선순위를 결정하는 근거로 사용한다.

---

## 24. 출력 경로

기본 출력 위치:

```text
C:\kje\UIUXA\Md_Skill\output\04_virtual_clients\
```

구조:

```text
output/04_virtual_clients/
├─ YOVIA_VIRTUAL_CLIENT_MASTER.md
├─ YOVIA_REQUIREMENT_MASTER.md
├─ YOVIA_SOURCE_TRACEABILITY.md
└─ clients/
   ├─ VC_001.md
   ├─ VC_002.md
   ├─ VC_003.md
   └─ ...
```

이 폴더의 `clients/`가 이후 분석 Skill에서 참조할 **[가상 클라이언트 모아둔 곳]**이다.

---

## 25. 후속 Analyze Skill과의 데이터 계약

후속 분석 Skill이 가상 클라이언트를 사용할 때는 다음을 읽는다.

```text
output/04_virtual_clients/YOVIA_VIRTUAL_CLIENT_MASTER.md
output/04_virtual_clients/YOVIA_REQUIREMENT_MASTER.md
output/04_virtual_clients/YOVIA_SOURCE_TRACEABILITY.md
output/04_virtual_clients/clients/
```

후속 분석 Skill은 가상 클라이언트의 Source/Evidence를 임의 변경하지 않는다.

가상 클라이언트별 요구사항을 평가 기준으로 사용하되, 서로 다른 클라이언트의 요구를 처음부터 하나로 평균화하지 않는다.

---

## 26. 다음 단계에 넘길 데이터

이 Skill의 결과는 다음 단계에서 최소 다음 질문에 답할 수 있어야 한다.

```text
어떤 사용자가 어떤 문제를 가지고 있는가?
어떤 가상 클라이언트가 그 문제를 중요하게 보는가?
어떤 요구사항이 반복되는가?
어떤 요구사항이 서로 충돌하는가?
어떤 요구가 YOVIA에 가장 적합한가?
어떤 요구가 Must인가?
어떤 요구가 추가 검증이 필요한가?
어떤 Source/Evidence에서 이 요구가 나왔는가?
```

---

## 27. 금지 사항

- 페르소나를 그대로 가상 클라이언트라고 부르는 것
- 가상 클라이언트 수를 임의로 5명이나 10명으로 제한하는 것
- 수량을 늘리기 위해 동일한 클라이언트를 복제하는 것
- 유사 요구의 세부 사용 상황을 삭제하는 것
- 충돌 요구를 임의로 평균화하는 것
- YOVIA를 일반 건강식 브랜드로 확장하는 것
- 그릭요거트와 무관한 제품을 현재 핵심 제품으로 생성하는 것
- 페르소나의 아이디어를 확정 제품 사양으로 승격하는 것
- 건강·효능 가설을 검증된 효능처럼 쓰는 것
- Source가 없는 핵심 Requirement 생성
- 현재 단계에서 IA·화면 구성·Wireframe·Figma·Storyboard 생성
- 검증되지 않은 인터뷰 음성 내용을 추측하여 사용하는 것

---

## 28. 완료 검증

완료 전 다음을 검사한다.

```text
[ ] YOVIA 최상위 브랜드 정의가 적용됨
[ ] 브랜드 원본 자료 검토 완료
[ ] CONFIRMED / CANDIDATE / HYPOTHESIS / NOT_VERIFIED 구분
[ ] 사용 가능한 Source 전체 확인
[ ] 미사용·보류 Source 기록
[ ] Source ID 부여
[ ] Evidence ID 부여
[ ] SOURCE → EVIDENCE → INSIGHT → NEED 변환 추적 가능
[ ] 페르소나 → 가상 클라이언트 변환 완료
[ ] 의미 있는 관점이 지나치게 통합되지 않음
[ ] 의미 없는 중복 클라이언트 없음
[ ] 새 설계 의사결정 축이 없을 때까지 클라이언트 생성 검토
[ ] 각 클라이언트의 상세 Requirement 생성
[ ] Requirement ID 부여
[ ] Priority 지정
[ ] Evidence Confidence 지정
[ ] Brand Fit 판정 및 이유 작성
[ ] 공통·다수·특화·충돌·예외 요구 관계 분석
[ ] 브랜드 충돌 요구 보존
[ ] 추가 검증 필요 요구 보존
[ ] Source Traceability 완성
[ ] Coverage Matrix 생성
[ ] 후속 분석 Skill이 읽을 수 있는 출력 구조 완성
[ ] 현재 단계에서 IA 또는 Wireframe을 생성하지 않음
```

핵심 항목이 하나라도 충족되지 않으면 완료로 판정하지 않는다.

---

## 29. 완료 보고

완료 후 사용자에게 다음만 간단히 보고한다.

```text
- 사용 Source 수
- 보류 Source 수
- 생성 가상 클라이언트 수
- 생성 Requirement 총수
- Must / Should / Could / Hold 수
- COMMON / SPECIALIZED / CONFLICT 수
- Brand Fit Conflict 수
- Validation Required 수
- 후속 분석/화면 구성 단계 진행 가능 여부
```

다음 단계를 자동 실행하지 않는다.
