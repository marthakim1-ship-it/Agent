# YOVIA WIREFRAME — 가상 클라이언트 기반 사이트 분석 실행 규칙

## 1. 역할

이 `AGENTS.md`는 다음 프로젝트의 단일 마스터 실행 규칙이다.

```text
C:\kje\UIUXA\WIREFRAME
```

현재 프로젝트의 목적은 **가상 클라이언트를 분석 기준으로 삼아 리서치 사이트를 경험·검토하고, 각 가상 클라이언트 관점에서 사이트에 필요한 메뉴(Menu), 콘텐츠(Content), 기능(Function)을 도출하는 것**이다.

현재 실행 범위는 다음까지만 포함한다.

```text
가상 클라이언트 제작 결과 읽기
→ analyze Skill 실행
→ 가상 클라이언트 관점에서 리서치 사이트 경험·검토
→ MENU / CONTENT / FUNCTION 도출
→ 가상 클라이언트별 결과 저장
→ 다음 가상 클라이언트 반복
```

현재 단계에서는 다음을 자동 생성하지 않는다.

```text
사이트 구조맵
사이트맵
서비스 흐름도
화면 설계서
와이어프레임
```

후속 단계는 사용자가 별도로 추가할 때만 확장한다.

---

## 2. 프로젝트 루트

```text
C:\kje\UIUXA\WIREFRAME
```

모든 상대경로는 위 프로젝트 루트를 기준으로 해석한다.

프로젝트 밖의 파일은 이 문서에 명시된 읽기 전용 입력 경로 또는 사용자가 직접 지정한 경우에만 읽는다.

프로젝트 밖의 원본 파일은 자동 수정·이동·삭제하지 않는다.

---

## 3. 핵심 파일

```text
C:\kje\UIUXA\WIREFRAME
│
├─ AGENTS.md
└─ .agents
   └─ skills
      └─ analyze
         └─ SKILL.md
```

각 파일 역할:

| 파일 | 역할 |
|---|---|
| `AGENTS.md` | 실행 요청 해석, 입력 경로, 반복 실행, 검증, 아카이브, 중단 조건 통제 |
| `.agents/skills/analyze/SKILL.md` | 가상 클라이언트를 분석 렌즈로 사용하여 리서치 사이트를 경험·분석하고 MENU / CONTENT / FUNCTION 도출 |

현재 프로젝트에는 `analyze` Skill 하나만 사용한다.

사용자 요청 없이 다른 Skill을 새로 만들거나 후속 단계로 확장하지 않는다.

---

## 4. 외부 입력 데이터 계약

### 4.1 가상 클라이언트 저장소

읽기 전용 기본 경로:

```text
C:\kje\UIUXA\Md_Skill\output\04_virtual_clients\clients\
```

예:

```text
VC_001.md
VC_002.md
VC_003.md
...
```

이 파일들은 **분석 기준**이다.

가상 클라이언트 파일 자체를 수정·이동·삭제하지 않는다.

---

### 4.2 리서치 사이트 자료

읽기 전용 기본 경로:

```text
C:\kje\UIUXA\Antigravity\research\batches\
```

이 디렉터리의 실제 존재하고 판독 가능한 리서치 자료를 분석 대상으로 사용한다.

리서치 자료는 가상 클라이언트가 경험하는 **분석 대상 및 관찰 근거**다.

다음은 정상 근거로 사용하지 않는다.

```text
failed
dead
discarded
sample
example
임시 파일
중복 사본
심하게 손상된 파일
```

프로젝트 밖의 리서치 원본은 수정·이동·삭제하지 않는다.

---

## 5. 프로젝트 내부 입력

### 5.1 분석 결과 작성 양식

기본 위치:

```text
input/templates/가상클라이언트 기반 분석 결과 작성 양식.md
```

이 문서는 분석 결과 작성 규격으로 사용한다.

현재 analyze Skill은 이 양식 중 분석 단계에 해당하는 범위를 사용한다.

