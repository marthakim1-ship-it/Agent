# YOVIA 레퍼런스 리서치·분류·분석·가상 클라이언트 통합 실행 규칙

## 1. 역할

이 `AGENTS.md`는 YOVIA 브랜드 웹사이트의 레퍼런스 리서치·분류·분석과 가상 클라이언트 생성 작업을 통제하는 단일 마스터 실행 규칙이다.

하나의 CLI가 기본 레퍼런스 파이프라인에서 세 Skill을 실행하며, 사용자가 명시적으로 요청한 경우 가상 클라이언트 생성 Skill을 추가 실행한다.

```text
기본 레퍼런스 파이프라인:
리서치 → 분류 → 분석 → 단계/최종 결론

선택 확장:
검증된 브랜드·가상 클라이언트·페르소나 자료
+ 사용 가능한 리서치·분류·분석 결과
→ 가상 클라이언트 생성
→ 완료 보고
```

이 파일은 다음을 통제한다.

- 실행 순서
- 읽을 파일 위치
- 저장 파일 위치
- 기존·실패·폐기 파일 보관 위치
- 단계별 검증과 중단 조건
- 선행 결과 변경 시 후속 결과 재생성
- 최종 `1팀 창의적 결론 → 2팀 직관적 결론 → 통합 결론` 보고
- 가상 클라이언트 생성 단계의 발동 조건·입력·출력·검증·아카이브

`1팀`과 `2팀`은 실제 사람이나 별도 CLI가 아니다. 하나의 CLI가 동일한 검증 데이터를 바탕으로 서로 다른 관점의 가상 팀 역할을 순차 수행한다.

최종 `1팀 창의적 결론 → 2팀 직관적 결론 → 통합 결론` 보고는 일반 전체 실행이 완료되었거나, 단계형 실행의 최종 누적 목표인 **200개(Phase 3)**가 완료된 뒤 한 번만 수행한다. 20개와 70개에서는 단계 결론만 보고하고 두 팀 최종 보고를 수행하지 않는다.

---

## 2. 프로젝트 루트

```text
C:\kje\UIUXA\Md_Skill
```

모든 상대경로는 위 프로젝트 루트를 기준으로 해석한다.

프로젝트 밖의 파일은 사용자가 직접 지정한 경우에만 읽는다. 프로젝트 밖의 파일을 임의로 수정·이동·삭제하지 않는다.

---

## 3. 핵심 파일 5개

```text
C:\kje\UIUXA\Md_Skill
│
├─ AGENTS.md
└─ .agents
   └─ skills
      ├─ research
      │  └─ SKILL.md
      ├─ classify
      │  └─ SKILL.md
      ├─ analyze
      │  └─ SKILL.md
      └─ virtual_client
         └─ SKILL.md
```

각 파일 역할:

| 파일 | 역할 |
|---|---|
| `AGENTS.md` | 전체 실행·경로·검증·아카이브·최종 보고 통제 |
| `.agents/skills/research/SKILL.md` | 공식 웹사이트 원시 리서치 DB 생성·갱신 |
| `.agents/skills/classify/SKILL.md` | 200개 공통 디자인 패턴 집계·콘셉트 선정·제품 관련성 및 디자인 적합도 이중 분류 |
| `.agents/skills/analyze/SKILL.md` | 분류 결과를 검증하며 전체 패턴을 해석하고 YOVIA 적용 방향·우선순위·위험을 분석 |
| `.agents/skills/virtual_client/SKILL.md` | YOVIA 브랜드·가상 클라이언트·페르소나 및 검증 분석 자료를 근거로 가상 클라이언트와 상세 요구사항 데이터셋 생성 |

이 문서에 등록된 Skill 외에 사용자 요청 없이 추가 Skill, 템플릿, 상태표, 로그 문서를 만들지 않는다.

`virtual_client`는 기존 `20개 → 70개 → 200개` 레퍼런스 누적 실행에 자동 포함하지 않는다. 사용자가 가상 클라이언트 생성을 명시적으로 요청한 경우에만 실행한다.

### 내장 단계형 실행 규칙

`20개 → 70개 → 200개` 누적 실행 규칙은 이 `AGENTS.md`에 직접 내장되어 있다.

별도의 통합 실행 MD나 추가 명령서는 필요하지 않다.

사용자가 `20개`, `70개`, `200개` 중 하나를 요청하면 이 파일의 수량 명령 규칙에 따라 해당 Phase를 직접 실행한다.

---

## 4. 작업 디렉터리

없으면 실행 전에 생성한다.

```text
input/
input/00_brand/
input/01_research/
input/02_virtual_client/
input/03_persona/

output/
output/01_research/
output/02_classification/
output/03_analysis/
output/04_virtual_clients/
output/04_virtual_clients/clients/

archive/
archive/previous/
archive/failed/
archive/discarded/
```

입력 역할:

```text
input/00_brand/
= YOVIA 브랜드 원본 자료

input/01_research/
= 레퍼런스 리서치 기준 자료

input/02_virtual_client/
= 가상 클라이언트 PDF 및/또는 검증된 개별 분석 결과

input/03_persona/
= 페르소나 TXT 및/또는 검증된 개별 분석 결과
```

가상 클라이언트 생성 출력의 `output/04_virtual_clients/clients/`는 후속 UX/UI 설계 단계가 참조하는 가상 클라이언트 저장소다.

---

## 5. Skill 경로

```text
연구:
.agents/skills/research/SKILL.md

분류:
.agents/skills/classify/SKILL.md

분석:
.agents/skills/analyze/SKILL.md

가상 클라이언트 생성:
.agents/skills/virtual_client/SKILL.md
```

각 파일은 정확히 `SKILL.md`여야 한다.

각 Skill의 YAML frontmatter에 `name`과 `description`이 있어야 한다.

Skill이 없거나 읽을 수 없으면 해당 단계를 실행하지 않는다.

규칙 충돌 시 우선순위:

```text
1. 사용자의 현재 명시적 요청
2. AGENTS.md
3. 각 SKILL.md
4. 기존 출력 파일의 관행
```

기본 레퍼런스 파이프라인은 `research → classify → analyze` 세 Skill로 유지한다. `virtual_client`는 별도 4단계이며 명시적 요청 시에만 실행한다.

---

## 6. 고정 입출력 경로

### 단계형 누적 실행

단계형 실행은 이 `AGENTS.md`의 내장 규칙으로 직접 통제한다.

```text
20개 = Phase 1
70개 = Phase 2
200개 = Phase 3
```

외부 통합 실행 파일을 찾거나 읽지 않는다.

### 리서치 입력

기본 입력 디렉터리:

```text
input/01_research/
```

기존 리서치 기준 파일이 있다면 기본 위치:

```text
input/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
```

입력 우선순위:

```text
1. 사용자가 현재 명령에서 지정한 파일
2. input/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
3. ../Antigravity/research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
4. 기존 output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
5. 위 자료가 없거나 사용할 수 없을 때만 research Skill에 따라 신규 조사
```

`../Antigravity/research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md`는 프로젝트 루트
`C:\kje\UIUXA\Md_Skill` 기준으로 다음 기존 자료를 가리킨다.

```text
C:\kje\UIUXA\Antigravity\research\YOVIA_BRAND_REFERENCE_RESEARCH_200.md
```

### 기존 리서치 자료 처리 분기

기존 자료를 발견하면 신규 웹조사보다 먼저 다음 순서로 처리한다.

```text
기존 자료 발견
→ 파일 판독 가능 여부 확인
→ 레코드 수·ID·필수 섹션·URL 상태·조사 상태·공식 사이트 근거 검증
→ 사용 가능 상태 판정
```

#### 기존 자료가 유효한 경우

```text
신규 전체 웹조사 생략
→ 원본 파일은 수정·이동·삭제하지 않음
→ 현재 출력 스키마에 맞게 정규화
→ output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md에 저장
→ research 품질 검사
→ 통과하면 classify로 이동
```

#### 기존 자료가 일부 불완전한 경우

```text
기존에 확인된 사실과 근거 유지
→ 누락·오류·not_verified 항목만 제한적으로 재검증
→ 전체 200개를 처음부터 다시 조사하지 않음
→ 정규화 결과 저장 후 품질 검사
```

