# YOVIA Pinterest 레퍼런스 Flow 프롬프트 분석 규칙

## 1. 작업 목적

`../output/`의 Pinterest 레퍼런스 JPG를 분석하여 Flow 이미지 생성 기능에 바로 사용할 수 있는 영문 프롬프트를 작성한다.

- 레퍼런스를 그대로 복제하지 않는다.
- YOVIA의 새로운 로고 방향을 탐색하는 프롬프트를 만든다.
- `input/`의 형태 방향, `레퍼런스/`의 스타일 기준, 개별 `output/` 이미지의 조형 특징을 함께 반영한다.

## 2. 분석 대상

- 대상: `../output/*.jpg`
- 제외: `flow.md`, Markdown, 임시 파일, Pinterest UI 캡처, 판독 불가 이미지
- 한 이미지마다 독립적으로 분석하며 다른 이미지의 특징을 자동 혼합하지 않는다.

## 3. 이미지별 분석 항목

1. 기본 도형: 원, 타원, 링, 호, 반복 모듈
2. 조합 방식: 중첩, 교차, 연결, 회전, 방사, 연속 흐름
3. 실루엣: 대칭·비대칭, 열린 형태·닫힌 형태, 중심 집중도
4. 양화·음화 공간의 관계
5. 선과 면의 비율 및 굵기
6. 작은 크기에서의 식별성
7. YOVIA와 연결할 인상: 간편함, 건강함, 올인원, 균형, 부드러운 흐름
8. 제거할 요소: 컬러, 3D, 목업, 사진 질감, 워터마크, 문자, 불필요한 장식

## 4. Flow 프롬프트 작성 규칙

- 프롬프트 본문은 반드시 영문으로 작성한다.
- 이미지당 하나의 독립 프롬프트를 작성한다.
- Flow에 바로 입력할 수 있는 완결된 명령문으로 작성한다.
- 특정 브랜드·작가·기존 로고를 복제하거나 모사하도록 지시하지 않는다.
- 최종 결과는 흰색 배경의 검정 단색 평면 심벌을 기본으로 한다.
- 각 이미지에서 실제로 관찰한 구조에 맞게 프롬프트를 구체화한다.

각 프롬프트에는 가능한 범위에서 다음 조건을 포함한다.

```text
Create an original minimalist logo symbol for YOVIA...
geometric construction and composition
overlapping circular or organic forms
black symbol on a clean white background
flat vector-like appearance
balanced positive and negative space
clear silhouette at small sizes
no text, no letters, no mockup, no 3D, no gradients, no shadows, no watermark
```

위 문장을 모든 이미지에 그대로 반복하지 말고 분석 결과에 맞게 조정한다.

## 5. 저장 형식

프롬프트는 다음 파일 하나에 누적한다.

```text
../output/flow.md
```

이미지 파일명을 Markdown 대제목으로 쓰고 바로 아래에 영문 프롬프트를 작성한다.

```md
# pinterest_similar_logo_01.jpg

Create an original minimalist logo symbol for YOVIA ...

# pinterest_similar_logo_02.jpg

Create an original minimalist logo symbol for YOVIA ...
```

- 실제 JPG 파일명과 대제목을 정확히 일치시킨다.
- 동일한 파일명의 대제목을 중복 생성하지 않는다.
- 이미지당 프롬프트는 정확히 1개만 둔다.

## 6. 재작성 금지

한 번 작성한 이미지별 프롬프트는 사용자가 아래 명령을 입력하기 전까지 다시 작성하거나 수정하지 않는다.

```text
재실행
```

### 일반 실행

1. `output/flow.md`가 없으면 새로 생성한다.
2. `flow.md`에 없는 새 JPG만 분석해 추가한다.
3. 같은 파일명의 대제목이 있으면 기존 프롬프트를 유지하고 건너뛴다.
4. 이미지의 수정 시각이 바뀌어도 기존 항목을 유지한다.
5. 문장 교정·확장·요약도 재작성으로 간주하여 실행하지 않는다.

### `재실행` 명령

1. `output/`의 현재 JPG 목록을 다시 확인한다.
2. 각 이미지를 다시 분석한다.
3. 기존 파일명 항목을 최신 영문 프롬프트로 교체한다.
4. 현재 존재하지 않는 이미지의 항목은 별도 요청 없이 삭제하지 않는다.
5. 파일명 대제목과 이미지별 1개 프롬프트 구조를 유지한다.

## 7. 검증 체크리스트

- [ ] 모든 프롬프트 본문이 영문이다.
- [ ] 각 대제목이 실제 JPG 파일명과 일치한다.
- [ ] 이미지당 프롬프트가 정확히 1개다.
- [ ] 흰색 배경·검정 단색·평면 심벌 조건이 포함된다.
- [ ] 문자·목업·3D·그라디언트·그림자·워터마크 제외 조건이 포함된다.
- [ ] 레퍼런스를 그대로 복제하도록 지시하지 않는다.
- [ ] `재실행` 명령 없이 기존 항목을 변경하지 않았다.

## 8. 완료 보고

```text
- 분석한 신규 이미지: ...
- 건너뛴 기존 이미지: ...
- 저장 파일: 로고/output/flow.md
- 프롬프트 언어: English
- 기존 프롬프트 재작성: 없음 또는 재실행
```