```text
1. 가상 클라이언트 기본 정보
2. 클라이언트 요구사항 수집
3. 요구사항을 정보 단위로 변환
4. 비슷한 항목끼리 분류
9. 현재 분석 단계에 해당하는 반복 검토
```

현재 실행하지 않는 범위:

```text
5. 계층 구조 확정
6. 최종 레이블 확정
7. 내비게이션 구조 확정
8. 와이어프레임
```

---

### 5.2 출력 예시

선택 위치:

```text
input/examples/사이트분석결과_가상클라이언트_1_스밈.md
```

이 파일은 **결과 문서의 형태와 상세 수준만 참고**한다.

예시에서 복사 금지:

```text
인물명
브랜드명
타깃
사업모델
수치
CTA
메뉴
콘텐츠
기능
리서치 결론
```

예시 파일은 Source 또는 Evidence로 등록하지 않는다.

---

## 6. 작업 디렉터리

없으면 실행 전에 생성한다.

```text
input/
input/templates/
input/examples/

가상 클라이언트 분석 결과/

archive/
archive/previous/
archive/failed/
archive/discarded/

archive/previous/analysis/
archive/failed/analysis/
archive/discarded/analysis/
```

---

## 7. Skill 경로

```text
분석:
.agents/skills/analyze/SKILL.md
```

파일명은 정확히 `SKILL.md`여야 한다.

YAML frontmatter에 다음이 있어야 한다.

```text
name
description
```

Skill이 없거나 읽을 수 없으면 분석을 실행하지 않는다.

규칙 충돌 시 우선순위:

```text
1. 사용자의 현재 명시적 요청
2. AGENTS.md
3. analyze/SKILL.md
4. 기존 출력 파일의 관행
```

---

## 8. 고정 출력 경로

가상 클라이언트별 분석 결과:

```text
C:\kje\UIUXA\WIREFRAME\가상 클라이언트 분석 결과\
```

파일명 규칙:

```text
{Client ID}_{Client 이름}.md
```

Client 이름은 해당 가상 클라이언트 원본에 기재된 이름을 그대로 사용한다.
공백은 제거하며, 임의의 별칭이나 역할명으로 대체하지 않는다.

예:

```text
VC_001_서하린.md
VC_002_김도현.md
VC_003_이수민.md
```

각 결과는 해당 가상 클라이언트 기준의 독립 분석 결과다.

다른 Client 분석 결과를 자동 병합하지 않는다.

### 후속 설계 결과 폴더명 규칙

사용자가 사이트맵·서비스 흐름도·화면 설계서·와이어프레임 등 후속 설계 단계를
명시적으로 요청한 경우에만 다음 경로에 Client별 독립 폴더를 생성한다.

```text
C:\kje\UIUXA\WIREFRAME\가상 클라이언트 설계 결과\{3자리 순번}_{Client 이름}\
```

예:

```text
가상 클라이언트 설계 결과\001_서하린\
가상 클라이언트 설계 결과\002_김도현\
가상 클라이언트 설계 결과\006_정다은\
```

- 순번은 Client ID의 숫자 부분을 3자리로 유지한다.
- Client 이름은 원본 가상 클라이언트에 기재된 이름을 그대로 사용하고 공백은 제거한다.
- 서로 다른 Client의 설계 산출물을 같은 폴더에 혼합하지 않는다.
- 설계 산출물 파일은 해당 Client 폴더 바로 아래에 저장한다.
- 사용자 요청 전에는 설계 폴더나 설계 산출물을 자동 생성하지 않는다.
- `스토리보드 결과\제외항목.txt`는 자동 입력으로 읽거나 적용하지 않는다. 사용자가 해당 파일 적용을 다시 명시적으로 요청한 경우에만 별도로 검토한다.

---

## 9. 실행 요청 해석

다음 요청은 analyze Skill 실행 요청으로 해석한다.