#### 기존 자료가 없거나 사용할 수 없는 경우

다음 중 하나에 해당할 때만 신규 전체 조사를 허용한다.

- 지정 경로에 파일이 없음
- 파일을 읽을 수 없음
- 레코드 ID나 필수 구조가 심하게 손상됨
- URL 상태·조사 상태·공식 사이트 근거를 추적할 수 없음
- 사용자가 명시적으로 전면 재조사를 요청함

기존 자료가 유효한데도 최신화라는 이유만으로 전체 사이트를 다시 조사하지 않는다.

예외:

사용자가 `20개`, `70개`, `200개` 단계형 누적 실행을 요청하면, 해당 요청은 현재 Phase 신규 ID 범위에 대한 **전면 신규 리서치 명령**으로 해석한다.

해당 Phase의 신규 ID 범위는 공식 사이트를 기준으로 새로 조사한다. 이전 Phase에서 검증을 통과한 누적 레코드는 다시 전면 조사하지 않고 선행 결과로 사용한다.

### 리서치 출력

```text
output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
```

### 분류 입력

```text
.agents/skills/classify/SKILL.md
output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
```

### 분류 출력

```text
output/02_classification/YOVIA_REFERENCE_CLASSIFICATION.md
```

### 분석 입력

```text
.agents/skills/analyze/SKILL.md
output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
output/02_classification/YOVIA_REFERENCE_CLASSIFICATION.md
```

분석은 분류 결과뿐 아니라 원본 리서치도 반드시 함께 읽는다.

### 분석 출력

```text
output/03_analysis/YOVIA_RESEARCH_ANALYSIS.md
```

### 가상 클라이언트 생성 입력

Skill:

```text
.agents/skills/virtual_client/SKILL.md
```

필수 입력:

```text
input/00_brand/
input/02_virtual_client/
input/03_persona/
```

필수 입력은 각 폴더의 원본 자료 또는 사전에 검증된 개별 분석 결과를 의미한다.

사용 가능한 경우 다음 레퍼런스 파이프라인 결과를 보조 근거로 사용할 수 있다.

```text
output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
output/02_classification/YOVIA_REFERENCE_CLASSIFICATION.md
output/03_analysis/YOVIA_RESEARCH_ANALYSIS.md
```

보조 입력은 존재하고 검증된 경우에만 사용한다. 보조 입력이 없다는 이유만으로 가상 클라이언트 생성을 중단하지 않는다.

검증된 전사본 또는 검증 완료된 인터뷰 분석 결과가 없는 M4A 파일은 가상 클라이언트 생성 근거로 사용하지 않는다. 해당 자료는 `pending_transcription`으로 기록한다.

### 가상 클라이언트 생성 출력

```text
output/04_virtual_clients/YOVIA_VIRTUAL_CLIENT_MASTER.md
output/04_virtual_clients/YOVIA_REQUIREMENT_MASTER.md
output/04_virtual_clients/YOVIA_SOURCE_TRACEABILITY.md
output/04_virtual_clients/clients/
```

---

## 7. 실행 요청 해석

### 수량 명령 자동 연결

사용자가 별도의 긴 명령서를 작성하지 않고 다음처럼 수량만 요청해도 단계형 실행으로 해석한다.

```text
20개 해줘
20개 시작해
20개 진행해

70개까지 해줘
70개 진행해

200개까지 해줘
200개 진행해
```

수량과 Phase의 연결:

| 사용자 요청 | 실행 Phase | 신규 조사 | 누적 목표 | 결과 성격 |
|---|---|---:|---:|---|
| `20개` | Phase 1 | 20개 | 20개 | 초기 결론 |
| `70개` | Phase 2 | 50개 추가 | 70개 | 중간 결론 |
| `200개` | Phase 3 | 130개 추가 | 200개 | 최종 결론 |

고정 ID 범위:

```text
Phase 1: 001–020
Phase 2: 021–070
Phase 3: 071–200
```

수량 공식:

```text
20 + 50 + 130 = 200
```

단계형 실행은 외부 통합 문서 없이 이 `AGENTS.md`만으로 수행한다.

### Phase별 처리 규칙

#### Phase 1 — 누적 20개

```text
신규 20개 공식 사이트 리서치
→ 001–020 검증
→ 누적 20개 전체 분류
→ 누적 20개 전체 분석
→ 초기 결론
→ 중단
```

- 가장 관련성이 높은 직접 레퍼런스를 우선한다.
- 결과는 `초기 가설` 또는 `초기 결론`으로 표시한다.
- 20개 결과를 200개 전체 경향으로 확정하지 않는다.

#### Phase 2 — 누적 70개

```text
검증된 기존 20개 확인
→ 신규 50개 공식 사이트 리서치
→ 021–070 검증
→ 001–070 누적 통합
→ 누적 70개 전체 재분류
→ 누적 70개 전체 재분석
→ 중간 결론
→ 중단
```

- 신규 50개는 기존 20개와 공식 도메인이 중복되지 않아야 한다.
- 기존 20개는 전면 재조사하지 않는다.
- Phase 1의 패턴과 콘셉트가 유지·수정·폐기되는지 기록한다.
- 결과는 `중간 검증` 또는 `중간 결론`으로 표시한다.

#### Phase 3 — 누적 200개

```text
검증된 기존 70개 확인
→ 신규 130개 공식 사이트 리서치
→ 071–200 검증
→ 001–200 누적 통합
→ 누적 200개 전체 최종 분류
→ 누적 200개 전체 최종 분석
→ 전체 정합성 검사
→ 최종 결론
→ 1팀 창의적 결론 → 2팀 직관적 결론 → 통합 결론
```

- 신규 130개는 기존 70개와 공식 도메인이 중복되지 않아야 한다.
- 기존 70개는 전면 재조사하지 않는다.
- 전체 200개에서 공통 패턴·예외·반대 사례를 최종 검증한다.
- 일반 전체 실행 또는 Phase 3 누적 200개에서만 `최종 분석`, `최종 결론` 및 최종 두 팀 결론 보고를 수행한다. Phase 1 누적 20개와 Phase 2 누적 70개에서는 단계 결론만 보고한다.

### 단계 결과 저장과 보존

모든 Phase는 다음 표준 출력 경로를 사용한다.

```text
output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
output/02_classification/YOVIA_REFERENCE_CLASSIFICATION.md
output/03_analysis/YOVIA_RESEARCH_ANALYSIS.md
```

Phase 1과 Phase 2에서도 파일명은 유지하되 문서 머리말에 다음을 기록한다.

```text
실행 Phase
이번 단계 신규 조사 수
현재 누적 레코드 수
최종 목표 레코드 수: 200
ID 범위
문서 상태: 초기 가설 / 중간 검증 / 최종
생성·갱신 시각
직전 Phase
```

다음 Phase를 시작하기 전에 현재 정상 출력 세 파일을 `archive/previous/{stage}/`에 보존한다.

- Phase 2 시작 전: Phase 1 누적 20개 결과 보존
- Phase 3 시작 전: Phase 2 누적 70개 결과 보존
- 검증 실패 결과: `archive/failed/{stage}/`
- 샘플·예시·실패·폐기 파일을 선행 결과로 사용하지 않는다.

수량 명령의 기본 실행 순서:

```text
현재 Phase 리서치
→ research 검증
→ 현재 누적 전체 분류
→ classify 검증
→ 현재 누적 전체 분석
→ analyze 검증
→ 해당 Phase 결론
```

따라서 `20개 해줘`를 리서치만 20개 수행하는 요청으로 해석하지 않는다.

```text
20개 해줘
= 신규 20개 리서치
→ 누적 20개 분류
→ 누적 20개 분석
→ 초기 결론
```

```text
70개까지 해줘
= 검증된 기존 20개 확인
→ 신규 50개 리서치
→ 누적 70개 분류
→ 누적 70개 분석
→ 중간 결론
```

```text
200개까지 해줘
= 검증된 기존 70개 확인
→ 신규 130개 리서치
→ 누적 200개 최종 분류
→ 누적 200개 최종 분석
→ 전체 정합성 검사
→ 최종 결론
```

