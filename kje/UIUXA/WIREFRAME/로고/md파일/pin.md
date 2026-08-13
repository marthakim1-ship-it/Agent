# YOVIA Pinterest 로고 레퍼런스 수집 규칙

## 1. 실행 명령

사용자가 아래 문장을 입력하면 레퍼런스 수집을 즉시 시작한다.

```text
레퍼런스 수집 시작해
```

개수를 지정하지 않으면 1장만 수집한다. 개수를 지정하면 요청한 수량만 수집한다.

## 2. 폴더와 입력 역할

- `../input/`: 찾으려는 로고의 형태·구조·비율·방향성을 결정하는 주 기준
- `../레퍼런스/`: 결과의 색상·평면성·완성도·분위기를 결정하는 스타일 기준
- `../output/`: 검증을 통과한 Pinterest 수집 JPG 저장 폴더

실행 전에 `input/`과 `레퍼런스/`의 판독 가능한 이미지 전체를 확인한다. 한쪽만 보고 검색하지 않는다.

## 3. 브랜드와 스타일 기준

- 배경: 흰색
- 심벌: 검정 단색 또는 흑백·회색조
- 형태: 원·타원·링·호의 중첩, 연결, 반복, 회전 또는 유기적 흐름
- 표현: 목업이나 사진 효과가 없는 평면 그래픽
- 인상: 간결함, 균형, 연결, 순환, 건강함, 올인원, 현대적 신뢰감
- 식별성: 작은 크기에서도 읽히는 명확한 실루엣
- 공간: 양화와 음화 공간이 균형을 이루는 구조

레퍼런스 이미지 안의 특정 로고를 그대로 복제하거나 동일 이미지를 다시 수집하지 않는다.

## 4. 입력 이미지 분석 기준

검색 전에 `input/` 이미지를 보고 다음 항목을 기록한다.

1. 기본 도형: 원, 타원, 링, 호, 선, 면
2. 조합 방식: 중첩, 교차, 연결, 반복, 회전, 방사
3. 구성: 대칭·비대칭, 좌우 흐름, 중심 집중도
4. 선과 면의 비율
5. 양화·음화 공간
6. 워드마크보다 심벌 형태의 우선순위

## 5. Pinterest 검색어 규칙

검색어는 `형태 + 구성 + 스타일 + 용도 + 색상` 순으로 조합한다.

### 우선 검색어

```text
abstract overlapping circles logo black and white
minimal overlapping circle logo monochrome
geometric circle overlap symbol logo
abstract connected rings logo grayscale
organic circular line logo black
asymmetric overlapping ellipse logo minimal
```

### 웹 검색 보조어

```text
site:pinterest.com "overlapping circles logo" monochrome
site:pinterest.com "abstract circle logo" black white
site:pinterest.com "connected rings logo" minimal
site:pinterest.com "overlapping ellipse logo" geometric
```

결과가 부족하면 다음 순서로 한 단어씩 확장한다.

```text
circle → ellipse → ring → loop → orbit → organic geometry
overlapping → connected → interlocking → layered → flowing
logo → symbol → mark → icon → identity
```

한 검색어에서 적합한 후보가 없으면 기준을 낮추지 말고 다음 검색어로 전환한다.

## 6. 후보 선정 기준

아래 조건을 모두 만족해야 한다.

- `input/`과 핵심 형태·구조가 연결된다.
- `레퍼런스/`의 흑백·평면 심벌 스타일과 연결된다.
- 원·타원·링의 중첩 또는 연결이 핵심 조형이다.
- 단독 심벌 또는 로고 마크로 사용할 수 있다.
- 흰색 또는 단색 배경에서 전체 형태가 보인다.
- 검정·흰색·회색조로도 구조가 유지된다.
- 워터마크나 UI가 형태를 가리지 않는다.

여러 후보가 있으면 다음 순서로 선택한다.

1. `input/` 형태 유사성
2. `레퍼런스/` 스타일 유사성
3. 흑백 적용 가능성
4. 작은 크기의 식별성
5. 평면 심벌 여부
6. 원본 핀과 공개 대표 이미지 확인 가능 여부

## 7. 제외 기준

다음 이미지는 저장하지 않는다.

1. 컬러가 형태 판단에 필수인 로고
2. 명함·간판·패키지 목업
3. 포스터·배경·3D 아트·사진에 가까운 이미지
4. 원형 요소가 단순 장식인 이미지
5. 텍스트 워드마크가 중심인 이미지
6. Pinterest 로그인·가입 팝업이 겹친 캡처
7. Pinterest UI나 검색 결과 그리드가 포함된 캡처
8. 심한 워터마크·잘림·저해상도 이미지
9. 기존 `output/` 또는 `레퍼런스/` 이미지와 중복되는 이미지

## 8. 안정적인 수집 절차

```text
input 이미지 분석
→ 레퍼런스 이미지 스타일 분석
→ Pinterest 검색
→ 핀 상세 이미지 확인
→ 고유 핀 URL 기록
→ 이미지 영역 캡처 또는 공개 대표 이미지 확보
→ output에 다음 번호 JPG 저장
→ 결과 이미지 재검증
```

이 문서에서 `캡처`는 다음 중 하나를 뜻한다.

1. 핀 상세 화면에서 로고 이미지 영역만 잘리지 않게 캡처
2. Pinterest 공개 대표 이미지(`i.pinimg.com`)를 확보해 JPG로 저장

로그인 팝업, Pinterest 헤더, 저장 버튼, 주변 추천 이미지는 결과 JPG에 포함하지 않는다. 대표 이미지 주소를 확인할 수 없으면 다른 핀으로 전환한다.

## 9. 저장 규칙

- 저장 형식: JPG
- 저장 위치: `../output/`
- 파일명:

```text
pinterest_similar_logo_01.jpg
pinterest_similar_logo_02.jpg
```

- 기존 파일 중 가장 큰 번호 다음 번호를 사용한다.
- 기존 결과를 덮어쓰지 않는다.
- 한 번에 요청된 개수만 생성한다.
- JPG가 아닌 원본은 JPG로 변환한 뒤 다시 확인한다.

## 10. 검증 체크리스트

- [ ] 요청 수량과 신규 파일 수가 일치한다.
- [ ] JPG가 정상적으로 열린다.
- [ ] 로고 전체가 잘리지 않고 보인다.
- [ ] 팝업·Pinterest UI·주변 추천 이미지가 없다.
- [ ] 흰색 또는 단색 배경이다.
- [ ] 흑백만으로 형태를 이해할 수 있다.
- [ ] 평면 심벌이며 목업이 아니다.
- [ ] `input/` 형태 기준과 연결된다.
- [ ] `레퍼런스/` 스타일 기준과 연결된다.
- [ ] 기존 이미지와 중복되지 않는다.
- [ ] 원본 Pinterest 핀 URL을 기록했다.

## 11. 완료 보고

```text
- 초안 분석 키워드: ...
- 레퍼런스 스타일 키워드: ...
- 선택 이유: ...
- 저장 파일: 로고/output/pinterest_similar_logo_XX.jpg
- Pinterest 핀: https://...
- 검증 결과: JPG / 팝업 없음 / UI 없음 / 중복 없음
```