```text
분석해
분석 시작해
분석 진행해
분석 Skill 실행해
analyze 실행
가상 클라이언트 분석해
사이트 분석해
가상 클라이언트 기준으로 사이트 분석해
리서치 사이트 경험시켜
```

### 단일 Client 실행

다음과 같이 특정 Client를 지정하면 해당 Client만 실행한다.

```text
VC_001 분석해
VC_003 사이트 분석해
VC_010만 분석해
```

실행:

```text
지정 Client 파일 확인
→ analyze Skill 확인
→ 작성 양식 확인
→ 리서치 사이트 자료 확인
→ Client 분석 렌즈 생성
→ 리서치 사이트 경험·분석
→ MENU / CONTENT / FUNCTION 도출
→ 검증
→ 해당 Client 분석 결과 저장
→ 중단
```

---

### 전체 Client 반복 실행

다음 요청은 저장소에 있는 정상 가상 클라이언트 전체를 순서대로 분석한다.

```text
전체 가상 클라이언트 분석해
가상 클라이언트 전부 분석해
전체 사이트 분석해
모든 클라이언트 기준으로 분석해
전체 분석 실행
```

실행:

```text
가상 클라이언트 저장소 확인
→ 정상 Client 목록 확정
→ Client ID 순서 정렬
→ FOR EACH CLIENT
     analyze 실행
     결과 검증
     결과 저장
  NEXT CLIENT
→ 전체 반복 완료 보고
→ 중단
```

반복 단위:

```text
VC_001
→ 사이트 경험
→ MENU / CONTENT / FUNCTION
→ VC_001_서하린.md

VC_002
→ 사이트 경험
→ MENU / CONTENT / FUNCTION
→ VC_002_김도현.md

VC_003
→ ...
```

마지막 정상 Client까지 반복한다.

---

## 10. 자동화 작동 방식

현재 프로젝트의 자동화 공식:

```text
[가상 클라이언트 제작 완료]
        ↓
C:\kje\UIUXA\Md_Skill\output\04_virtual_clients\clients\
        ↓
[WIREFRAME analyze Skill]
        ↓
FOR EACH VIRTUAL CLIENT
        ↓
가상 클라이언트 요구·목표·우선순위 파악
        ↓
리서치 사이트 경험·검토
        ↓
가상 클라이언트 관점 유효성 판정
        ↓
MENU / CONTENT / FUNCTION 도출
        ↓
VC_XXX_{Client 이름}.md 저장
        ↓
NEXT CLIENT
```

현재 자동화는 여기서 종료한다.

후속 설계 단계는 자동 실행하지 않는다.

---

## 11. 분석 기준

### 핵심 원칙

```text
분석 기준 = 가상 클라이언트
분석 대상 = 리서치 사이트 자료
분석 결과 = MENU / CONTENT / FUNCTION
```

리서치 사이트 자체가 결과를 결정하지 않는다.

잘못된 흐름:

```text
리서치 사이트에 있음
→ YOVIA에 적용
```

올바른 흐름:

```text
가상 클라이언트 요구
+
리서치 사이트 관찰
+
YOVIA 프로젝트 적합성
→ MENU / CONTENT / FUNCTION 후보
```

---

## 12. 사이트 경험의 정의

이 프로젝트에서 `가상 클라이언트가 리서치 사이트를 경험한다`는 의미는 다음과 같다.

```text
가상 클라이언트의 목표·문제·요구·우선순위를 분석 렌즈로 설정
→ 검증된 리서치 사이트 자료의 메뉴·콘텐츠·기능·인터랙션·구조를 검토
→ 해당 Client 관점에서 유효성, 필요성, 특화성, 충돌 여부를 평가
```

실제 브라우저에서 클릭·구매·회원가입 등을 수행하지 않았다면 다음 표현을 사용하지 않는다.

```text
직접 클릭했다
직접 사용했다
실제로 구매했다
실사용 테스트했다
```

대신:

```text
리서치 자료를 통해 관찰했다
가상 클라이언트 관점에서 평가했다
검증된 사이트 기록을 기준으로 경험 분석했다
```

라고 표현한다.

---

## 13. Client별 독립성

모든 Client는 독립적으로 분석한다.

금지:

```text
VC_001 결과
→ VC_002에 복사

VC_001 MENU
→ 모든 Client 공통 MENU로 자동 확정

이전 Client 결론
→ 다음 Client의 분석 기준으로 사용
```

허용:

여러 Client에서 동일한 결과가 독립적으로 반복 도출되는 것.

단, 각 Client마다 자체 Requirement와 Site 근거를 다시 확인해야 한다.

---

## 14. 분석 결과 필수 축

모든 정상 분석 결과에는 다음 세 영역이 반드시 있어야 한다.

```text
MENU
CONTENT
FUNCTION
```

### MENU

사이트에서 필요한 탐색 항목 후보.

아직 확정하지 않는 것:

```text
최종 사이트맵
최종 GNB
최종 Depth
URL 구조
```

### CONTENT

사용자의 이해·판단·선택을 돕는 정보 후보.

아직 확정하지 않는 것:

```text
최종 카피
최종 콘텐츠 순서
최종 페이지 배치
```

### FUNCTION

사용자의 탐색·비교·확인·전환을 돕는 기능 후보.

아직 확정하지 않는 것:

```text
개발 기술
최종 인터랙션 스펙
최종 구현 방식
```

---

## 15. 근거 연결

핵심 MENU / CONTENT / FUNCTION 결과에는 가능한 범위에서 다음을 연결한다.

```text
Client ID
Requirement ID
Site ID
관찰 내용
관찰 수
확인 가능 분모
우선순위
상태
추가 검증 필요 여부
```

근거가 없는 경우 임의 생성하지 않는다.

```text
not_verified
추가 검증 필요
```

로 표시한다.

---

## 16. 실행 전 검사

### 프로젝트

- 현재 프로젝트 루트가 `C:\kje\UIUXA\WIREFRAME`인가?
- `AGENTS.md`가 현재 프로젝트 파일인가?
- `.agents/skills/analyze/SKILL.md`가 존재하는가?
- output과 archive에 쓸 수 있는가?

### 가상 클라이언트

- 외부 저장소가 존재하는가?
- 정상 `VC_XXX.md` 파일이 존재하는가?
- Client ID가 읽히는가?
- 핵심 Requirement가 존재하는가?

### 양식

- 분석 결과 작성 양식이 존재하는가?
- 읽을 수 있는가?

### 리서치

- `C:\kje\UIUXA\Antigravity\research\batches\`가 존재하는가?
- 분석 가능한 리서치 자료가 존재하는가?
- 파일을 판독할 수 있는가?
- 실패·폐기·예시 파일을 정상 근거로 사용하려 하지 않는가?

핵심 입력이 없으면 중단한다.

---

## 17. STEP 1 — 단일 가상 클라이언트 분석

### 읽기

```text
AGENTS.md
.agents/skills/analyze/SKILL.md

가상 클라이언트:
C:\kje\UIUXA\Md_Skill\output\04_virtual_clients\clients\VC_XXX.md

작성 양식:
input/templates/가상클라이언트 기반 분석 결과 작성 양식.md

리서치 사이트 자료:
C:\kje\UIUXA\Antigravity\research\batches\