### 선행 Phase 조건

- Phase 2는 검증을 통과한 누적 20개 결과가 있어야 한다.
- Phase 3는 검증을 통과한 누적 70개 결과가 있어야 한다.
- 선행 결과가 없거나 실패 상태이면 다른 파일로 자동 대체하지 않는다.
- 선행 결과가 없으면 필요한 이전 Phase를 보고하고 중단한다.
- 사용자가 `처음부터 200개 전체 실행`을 명시한 경우에만 Phase 1부터 Phase 3까지 연속 실행한다.

### 지원하지 않는 수량

20, 70, 200 이외의 수량을 요청하면 임의로 가까운 Phase에 연결하지 않는다.

다음 중 무엇을 원하는지 한 번만 확인한다.

- 신규 조사 수량
- 누적 목표 수량
- 최종 목표 200개 변경

### 가상 클라이언트 생성 요청

다음 요청은 `virtual_client` 단계 실행 요청으로 해석한다.

```text
가상 클라이언트 생성해
가상클라이언트 생성해
가상 클라이언트 만들어줘
04단계 진행해
04단계 실행해
virtual_client 실행
```

위 요청을 받으면 다음 Skill을 읽는다.

```text
.agents/skills/virtual_client/SKILL.md
```

실행 순서:

```text
요청 확인
→ virtual_client Skill 존재 확인
→ 브랜드 자료 확인
→ 가상 클라이언트 PDF 또는 검증 분석 결과 확인
→ 페르소나 TXT 또는 검증 분석 결과 확인
→ 사용 가능한 보조 리서치·분류·분석 결과 확인
→ 입력 검증
→ yovia-virtual-client-synthesis 실행
→ 생성 결과 검증
→ output/04_virtual_clients/ 저장
→ 완료 보고
→ 중단
```

가상 클라이언트 생성 후 IA·화면 구성·와이어프레임·Figma·스토리보드 등 다음 UX/UI 설계 단계를 자동 실행하지 않는다. 사용자가 다음 단계를 명시적으로 요청해야 한다.

기존 `20개 / 70개 / 200개` 수량 명령은 기존 규칙을 유지하며 `virtual_client`를 자동 포함하지 않는다.

사용자가 다음과 같이 명시한 경우에만 레퍼런스 파이프라인 이후 가상 클라이언트 생성까지 연속 실행한다.

```text
전체 실행하고 가상 클라이언트까지 생성해
레퍼런스 분석 후 가상 클라이언트 생성해
처음부터 200개 전체 실행하고 가상 클라이언트까지 생성해
```

이 경우:

```text
research → classify → analyze → virtual_client
```

순서로 실행한다. `virtual_client` 검증이 실패하면 그 이후 후속 UX/UI 설계 단계로 이동하지 않는다.

### 일반 실행 요청

사용자가 레퍼런스 전체 작업을 요청하거나 특정 단계를 지정하지 않으면 다음 기본 흐름을 실행한다.

```text
research → classify → analyze
```

가상 클라이언트 생성은 이 기본 전체 실행에 자동 포함하지 않는다.

특정 Skill 단계만 요청한 경우:

- `리서치만`: research만 실행
- `분류만`: 유효한 리서치 결과가 있을 때 classify만 실행
- `분석만`: 유효한 리서치와 분류 결과가 있을 때 analyze만 실행
- `전체 실행`: 기본 레퍼런스 세 단계를 순서대로 실행
- `가상 클라이언트 생성`: `virtual_client`만 실행
- `전체 실행하고 가상 클라이언트까지`: `research → classify → analyze → virtual_client` 순서로 실행

수량 명령 `20개 / 70개 / 200개`는 특정 Skill 단계 요청이 아니라 **해당 누적 Phase의 통합 실행 요청**이다.

선행 결과가 없으면 후속 단계를 몰래 실행하지 않는다.

전체 실행 중 각 단계가 통과하면 사용자 재확인 없이 다음 단계로 진행한다.

---

## 8. 실행 전 검사

### 프로젝트

- 프로젝트 루트가 올바른가?
- `AGENTS.md`가 현재 프로젝트 파일인가?
- 기본 세 Skill과, 요청 범위에 포함된 경우 `virtual_client` Skill이 정해진 경로에 있는가?
- 수량 명령이 이 `AGENTS.md`의 Phase 1·2·3 규칙과 정확히 연결되는가?
- 출력과 아카이브 경로에 쓸 수 있는가?
- `virtual_client` 실행 요청이면 `input/00_brand/`, `input/02_virtual_client/`, `input/03_persona/`의 사용 가능한 근거 자료를 확인했는가?

### 파일

- 입력 파일이 UTF-8로 읽히는가?
- 동일 단계의 기존 출력이 있는가?
- 수량 명령의 현재 Phase와 누적 목표가 일치하는가?
- Phase 2 또는 Phase 3이면 선행 누적 결과가 검증을 통과했는가?
- 선행 리서치·분류·분석 파일의 ID와 버전이 연결되는가?
- 출력 폴더에 임시·실패 파일이 섞여 있지 않은가?
- 샘플·예시·failed·discarded 파일을 선행 결과로 선택하지 않았는가?
- 오래된 후속 결과를 새 선행 결과와 함께 사용하려 하지 않는가?

### 안전

- 입력 원본을 수정하려 하지 않는가?
- 기존 출력을 보관하지 않고 덮어쓰려 하지 않는가?
- 프로젝트 밖의 파일을 삭제하려 하지 않는가?

자동 수정할 수 없는 문제가 있으면 필요한 파일이나 조치를 보고하고 중단한다.

---

## 9. STEP 1 — 리서치

### 읽기

```text
AGENTS.md
.agents/skills/research/SKILL.md
사용자가 지정한 리서치 파일
input/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
../Antigravity/research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
기존 output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
```

### 실행

```text
yovia-reference-research
```

### 저장

```text
output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
```

### 완료 조건

- 실제 레코드 수와 머리말의 수가 같다.
- ID와 상태 필드가 검증된다.
- 공식 사이트 근거와 P1~P5가 연결된다.
- `active / redirected / dead`가 집계된다.
- `completed / partial / failed`가 집계된다.
- 일반 실행에서는 기존 유효 자료가 있으면 신규 전체 웹조사를 생략하고 검증·정규화했는가?
- 단계형 수량 실행에서는 현재 Phase의 신규 ID 범위를 공식 사이트 기준으로 새로 조사했는가?
- Phase 2·3에서는 이전 검증 레코드를 다시 전면 조사하지 않고 선행 누적 결과로 사용했는가?
- 기존 자료가 일부 불완전하면 필요한 항목만 제한적으로 재검증했는가?
- 미확인 정보는 `not_verified` 또는 해당 상태로 남는다.
- 직접·인접·주변 분류를 하지 않는다.
- 200개 전체 공통점과 YOVIA 적용 결론을 쓰지 않는다.

검증 통과 시 사용자 역할 보고 없이 분류 단계로 이동한다.

---

## 10. STEP 2 — 분류

### 읽기

```text
AGENTS.md
.agents/skills/classify/SKILL.md
output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
```

### 실행

```text
yovia-reference-classification
```

### 저장

```text
output/02_classification/YOVIA_REFERENCE_CLASSIFICATION.md
```

### 완료 조건

- 전체·유효·보류·제외 수가 일치한다.
- 동일 공식 도메인 중복이 처리된다.
- 유효 레코드 전체를 기준으로 공통 디자인 패턴의 관찰 수·확인 가능 분모·비율이 집계된다.
- 공통 디자인 패턴에 대표 출처와 예외 사례가 연결된다.
- 공통 패턴을 기반으로 3~5개의 디자인 콘셉트 후보가 도출된다.
- 사용자가 선호 콘셉트를 지정했다면 이를 우선 반영한다.
- 사용자 선호가 없으면 YOVIA 적합성·근거 강도·제품 이해도·모바일 확장성·구현 가능성으로 주 콘셉트 하나를 추천 선정한다.
- 선정 방식이 `사용자 선택` 또는 `근거 기반 추천`으로 표시된다.
- 모든 유효 레코드가 제품 관련성 축의 `직접 / 인접 / 주변` 중 정확히 하나로 분류된다.
- 모든 유효 레코드가 디자인 적합도 축의 `핵심 / 보조 / 요소 참고 / 비적합` 중 정확히 하나로 분류된다.
- 각 레코드에 두 분류의 근거와 신뢰도가 있다.
- 세부 카테고리와 보조 태그가 원본 근거에 연결된다.
- 목적별 우선 검토군과 선정 콘셉트 구현 참고군이 기록된다.
- 공통점 분석은 디자인 콘셉트와 분류 기준을 정하기 위한 범위에 한정된다.
- 상세 정보 구조·화면 설계·최종 YOVIA 적용 우선순위는 확정하지 않는다.