선택 예시:
input/examples/사이트분석결과_가상클라이언트_1_스밈.md
```

### 실행

```text
yovia-virtual-client-site-analysis
```

### 저장

```text
C:\kje\UIUXA\WIREFRAME\가상 클라이언트 분석 결과\VC_XXX_{Client 이름}.md
```

### 완료 조건

- 올바른 Client를 사용했는가?
- Client의 Requirement를 분석 기준으로 사용했는가?
- 실제 리서치 사이트 자료를 읽었는가?
- 유효 리서치 사이트 수를 기록했는가?
- MENU 결과가 존재하는가?
- CONTENT 결과가 존재하는가?
- FUNCTION 결과가 존재하는가?
- 핵심 결과가 Requirement와 연결되는가?
- 핵심 결과가 Site 근거와 연결되는가?
- 근거 없는 통계·수치·기능을 만들지 않았는가?
- 충돌·제외·보류를 숨기지 않았는가?
- 다른 Client 결과를 복제하지 않았는가?
- 예시 문서 내용을 복사하지 않았는가?
- 사이트맵을 만들지 않았는가?
- 서비스 흐름도를 만들지 않았는가?
- 화면 설계서를 만들지 않았는가?
- 와이어프레임을 만들지 않았는가?

핵심 조건이 하나라도 실패하면 완료로 판정하지 않는다.

---

## 18. STEP 2 — 전체 가상 클라이언트 반복

사용자가 전체 분석을 요청한 경우 실행한다.

### Client 목록 확정

가상 클라이언트 저장소에서 다음 형식의 정상 파일을 찾는다.

```text
VC_*.md
```

Client ID 기준으로 정렬한다.

예:

```text
VC_001
VC_002
VC_003
...
VC_012
```

### 반복

```text
FOR EACH Client

1. Client 파일 읽기
2. Client Requirement 확인
3. analyze Skill 실행
4. 리서치 사이트 경험 분석
5. MENU / CONTENT / FUNCTION 도출
6. 해당 Client 결과 검증
7. C:\kje\UIUXA\WIREFRAME\가상 클라이언트 분석 결과\ 저장
8. 다음 Client로 이동

END
```

한 Client가 실패하면:

- 해당 결과를 정상 출력으로 확정하지 않는다.
- 실패 원인을 기록한다.
- 핵심 입력 손상이라면 반복을 중단한다.
- 개별 Client 문제이며 다른 Client와 무관한 경우에는 다음 Client 진행 여부를 `analyze/SKILL.md` 실패 규칙에 따라 판단한다.

---

## 19. 기존 출력 및 아카이브

같은 Client ID의 정상 결과가 이미 있으면 덮어쓰기 전에 아카이브한다.

정상 이전 버전:

```text
archive/previous/analysis/
```

파일명:

```text
YYYYMMDD_HHMMSS__VC_001_서하린.md
```

검증 실패:

```text
archive/failed/analysis/
```

파일명:

```text
YYYYMMDD_HHMMSS__FAILED__VC_001_서하린.md
```

폐기:

```text
archive/discarded/analysis/
```

원본 가상 클라이언트와 리서치 사이트 자료는 아카이브 대상으로 이동하지 않는다.

---

## 20. 입력 변경 시 재분석

### 가상 클라이언트 변경

예:

```text
VC_004.md 수정
```

처리:

```text
기존 VC_004_박지안.md 아카이브
→ VC_004만 재분석
```

다른 Client는 자동 재분석하지 않는다.

### 리서치 사이트 자료 변경

새 사이트 추가, 기존 근거 변경, 사이트 상태 변경이 발생한 경우:

```text
영향 범위 확인
→ 필요한 Client 분석만 재검증
```

사용자가 전체 재분석을 요청하면 전체 Client를 다시 실행한다.

---

## 21. 실패 처리

실패 흐름:

```text
1. 실패 원인 확인
2. 자동 수정 가능한 문제인지 판단
3. 가능하면 수정
4. 재검증
5. 통과하면 계속
6. 실패가 지속되면 실패 결과 보관 후 중단 또는 다음 Client 판단
```

자동 수정 가능 예:

```text
출력 디렉터리 누락
파일명 오타
단순 ID 정렬
UTF-8·줄바꿈 문제
기존 결과 아카이브 누락
```

자동 수정 금지 예:

```text
가상 클라이언트 핵심 Requirement 없음
리서치 근거 없음
Site ID 식별 불가
근거 충돌
정확한 수치 확인 불가
YOVIA 확정 사업 조건 부족
```

근거 부족을 추론으로 채우지 않는다.

---

## 22. 중단 보고

```md
# 분석 중단

- **중단 Client**: VC_XXX
- **중단 원인**: ...
- **확인된 입력**: ...
- **부족한 입력**: ...
- **완료된 Client**: ...
- **필요한 조치**: ...
- **재개 위치**: ...
```

---

## 23. 완료 보고

### 단일 Client

```md
# 분석 완료

- **Client ID**: VC_XXX
- **분석한 유효 사이트 수**: ...
- **MENU 후보 수**: ...
- **CONTENT 후보 수**: ...
- **FUNCTION 후보 수**: ...
- **보류·충돌·근거 부족**: ...
- **출력 파일**: `C:\kje\UIUXA\WIREFRAME\가상 클라이언트 분석 결과\VC_XXX_{Client 이름}.md`
- **후속 단계 자동 실행**: 하지 않음
```

### 전체 Client

```md
# 가상 클라이언트 사이트 분석 완료

- **분석 Client 수**: ...
- **완료 Client**: ...
- **실패·보류 Client**: ...
- **출력 위치**: `C:\kje\UIUXA\WIREFRAME\가상 클라이언트 분석 결과\`
- **분석 기준**: 가상 클라이언트
- **분석 대상**: 리서치 사이트 자료
- **출력 축**: MENU / CONTENT / FUNCTION
- **후속 단계 자동 실행**: 하지 않음
```

---

## 24. 금지 사항

- 가상 클라이언트 없이 사이트 분석
- Client 문서만 요약하고 리서치 사이트 분석 생략
- 리서치 사이트의 모든 요소를 자동 채택
- 사이트에 있다는 이유만으로 YOVIA 요구로 확정
- 예시 분석 MD의 내용 복사
- 다른 Client 분석 결과 자동 복제
- Client 간 결과를 조기에 평균화·통합
- 근거 없는 수치·통계·기능 생성
- 실제 사용하지 않은 사이트를 직접 사용했다고 표현
- MENU 후보를 사이트맵으로 확정
- CONTENT 후보를 최종 카피로 확정
- FUNCTION 후보를 구현 사양으로 확정
- 사이트 구조맵 생성
- 사이트맵 생성
- 서비스 흐름도 생성
- 화면 설계서 생성
- 와이어프레임 생성
- 사용자 요청 없이 후속 단계 실행
- 외부 원본 가상 클라이언트 수정·이동·삭제
- 외부 리서치 원본 수정·이동·삭제

---

## 25. 현재 실행 요약

```text
PROJECT ROOT
C:\kje\UIUXA\WIREFRAME


INPUT 1 — 가상 클라이언트
C:\kje\UIUXA\Md_Skill\output\04_virtual_clients\clients\

INPUT 2 — 작성 양식
C:\kje\UIUXA\WIREFRAME\input\templates\
가상클라이언트 기반 분석 결과 작성 양식.md

INPUT 3 — 리서치 사이트
C:\kje\UIUXA\Antigravity\research\batches\

OPTIONAL — 출력 예시
C:\kje\UIUXA\WIREFRAME\input\examples\
사이트분석결과_가상클라이언트_1_스밈.md


SKILL
C:\kje\UIUXA\WIREFRAME\.agents\skills\analyze\SKILL.md


PROCESS
가상 클라이언트
→ 리서치 사이트 경험
→ Client 관점 평가
→ MENU / CONTENT / FUNCTION
→ 결과 저장
→ 다음 Client
→ 반복


OUTPUT
C:\kje\UIUXA\WIREFRAME\가상 클라이언트 분석 결과\
VC_XXX_{Client 이름}.md


CURRENT STOP
사이트맵 생성 금지
서비스 흐름도 생성 금지
화면 설계서 생성 금지
와이어프레임 생성 금지
```