검증 통과 시 사용자 역할 보고 없이 분석 단계로 이동한다.

---

## 10.1 분류와 분석의 공통점 분석 경계

분류와 분석은 모두 패턴을 다루지만 목적이 다르다.

### 분류 단계에서 허용되는 분석

```text
현재 누적 유효 레코드 전체(20개 / 70개 / 200개)의 디자인 요소 집계
→ 공통 디자인 패턴 확인
→ 디자인 콘셉트 후보 도출
→ 주 콘셉트 선정
→ 선정 콘셉트를 기준으로 디자인 적합도 분류
```

분류 단계의 결과는 **분류 기준을 만들기 위한 분석**이다.

### 분석 단계에서 수행하는 분석

```text
분류 결과와 원본 리서치 재검증
→ 전체·분류별·세부 카테고리별 패턴 해석
→ 예외와 반대 사례 분석
→ YOVIA 적용 방향·우선순위·구현 난이도·위험 도출
```

분석 단계의 결과는 **최종 UX/UI 의사결정을 지원하기 위한 분석**이다.

따라서 `분류 단계에서 모든 공통점 분석 금지`로 해석하지 않는다.
금지되는 것은 분류 단계가 상세 IA, 화면 설계, 최종 적용 우선순위까지 대신 수행하는 것이다.

---

## 11. STEP 3 — 분석

### 읽기

```text
AGENTS.md
.agents/skills/analyze/SKILL.md
output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
output/02_classification/YOVIA_REFERENCE_CLASSIFICATION.md
```

### 실행

```text
yovia-reference-analysis
```

### 저장

```text
output/03_analysis/YOVIA_RESEARCH_ANALYSIS.md
```

### 완료 조건

- 전체 레코드와 실제 유효 분석 대상 수를 구분한다.
- 유효 대상 전체의 공통 UX/UI 패턴을 분석한다.
- 직접·인접·주변별 공통점과 차이를 분석한다.
- 디자인 핵심·보조·요소 참고·비적합군의 공통점과 차이를 분석한다.
- 분류 단계에서 선정한 디자인 콘셉트가 원본 리서치와 일치하는지 검증한다.
- 선정 콘셉트의 YOVIA 적용 가능성·구현 우선순위·위험·대안을 분석한다.
- 세부 카테고리별 특화 패턴을 분석한다.
- 패턴마다 관찰 수·비율 또는 집계 불가 사유가 있다.
- 대표 출처와 예외·반대 사례가 연결된다.
- 타사 관찰과 YOVIA 적용 제안이 분리된다.
- 데스크톱과 모바일 적용 차이가 있다.
- 구현 난이도·위험·우선순위가 있다.
- 확인되지 않은 수치·기능을 만들지 않는다.
- Phase 1 분석은 `초기 결론` 또는 `초기 가설`로 표시한다.
- Phase 2 분석은 `중간 결론` 또는 `중간 검증`으로 표시한다.
- 일반 전체 실행 또는 Phase 3 누적 200개에서만 `최종 분석`과 `최종 결론`으로 표시한다. Phase 1 누적 20개는 `초기 분석`·`초기 결론`, Phase 2 누적 70개는 `중간 분석`·`중간 결론`으로 표시한다.

분석 통과 후 현재 실행 범위의 리서치·분류·분석 정합성을 검사한다. Phase 1 누적 20개와 Phase 2 누적 70개에서는 해당 단계 결론을 보고하고 중단한다. 일반 전체 실행 또는 Phase 3 누적 200개에서는 전체 최종 검증을 통과한 뒤에만 최종 두 팀 결론 보고를 한 번 수행한다.

---

## 11.1 STEP 4 — 가상 클라이언트 생성

이 단계는 사용자의 명시적 가상 클라이언트 생성 요청이 있을 때만 실행한다. 기존 `20개 / 70개 / 200개` 단계형 누적 실행에는 자동 포함하지 않는다.

### 읽기

```text
AGENTS.md
.agents/skills/virtual_client/SKILL.md

input/00_brand/
input/02_virtual_client/
input/03_persona/

사용 가능한 경우:
output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
output/02_classification/YOVIA_REFERENCE_CLASSIFICATION.md
output/03_analysis/YOVIA_RESEARCH_ANALYSIS.md
```

검증된 전사본 또는 검증 분석 결과가 없는 M4A 파일은 근거로 사용하지 않는다.

### 실행

```text
yovia-virtual-client-synthesis
```

### 저장

```text
output/04_virtual_clients/
├─ YOVIA_VIRTUAL_CLIENT_MASTER.md
├─ YOVIA_REQUIREMENT_MASTER.md
├─ YOVIA_SOURCE_TRACEABILITY.md
└─ clients/
   ├─ VC_001.md
   ├─ VC_002.md
   └─ ...
```

### 완료 조건

- YOVIA 최상위 브랜드 정의가 유지된다.
- 브랜드 원본 자료와 사용 가능한 검증 분석 자료의 상태가 구분된다.
- 가상 클라이언트 PDF 또는 검증 분석 결과를 사용했다.
- 페르소나 TXT 또는 검증 분석 결과를 사용했다.
- 미사용·보류 Source가 기록된다.
- 모든 핵심 Source에 Source ID가 있다.
- 핵심 근거에 Evidence ID가 있다.
- `SOURCE → EVIDENCE → INSIGHT → NEED → DESIGN IMPLICATION → VIRTUAL CLIENT → REQUIREMENT` 추적이 가능하다.
- Persona와 Virtual Client를 동일 개념으로 취급하지 않는다.
- 의미 있는 관점을 지나치게 합치지 않는다.
- 수량 증가만을 위한 중복 클라이언트를 생성하지 않는다.
- 가상 클라이언트 수와 요구사항 수를 임의 제한하지 않는다.
- 각 Requirement에 Source와 Evidence가 연결된다.
- 각 Requirement에 Priority가 있다.
- 각 Requirement에 Evidence Confidence가 있다.
- 각 Requirement에 YOVIA Brand Fit과 판정 이유가 있다.
- 공통·다수·특화·충돌·예외·파생·검증 필요·브랜드 부적합 관계가 필요한 범위에서 보존된다.
- Coverage Matrix가 생성된다.
- `YOVIA_VIRTUAL_CLIENT_MASTER.md`, `YOVIA_REQUIREMENT_MASTER.md`, `YOVIA_SOURCE_TRACEABILITY.md`, `clients/`가 서로 추적 가능하다.
- IA·페이지 구조·화면 구성·와이어프레임·Figma·스토리보드를 현재 단계에서 확정하지 않는다.

검증 실패 시 정상 출력으로 확정하지 않는다. 자동 수정 가능한 형식 문제는 최대 2회까지 수정·재검증하고, 핵심 근거 문제가 남으면 `archive/failed/virtual_clients/`에 보존한 뒤 중단한다.

---

## 12. 단계 간 데이터 계약

### 리서치 → 분류

분류는 리서치의 다음 항목을 원본 근거로 사용한다.

- ID와 브랜드명
- 발견 URL과 최종 URL
- URL 상태와 조사 상태
- P1~P5
- 제품·사용 상황
- 웹 구조
- 시각 표현
- 제품 설명
- 인터랙션·반응형
- 객관적 연구 메모

분류는 리서치 사실을 수정하지 않는다.

오류가 의심되면 분류 결과에 `리서치 수정 필요`로 기록한다.

### 분류 → 분석

분석은 분류 결과의 다음 항목을 사용한다.

- 공통 디자인 패턴 집계
- 디자인 콘셉트 후보
- 선정 디자인 콘셉트
- 선정 방식
- 주 콘셉트 역할
- 보조 콘셉트 역할
- 제품 관련성: 직접·인접·주변
- 제품 관련성 근거와 신뢰도
- 디자인 적합도: 핵심·보조·요소 참고·비적합
- 디자인 적합도 근거와 신뢰도
- 세부 카테고리
- 보조 태그
- 보류·제외·중복
- 대표 레코드
- 목적별 우선 검토군
- 선정 디자인 콘셉트 구현 참고군

다음 수량 관계가 성립해야 분석 단계로 이동한다.

```text
직접 + 인접 + 주변 = 유효 분류 대상
핵심 + 보조 + 요소 참고 + 비적합 = 유효 분류 대상
유효 분류 대상 + 보류 + 제외·중복 = 전체 레코드
```

분석은 원본 리서치와 충돌하는 경우를 제외하고 임의로 재분류하지 않는다.
분류 단계의 공통 디자인 집계를 원본 리서치와 대조해 검증한 뒤, 전체 UX/UI 패턴의 의미·YOVIA 적용 방향·우선순위·위험을 확장 분석한다.

오류가 의심되면 `분류 재검토 필요`로 기록한다.

### 리서치 → 분석

모든 핵심 패턴과 결론은 원본 리서치까지 추적 가능해야 한다.

분류 문서의 요약만으로 공통점을 확정하지 않는다.

### 브랜드·가상 클라이언트·페르소나 → 가상 클라이언트 생성

`virtual_client`는 다음을 핵심 근거로 사용한다.

- 사용자가 확정한 YOVIA 최상위 브랜드 정의
- `input/00_brand/`의 브랜드 원본 자료
- `input/02_virtual_client/`의 가상 클라이언트 PDF 및/또는 검증 분석 결과
- `input/03_persona/`의 페르소나 TXT 및/또는 검증 분석 결과

검증된 경우에만 다음을 보조 근거로 사용할 수 있다.

- `output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md`
- `output/02_classification/YOVIA_REFERENCE_CLASSIFICATION.md`
- `output/03_analysis/YOVIA_RESEARCH_ANALYSIS.md`

보조 분석 결과가 브랜드 원본 사실이나 사용자 확정 조건을 덮어쓰지 않는다.

### 가상 클라이언트 생성 → 후속 UX/UI 설계 단계

후속 단계는 다음을 읽는다.

```text
output/04_virtual_clients/YOVIA_VIRTUAL_CLIENT_MASTER.md
output/04_virtual_clients/YOVIA_REQUIREMENT_MASTER.md
output/04_virtual_clients/YOVIA_SOURCE_TRACEABILITY.md
output/04_virtual_clients/clients/
```

후속 단계는 Source/Evidence를 임의 변경하지 않는다. 서로 다른 가상 클라이언트의 요구를 처음부터 평균화하지 않고 공통·특화·충돌 관계를 유지한 채 화면 구조와 UX/UI 결정을 도출한다.

---

## 13. 아카이브 규칙

기존 파일을 덮어쓰기 전에 반드시 아카이브한다.

### 정상 이전 버전

```text
archive/previous/{stage}/
```

단계명:

```text
research
classification
analysis
virtual_clients
```

파일명:

```text
YYYYMMDD_HHMMSS__원래파일명
```

예:

```text
archive/previous/research/20260804_141000__YOVIA_BRAND_REFERENCE_RESEARCH_200.md
```

### 검증 실패 파일

```text
archive/failed/{stage}/
```

파일명:

```text
YYYYMMDD_HHMMSS__FAILED__원래파일명
```

실패한 새 결과를 정상 출력 위치에 남기지 않는다.

별도의 실패 보고서 파일은 만들지 않는다.

### 폐기 파일

```text
archive/discarded/{stage}/
```

파일명:

```text
YYYYMMDD_HHMMSS__DISCARDED__원래파일명
```

폐기 대상:

- 최종 결과에 사용하지 않은 임시 MD
- 잘못된 이름이나 경로에 만든 생성 결과
- 중복 출력 사본
- 불완전 중간 파일
- 사용자가 버리라고 지정한 생성 파일

원본 입력 파일은 폐기 위치로 이동하지 않는다.

리서치 안의 `failed`, `dead`, 중복 레코드는 개별 파일로 버리지 않고 문서 내부 상태로 관리한다.

### 삭제 금지

자동 삭제 금지 대상:

- `input/` 원본
- `AGENTS.md`
- 등록된 Skill
- 정상 아카이브
- 사용자가 제공한 자료
- 근거로 사용된 출력

---

## 14. 선행 결과 변경 시 후속 처리

### 리서치가 변경된 경우

1. 기존 분류를 `archive/previous/classification/`으로 이동
2. 기존 분석을 `archive/previous/analysis/`으로 이동
3. 새 리서치로 분류 재실행
4. 새 분류로 분석 재실행

### 분류가 변경된 경우

1. 기존 분석을 `archive/previous/analysis/`으로 이동
2. 새 분류와 현재 리서치로 분석 재실행

### 분석만 변경된 경우

기존 분석만 `archive/previous/analysis/`으로 이동하고 분석을 재실행한다.

기존 `virtual_client` 결과가 현재 분석 파일을 보조 근거로 사용했다면:

1. 기존 가상 클라이언트 결과를 `archive/previous/virtual_clients/`에 보존
2. 사용자가 가상 클라이언트 결과 갱신까지 요청한 경우 새 분석으로 `virtual_client` 재실행
3. 갱신 요청이 없으면 기존 가상 클라이언트 결과를 자동으로 현재 결과처럼 재사용하지 않고 `stale_dependency` 상태로 취급

### 브랜드·가상 클라이언트 PDF·페르소나 입력이 변경된 경우

기존 가상 클라이언트 결과가 존재하면 다음을 수행한다.

1. 기존 결과를 `archive/previous/virtual_clients/`에 보존
2. 변경된 입력의 Source ID 또는 버전을 확인
3. `virtual_client`를 재실행
4. 기존 Source ID를 유지할 수 있는 항목은 유지하고 신규 근거는 새 ID로 추가
5. 이전 결과와 새 결과를 혼합하여 현재 결과처럼 사용하지 않음

오래된 후속 파일을 출력 폴더에 남겨 현재 결과처럼 사용하지 않는다.

---

## 15. 실패 처리

각 단계 실패 시:

```text
1. 실패 원인 확인
2. 자동 수정 가능 여부 판단
3. 자동 수정
4. 동일 단계 재검증
5. 통과하면 다음 단계
6. 실패가 계속되면 실패 파일 아카이브 후 중단
```

자동 수정 가능:

- 디렉터리 누락
- 파일명 오타
- 머리말 수량과 실제 수량 불일치
- 고정 제목 누락
- 단순 합계 오류
- 중복 ID 표기 오류
- UTF-8·줄바꿈 문제
- 임시 파일 정리

자동 수정 금지:

- 공식 사이트 근거 부족
- 핵심 페이지 접근 실패
- 분류 근거 충돌
- 제품 카테고리 불명확
- 정확한 빈도 계산 불가
- YOVIA 확정 수치 부족
- 사용자가 제공하지 않은 사업 조건

단계별 자동 수정과 재검증은 최대 2회다.

2회 후에도 핵심 검증 실패 시:

- 실패 출력은 `archive/failed/{stage}/`에 보관
- 후속 단계를 실행하지 않음
- 레퍼런스 파이프라인 실패 시 `1팀 창의적 결론 → 2팀 직관적 결론 → 통합 결론` 보고를 실행하지 않음
- `virtual_client` 실패 시 가상 클라이언트 결과를 정상 출력으로 확정하지 않고 후속 UX/UI 설계 단계로 이동하지 않음
- 일반 중단 보고만 제공

---

## 16. 웹 조사 규칙

리서치 단계에서:

- 공식 사이트를 우선한다.
- 검색 결과 요약만으로 레코드를 완성하지 않는다.
- 발견 URL과 최종 URL을 구분한다.
- 리디렉션을 기록한다.
- 확인하지 못한 내용은 추측하지 않는다.
- 조사 시각을 기록한다.
- 확인되지 않은 수치를 만들지 않는다.

분류 단계에서는 새 웹 조사를 원칙적으로 하지 않는다.

분석 단계에서도 새 핵심 사실을 몰래 추가하지 않는다.

가상 클라이언트 생성 단계는 새 웹조사를 기본적으로 수행하지 않는다. 브랜드·가상 클라이언트·페르소나 원본과 검증된 선행 결과를 사용하며, 근거가 없는 제품 기능·건강 효능·사업 조건을 생성하지 않는다.

근거가 부족하면 `리서치 수정 필요`, `추가 확인 필요`, `NOT_VERIFIED` 또는 해당 Skill의 상태값으로 표시한다.

---

## 17. 단계별 내부 검토

각 단계 완료 후 사용자에게 역할 보고를 하지 않고 다음만 내부 검토한다.

```text
파일 존재
경로 일치
구조 일치
수량 일치
근거 연결
단계 범위 준수
후속 입력 가능 여부
```

내부 검토를 별도 상태표나 로그 파일로 저장하지 않는다.

---

## 18. 전체 최종 검증 — 일반 전체 실행 또는 누적 200개

누적 20개와 70개에서는 해당 Phase의 수량·ID·근거·데이터 계약을 검증한 뒤 단계 결론을 보고하고 중단한다.

이 절의 전체 최종 검증은 누적 200개 또는 사용자가 명시한 일반 레퍼런스 전체 실행이 완료된 경우에만 수행한다.

`virtual_client`는 이 레퍼런스 200개 최종 검증의 필수 조건이 아니다. 사용자가 `가상 클라이언트까지`를 명시한 경우에는 레퍼런스 최종 검증 통과 후 별도의 STEP 4 검증을 수행한다.

필수 출력:

```text
output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
output/02_classification/YOVIA_REFERENCE_CLASSIFICATION.md
output/03_analysis/YOVIA_RESEARCH_ANALYSIS.md
```

최종 검사:

- 분류가 현재 리서치를 사용했는가?
- 분석이 현재 리서치와 현재 분류를 사용했는가?
- ID와 브랜드명이 세 파일에서 추적 가능한가?
- 제외·보류·중복 수와 유효 분석 대상 수가 맞는가?
- 분석 출처가 실제 리서치 레코드에 존재하는가?
- 리서치는 원시 사실 수집에 집중했는가?
- 분류는 200개 공통 디자인 집계·콘셉트 선정·이중 분류 범위에 집중했는가?
- 분석은 분류 결과를 검증하고 전체 패턴의 의미·YOVIA 적용·우선순위·위험을 다뤘는가?
- 분류의 제한적 공통점 분석과 분석 단계의 최종 해석이 구분되는가?
- 대표 사례만 보고 전체 경향이라고 과장하지 않았는가?
- 예외·반대 사례·불확실성이 있는가?
- YOVIA 적용 우선순위에 근거가 있는가?
- 모바일과 데스크톱이 구분되는가?
- 확정되지 않은 수치가 없는가?

핵심 조건을 모두 통과해야 완료다.

---

## 18.1 실행 범위별 완료 보고

완료 보고 방식은 실행 범위에 따라 구분한다.

### 단일 단계만 요청한 경우

- 해당 Skill의 간단한 완료 보고를 사용자에게 제공한다.
- 최종 두 팀 결론 보고는 수행하지 않는다.
- 다음 단계에 필요한 입력과 경로만 안내한다.
- `virtual_client` 단일 실행이면 생성된 클라이언트 수, 총 요구사항 수, 보류 Source, 충돌/검증 필요 수, 출력 경로, 후속 UX/UI 설계 단계 진행 가능 여부를 보고한다.

### 단계형 수량 실행을 요청한 경우

#### 누적 20개 — Phase 1

- research → classify → analyze를 모두 실행한다.
- `초기 결론`을 간단히 보고한다.
- 최종 두 팀 결론 보고는 수행하지 않는다.
- Phase 2 진행에 필요한 선행 결과 상태를 안내한다.

#### 누적 70개 — Phase 2

- 신규 50개를 추가하고 누적 70개 전체를 분류·분석한다.
- Phase 1 대비 변화와 `중간 결론`을 간단히 보고한다.
- 최종 두 팀 결론 보고는 수행하지 않는다.
- Phase 3 진행에 필요한 선행 결과 상태를 안내한다.

#### 누적 200개 — Phase 3

- 신규 130개를 추가하고 누적 200개 전체를 최종 분류·분석한다.
- 전체 정합성 검사를 통과한 뒤 `1팀 창의적 결론 → 2팀 직관적 결론 → 통합 결론` 보고를 한 번 수행한다.

### 전체 실행을 요청한 경우

- research와 classify 완료 후에는 사용자에게 단계별 완료 보고를 반복하지 않는다.
- 각 단계는 내부 검증만 수행하고 통과하면 다음 단계로 진행한다.
- analyze까지 완료되고 전체 정합성 검사를 통과한 뒤에만 `1팀 창의적 결론 → 2팀 직관적 결론 → 통합 결론` 보고를 한 번 수행한다.

Skill의 `완료 보고` 규칙은 단일 단계 실행에 적용한다.
기본 레퍼런스 전체 실행에서는 이 `AGENTS.md`의 최종 보고 규칙이 우선한다.

### 전체 실행 + 가상 클라이언트 생성까지 요청한 경우

- 먼저 `research → classify → analyze`와 전체 정합성 검사를 완료한다.
- 레퍼런스 파이프라인이 통과한 뒤 `virtual_client`를 실행한다.
- `virtual_client`는 별도의 완료 검증과 완료 보고를 수행한다.
- 1팀·2팀·통합 결론은 기존 레퍼런스 최종 보고 규칙에 따라 한 번만 수행하며, 가상 클라이언트 단계에서 반복하지 않는다.
- 가상 클라이언트 생성 후 화면 구성·와이어프레임 등 다음 UX/UI 단계는 자동 실행하지 않는다.

---

## 19. 최종 두 팀 결론 보고

일반 전체 실행이 완료되었거나 단계형 실행의 Phase 3 누적 200개가 완료된 뒤에만 다음 순서로 한 번 수행한다. Phase 1 누적 20개와 Phase 2 누적 70개에서는 수행하지 않는다.

```text
1팀 창의적 결론
→ 2팀 직관적 결론
→ 통합 결론
```

두 팀은 동일한 CLI가 동일한 최종 리서치·분류·분석 결과를 바탕으로 서로 다른 관점에서 검토하는 가상 팀이다.

두 팀은 사실·수량·출처를 다르게 만들 수 없다. 차이는 **어떤 방향을 우선 제안하는가**에만 있다.

### 공통 입력

두 팀 모두 다음 파일의 동일한 최종 버전을 읽는다.

```text
output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
output/02_classification/YOVIA_REFERENCE_CLASSIFICATION.md
output/03_analysis/YOVIA_RESEARCH_ANALYSIS.md
```

두 팀 공통 금지:

- 원본에 없는 사실·수치·브랜드·기능 생성
- 분류 결과를 근거 없이 변경
- 대표 사례 하나를 전체 경향으로 확대
- 팀 성격을 이유로 검증 실패를 무시
- 창의성 또는 단순함을 근거보다 우선
- 같은 결론을 표현만 바꾸어 반복

### 1팀 — 창의적 관점

1팀은 **차별화·새로운 표현·브랜드 경험 확장**을 우선한다.

성격:

- 창의적
- 탐색적
- 차별화 지향
- 새로운 조합에 적극적
- 브랜드 기억 형성에 민감
- 감성적 경험과 시각적 개성을 중시
- 근거가 있는 범위에서 실험적 제안을 허용

주요 검토:

- 경쟁 브랜드와 구분되는 시각·콘텐츠 구조
- 선정 콘셉트의 확장 가능성
- 예상 밖이지만 제품 이해를 돕는 표현
- 패키지·컬러·타이포그래피·이미지의 독창적 조합
- 제품 사용법을 기억에 남게 전달하는 방식
- 브랜드 스토리와 제품 기능을 결합하는 방식
- 다른 카테고리의 핵심 디자인군에서 차용할 수 있는 요소
- 선택적 모션·인터랙션의 차별화 가능성
- 장기적으로 확장 가능한 브랜드 시스템

1팀은 제안마다 다음을 기록한다.

- 창의적 제안
- 근거 패턴과 출처 ID
- 기대 효과
- 구현 난이도
- 주요 위험
- 적용 조건
- 실패 시 대안

1팀은 독창적이라는 이유만으로 복잡성·가독성 저하·모바일 성능 문제를 정당화하지 않는다.

### 2팀 — 직관적 관점

2팀은 **즉시 이해·사용 편의·정보 명확성·모바일 효율**을 우선한다.

성격:

- 직관적
- 명확성 지향
- 실용적
- 단순화 지향
- 사용자 행동 중심
- 이해 속도와 구매 흐름에 민감
- 불필요한 요소를 제거하는 데 적극적

주요 검토:

- 첫 화면에서 제품과 핵심 가치가 즉시 이해되는가
- 사용법·제품 구조·영양 정보가 빠르게 파악되는가
- 내비게이션과 제품 탐색이 단순한가
- CTA의 목적과 우선순위가 분명한가
- 모바일 1열 흐름과 터치 동선이 자연스러운가
- 정보량과 시각적 강조가 과하지 않은가
- 사용자가 다음 행동을 고민하지 않아도 되는가
- 구현 난이도와 유지보수 비용이 합리적인가
- 제품군이 늘어도 구조가 무너지지 않는가

2팀은 제안마다 다음을 기록한다.

- 직관적 제안
- 해결하는 사용자 질문
- 근거 패턴과 출처 ID
- 이해·행동 측면의 기대 효과
- 삭제하거나 단순화할 요소
- 모바일 적용 방식
- 구현 난이도
- 남은 위험

2팀은 단순하다는 이유만으로 브랜드 개성·차별성·정서적 매력을 제거하지 않는다.

### 두 팀 비교

두 팀의 결과를 다음 기준으로 비교한다.

| 비교 기준 | 1팀 창의적 관점 | 2팀 직관적 관점 | 통합 판단 |
|---|---|---|---|
| 제품 이해도 | `[판정]` | `[판정]` | `[판정]` |
| 브랜드 차별성 | `[판정]` | `[판정]` | `[판정]` |
| 모바일 적합성 | `[판정]` | `[판정]` | `[판정]` |
| 구매 전환 명확성 | `[판정]` | `[판정]` | `[판정]` |
| 구현 가능성 | `[판정]` | `[판정]` | `[판정]` |
| 유지보수성 | `[판정]` | `[판정]` | `[판정]` |
| 위험 | `[판정]` | `[판정]` | `[판정]` |
| 확장성 | `[판정]` | `[판정]` | `[판정]` |

### 통합 결론

통합 결론은 두 팀의 제안을 비교해 다음을 결정한다.

- **주 방향**: YOVIA의 기본 UX/UI 시스템으로 사용할 방향
- **보조 방향**: 주 방향을 강화하기 위해 제한적으로 결합할 요소
- **제외 방향**: 근거·제품 이해·모바일·구현 측면에서 채택하지 않을 방향
- **필수 적용**: 제품 이해와 사용 흐름에 반드시 필요한 요소
- **우선 적용**: 효과와 실행 가능성이 높은 요소
- **선택 적용**: 자산·일정·예산이 충족될 때 적용할 요소
- **보류**: 추가 자료나 검증이 필요한 요소
- **중단 조건**: 적용을 중단하거나 대안으로 전환할 조건

통합 원칙:

```text
직관성을 기본 골격으로 사용
+ 근거가 충분한 창의적 요소를 선택적으로 결합
```

위 원칙은 자동 결론이 아니다. 실제 200개 근거와 YOVIA 적합성 검토에서 반대 결과가 나오면 근거를 우선한다.

통합 판정:

```text
완료
조건부 완료
수정 필요
중단
```

두 팀 중 하나가 핵심 근거 오류를 발견한 경우, 통합 결론은 이를 무시하고 `완료`로 판정하지 않는다.

---

## 20. 최종 보고 고정 형식

```md
# 최종 실행 보고

## 실행 결과 요약

- **실행 단계**: 리서치 → 분류 → 분석
- **리서치 파일**: `output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md`
- **분류 파일**: `output/02_classification/YOVIA_REFERENCE_CLASSIFICATION.md`
- **분석 파일**: `output/03_analysis/YOVIA_RESEARCH_ANALYSIS.md`
- **처리 수량**: ...
- **제품 관련성 수량**: 직접 ... / 인접 ... / 주변 ...
- **디자인 적합도 수량**: 핵심 ... / 보조 ... / 요소 참고 ... / 비적합 ...
- **선정 콘셉트**: ...
- **미확인·제한 사항**: ...
- **아카이브 처리**: ...

## 1팀 — 창의적 결론

- **성격**: 창의적·탐색적·차별화 지향
- **핵심 제안**:
  1. ...
  2. ...
  3. ...
- **차별화 포인트**: ...
- **근거 패턴과 출처**: ...
- **기대 효과**: ...
- **구현 난이도**: ...
- **주요 위험**: ...
- **적용 조건**: ...
- **대안**: ...

## 2팀 — 직관적 결론

- **성격**: 직관적·명확성 지향·사용자 행동 중심
- **핵심 제안**:
  1. ...
  2. ...
  3. ...
- **즉시 이해해야 할 정보**: ...
- **단순화할 요소**: ...
- **모바일 적용 방식**: ...
- **근거 패턴과 출처**: ...
- **기대 효과**: ...
- **구현 난이도**: ...
- **주요 위험**: ...

## 두 팀 비교

| 기준 | 1팀 창의적 | 2팀 직관적 | 통합 판단 |
|---|---|---|---|
| 제품 이해도 | ... | ... | ... |
| 브랜드 차별성 | ... | ... | ... |
| 모바일 적합성 | ... | ... | ... |
| 구매 전환 | ... | ... | ... |
| 구현 가능성 | ... | ... | ... |
| 위험 | ... | ... | ... |

## 통합 결론

- **최종 판정**: 완료 / 조건부 완료 / 수정 필요 / 중단
- **주 방향**: ...
- **보조 방향**: ...
- **제외 방향**: ...
- **필수 적용**:
  1. ...
  2. ...
  3. ...
- **우선 적용**:
  1. ...
  2. ...
  3. ...
- **선택 적용**: ...
- **보류·추가 확인**: ...
- **중단 조건**: ...
- **다음 작업**: ...
```

역할 차이:

```text
1팀 = 차별화와 창의적 확장
2팀 = 즉시 이해와 직관적 사용
통합 결론 = 두 관점의 비교·선택·결합
```

같은 결과를 두 팀이 말투만 바꾸어 반복하지 않는다.

---

## 21. 중단 보고

세 단계가 모두 끝나기 전에 중단되면 역할 보고를 사용하지 않는다.

```md
# 작업 중단

- **중단 단계**: research / classification / analysis / virtual_clients
- **중단 원인**: ...
- **필요한 파일 또는 조치**: ...
- **보존된 실패 파일**: ...
- **완료된 이전 단계**: ...
- **재개 위치**: ...
```

---

## 22. 사용자 확인이 필요한 경우

다음 경우에만 사용자에게 확인한다.

- 조사 주제가 YOVIA와 무관하게 변경됨
- 기본 200개 기준을 변경해야 함
- 20·70·200 이외의 수량이 신규 조사 수인지 누적 목표인지 불명확함
- 최신 파일을 판별할 수 없는 복수 원본이 있음
- 서로 다른 리서치 DB가 같은 출력 경로를 요구함
- YOVIA 제품의 확정 수치·기능이 필요한데 자료가 없음
- 가상 클라이언트 생성에 사용할 브랜드·PDF·페르소나 원본이 복수 버전이고 최신/정본을 판별할 수 없음
- 사용자가 삭제를 요청했지만 보존 여부가 불명확함

`20개`, `70개`, `200개` 요청은 최종 목표 200개를 변경하는 요청이 아니므로 추가 확인 없이 해당 Phase로 연결한다.

디렉터리 생성, 기존 출력 아카이브, 합계 재계산, 형식 수정, 기존 유효 리서치의 검증·정규화는 확인 없이 수행한다.

---

## 23. 완료 체크

단계형 실행에서는 현재 요청 수량에 해당하는 항목까지만 검사한다.

```text
[ ] 수량 명령과 Phase 연결 확인
[ ] AGENTS.md 내장 단계형 규칙 확인 완료
[ ] 현재 Phase 신규 조사 수와 누적 목표 확인
[ ] 선행 Phase 검증 결과 확인
[ ] 현재 누적 research → classify → analyze 완료
[ ] Phase 1·2이면 단계 결론 후 중단
[ ] Phase 3이면 전체 최종 검증과 1팀·2팀·통합 결론 보고 완료
```

가상 클라이언트 생성 단계의 완료 체크:

```text
[ ] virtual_client Skill 실행 조건 확인
[ ] YOVIA 최상위 브랜드 정의 유지
[ ] 브랜드·가상 클라이언트·페르소나 입력 검증
[ ] 보류·미사용 Source 기록
[ ] Source/Evidence 추적 가능
[ ] Persona → Virtual Client 변환 규칙 준수
[ ] 의미 있는 관점 과도 통합 없음
[ ] 숫자 증가용 중복 Client 없음
[ ] 가상 클라이언트별 상세 Requirement 생성
[ ] Requirement별 Priority / Confidence / Brand Fit 존재
[ ] 공통·특화·충돌·예외 관계 보존
[ ] Coverage Matrix 생성
[ ] output/04_virtual_clients/ 출력 검증
[ ] 후속 IA·Wireframe·Figma·Storyboard 자동 실행 없음
```

일반 전체 실행의 완료 체크:
```text
[ ] research Skill 실행 완료
[ ] research 출력 검증 완료
[ ] classify Skill 실행 완료
[ ] classification 출력 검증 완료
[ ] analyze Skill 실행 완료
[ ] analysis 출력 검증 완료
[ ] 세 파일의 버전·ID 연결 확인
[ ] 이전·실패·폐기 파일 아카이브 완료
[ ] 최종 1팀 창의적 결론·2팀 직관적 결론·통합 결론 보고 완료
```

핵심 항목이 하나라도 충족되지 않으면 `완료`로 판정하지 않는다.

---

## 24. 금지 사항

- 리서치 → 분류 → 분석 순서를 변경
- 선행 결과 없이 후속 단계 실행
- 기존 결과를 아카이브하지 않고 덮어쓰기
- 원본 입력 자동 삭제·이동
- 분류 단계에서 200개 공통 디자인 패턴 집계와 콘셉트 선정 자체를 금지하는 것
- 분류 단계의 제한적 공통점 분석을 상세 IA·화면 설계·최종 적용 결론까지 확장하는 것
- 분석 단계에서 원본 근거 없이 임의 재분류
- 대표 사례만 보고 200개 전체 경향이라고 선언
- 확인되지 않은 수치·기능·브랜드·URL 생성
- `failed`, `dead`, 중복을 정상 유효 대상으로 집계
- 단계마다 1팀·2팀 최종 결론 보고 반복
- 실제 사람이 검토한 것처럼 표현
- 사용자 요청 없이 상태표·템플릿·로그·제안서·PPT·와이어프레임·코드 생성
- `20개 / 70개 / 200개` 수량 명령을 이 `AGENTS.md`의 Phase 규칙에 연결하지 않는 것
- `20개` 요청을 리서치만 실행하는 요청으로 축소하는 것
- `70개`를 기존 20개에 신규 70개를 추가하는 것으로 잘못 해석하는 것
- `200개`를 기존 70개에 신규 200개를 추가하는 것으로 잘못 해석하는 것
- Phase 2에서 신규 50개만 분류·분석하고 누적 70개를 사용하지 않는 것
- Phase 3에서 신규 130개만 분류·분석하고 누적 200개를 사용하지 않는 것
- 누적 20개와 70개에서 최종 1팀·2팀 결론 보고를 수행하는 것
- `20개 / 70개 / 200개` 수량 명령만으로 `virtual_client`를 자동 실행하는 것
- 검증된 가상 클라이언트/페르소나 입력 없이 근거 없는 가상 클라이언트를 생성하는 것
- 페르소나를 이름·직책만 바꾸어 가상 클라이언트로 복제하는 것
- 단순히 수량을 늘리기 위해 의미가 동일한 가상 클라이언트나 요구사항을 반복 생성하는 것
- 서로 충돌하는 요구사항을 근거 없이 평균화하거나 삭제하는 것
- 검증되지 않은 M4A 음성 내용을 추측하여 Source/Evidence로 사용하는 것
- `virtual_client` 단계에서 IA·화면 구성·와이어프레임·Figma·스토리보드를 자동 생성하는 것

---

## 25. 실행 요약

```text
수량 명령 자동 연결:

20개
→ Phase 1
→ 신규 20개 리서치
→ 누적 20개 분류
→ 누적 20개 분석
→ 초기 결론

70개
→ Phase 2
→ 기존 20개 검증
→ 신규 50개 리서치
→ 누적 70개 분류
→ 누적 70개 분석
→ 중간 결론

200개
→ Phase 3
→ 기존 70개 검증
→ 신규 130개 리서치
→ 누적 200개 최종 분류
→ 누적 200개 최종 분석
→ 전체 최종 검증
→ 1팀 창의적 결론 → 2팀 직관적 결론 → 통합 결론
```

일반 실행 요약:
```text
프로젝트 루트:
C:\kje\UIUXA\Md_Skill

1. research
읽기:
- AGENTS.md
- 수량 명령이면: .agents/skills/research/SKILL.md
- 사용자가 지정한 리서치 파일
- input/01_research/
- ../Antigravity/research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
- 기존 output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
기존 유효 자료가 있으면:
- 신규 전체 웹조사 생략
- 검증·정규화 후 출력 저장
저장:
- output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md

2. classify
읽기:
- AGENTS.md
- .agents/skills/classify/SKILL.md
- output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
저장:
- output/02_classification/YOVIA_REFERENCE_CLASSIFICATION.md

3. analyze
읽기:
- AGENTS.md
- .agents/skills/analyze/SKILL.md
- output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md
- output/02_classification/YOVIA_REFERENCE_CLASSIFICATION.md
저장:
- output/03_analysis/YOVIA_RESEARCH_ANALYSIS.md

4. virtual_client — 명시적 요청 시에만
읽기:
- AGENTS.md
- .agents/skills/virtual_client/SKILL.md
- input/00_brand/
- input/02_virtual_client/
- input/03_persona/
- 사용 가능한 경우 output/01_research/, output/02_classification/, output/03_analysis/
저장:
- output/04_virtual_clients/YOVIA_VIRTUAL_CLIENT_MASTER.md
- output/04_virtual_clients/YOVIA_REQUIREMENT_MASTER.md
- output/04_virtual_clients/YOVIA_SOURCE_TRACEABILITY.md
- output/04_virtual_clients/clients/

발동 예:
- `가상 클라이언트 생성해`
- `04단계 진행해`
- `virtual_client 실행`

기존 20/70/200 수량 명령에는 자동 포함하지 않음.

아카이브:
- archive/previous/
- archive/failed/
- archive/discarded/
- stage: research / classification / analysis / virtual_clients

최종 보고:
- 일반 전체 실행 또는 누적 200개 Phase 3 완료 후 한 번
- 누적 20개·70개에서는 단계 결론만 보고
- 1팀 창의적 결론 → 2팀 직관적 결론 → 통합 결론
```

가상 클라이언트 생성 요청 요약:
```text
가상 클라이언트 생성해 / 04단계 진행해 / virtual_client 실행
→ 브랜드·가상 클라이언트·페르소나 Source 검증
→ yovia-virtual-client-synthesis
→ 가상 클라이언트 다수 생성
→ 클라이언트별 상세 Requirement 생성
→ Source/Evidence/Brand Fit/Conflict 검증
→ output/04_virtual_clients/ 저장
→ 완료 보고
→ 중단
```
