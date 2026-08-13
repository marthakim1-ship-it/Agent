# YOVIA SOURCE TRACEABILITY

## 1. Source 목록

| Source ID | 파일 | 유형 | 상태 | 사용 여부 |
|---|---|---|---|---|
| SRC-BRAND-001 | `input/00_brand/YOVIA_BRAND_CANONICAL.md` | 브랜드 원본 기준 | verified canonical | 사용 |
| SRC-PDF-001 | `input/02_virtual_client/가상클라이언트_1_윤서진_모아온.pdf` | 검증용 발주 브리프 | readable | 구조 원칙에 사용 |
| SRC-PDF-002 | `input/02_virtual_client/가상클라이언트_2_박도윤_텐핏.pdf` | 검증용 발주 브리프 | readable | 구조 원칙에 사용 |
| SRC-PDF-003 | `input/02_virtual_client/가상클라이언트_3_이혜원_동행온.pdf` | 검증용 발주 브리프 | readable | 구조 원칙에 사용 |
| SRC-PER-001 | `input/03_persona/페르소나 인터뷰01.txt` | 페르소나·인터뷰 자료 | readable; representativeness not verified | 사용자 문제·요구에 사용 |
| SRC-PER-002 | `input/03_persona/페르소나 인터뷰02.txt` | 페르소나·인터뷰 자료 | readable; representativeness not verified | 사용자 문제·요구에 사용 |
| SRC-REF-001 | `output/01_research/YOVIA_BRAND_REFERENCE_RESEARCH_200.md` | 보조 리서치 | 이번 생성에서 미검증 | 보류 |
| SRC-REF-002 | `output/02_classification/YOVIA_REFERENCE_CLASSIFICATION.md` | 보조 분류 | 이번 생성에서 미검증 | 보류 |
| SRC-REF-003 | `output/03_analysis/YOVIA_RESEARCH_ANALYSIS.md` | 보조 분석 | 이번 생성에서 미검증 | 보류 |

## 2. Evidence → Insight → Need

| Evidence ID | Source | Type | Evidence 요약 | Insight | Need |
|---|---|---|---|---|---|
| EVD-0001 | SRC-BRAND-001 | stated | YOVIA는 그릭요거트 기반 간편 건강식 | 정체성과 편익을 분리하면 이해가 늦어짐 | 즉시 이해 가능한 브랜드 정의 |
| EVD-0002 | SRC-BRAND-001 | stated | 파우치·빌트인 스푼·토핑이 확정 경험 | 사용 방법이 차별화의 핵심 | 제품 구조와 사용법 설명 |
| EVD-0003 | SRC-BRAND-001 | stated | 시간 부족 20~30대와 이동·업무 상황 | 상황 기반 메시지가 관련성을 높임 | 사용 맥락 중심 콘텐츠 |
| EVD-0004 | SRC-PER-001, SRC-PER-002 | observed | 스푼·컵·흘림·오염·정리 부담이 반복 | 준비부터 폐기까지 마찰을 줄여야 함 | 간편하고 깔끔한 취식 경험 |
| EVD-0005 | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | conflict | 성분·수치 신뢰 요구와 다수 미검증 수치·효능 요구가 공존 | 정보 투명성과 검증 경계가 필요 | 확정/미확정 정보 분리 |
| EVD-0006 | SRC-PDF-001, SRC-PDF-002, SRC-PDF-003 | observed | 브리프가 정보 우선순위·카드·CTA·신뢰 요소를 반복 요구 | 발주 관점은 사용자 행동과 제약을 구조화해야 함 | 탐색·전환·신뢰 요구 조정 |
| EVD-0007 | SRC-BRAND-001, SRC-PDF-001, SRC-PDF-002, SRC-PDF-003 | derived | 모바일 친화성과 명확한 CTA가 중요하지만 YOVIA CTA는 미확정 | 행동 유도는 정책 확정 후 구체화해야 함 | 모바일 우선 전환 설계 기준 |
| EVD-0008 | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | conflict | 확정된 밝고 현대적 톤과 다양한 극단적 취향이 공존 | 브랜드 시스템이 취향 요구보다 우선 | 제품 중심의 일관된 비주얼 |
| EVD-0009 | SRC-PER-001, SRC-PER-002 | hypothesis | 듀얼 챔버·스파우트·특수 실링 등 패키지 요구 | 관련성은 있으나 확정 사양 아님 | 제품·사용성 시험 후 판단 |
| EVD-0010 | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | conflict | 고단백·장 건강·이너뷰티 등 효능과 수치 요구 | 검증 전 채택하면 브랜드 원칙 위반 | 효능 표현 보류와 검증 |
| EVD-0011 | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | derived | 개봉·혼합·취식·정리 과정의 마찰이 반복됨 | 물리적 사용 과정을 이해시켜야 함 | 단계별 패키지 사용성 설명 |
| EVD-0012 | SRC-PER-001, SRC-PER-002 | hypothesis | 누수·내압·잔여물·폐기 개선 요구가 반복됨 | 성능 기대는 높지만 시험 근거가 없음 | 시험 기반 품질 정보 |
| EVD-0013 | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | conflict | 정확한 수치·인증 요구와 미확정 데이터가 공존 | 정보 상태와 근거 출처가 필요 | 검증된 성분·영양 정보 체계 |
| EVD-0014 | SRC-BRAND-001, SRC-PDF-003 | derived | 신뢰와 접근성이 필요하나 의료기관 같은 표현은 회피 | 친근하고 읽기 쉬운 신뢰 설계가 필요 | 단계적 정보 공개와 비의료적 표현 |
| EVD-0015 | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | observed | 출근·등교·업무·운동 등 상황별 편의 요구가 반복됨 | 사용자는 자기 상황과 제품을 연결해야 함 | 상황별 제품 탐색 |
| EVD-0016 | SRC-BRAND-001, SRC-PDF-001, SRC-PDF-002 | conflict | 명확한 CTA·구독 흐름 요구와 미확정 판매 정책이 공존 | 전환은 정책 확정 후 구체화해야 함 | 조건부 커머스·반복 구매 흐름 |
| EVD-0017 | SRC-BRAND-001 | stated | 제품·패키지·질감·토핑·사용 과정과 컬러가 확정 시각 자산 | 브랜드 이미지는 제품 이해를 강화해야 함 | 제품 중심 크리에이티브 시스템 |
| EVD-0018 | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | conflict | 밝고 현대적인 기준과 다양한 감성·극단 취향이 공존 | 취향을 수용하되 브랜드 일관성이 우선 | 상황 콘텐츠와 통제된 시각 다양성 |
| EVD-0019 | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | conflict | 맛·질감·토핑 선호가 다양하나 YOVIA 라인업은 미확정 | 감각 정보와 제품 사실의 상태 구분 필요 | 검증 가능한 맛·식감 탐색 |
| EVD-0020 | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | conflict | 단위 가격·용량·포만감 비교 요구와 미확정 가격·용량이 공존 | 구매 가치 판단 기준과 정책 상태가 필요 | 가격·가치 투명성 |
| EVD-0021 | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | conflict | 가족 공유·무첨가·알레르기 요구가 있으나 적용 대상과 근거가 미확정 | 주의 정보와 적용 범위를 우선해야 함 | 가족·안심 정보 체계 |
| EVD-0022 | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | hypothesis | 잔여물·폐기·친환경 소재 요구가 반복되나 소재·효과 근거가 없음 | 사용 후 경험과 환경 주장 통제가 필요 | 폐기 안내와 그린워싱 방지 |
| EVD-0023 | SRC-BRAND-001, SRC-PDF-001, SRC-PDF-002, SRC-PDF-003 | derived | 모바일 명확성·상태·CTA 요구를 다양한 입력·인지 조건에서도 유지해야 함 | 색상·이미지에 의존하지 않는 정보와 복구가 필요 | 포용적 정보 접근성 |

## 3. 추적 체인

| Source → Evidence | Insight / Need | Virtual Client | Requirements |
|---|---|---|---|
| SRC-BRAND-001 → EVD-0001~0003 | 브랜드 정의·올인원·사용 맥락 | VC-001 | VC001-REQ-001, 002, 003, 006 |
| SRC-PER-001/002 → EVD-0004~0005 | 마찰 감소·정보 신뢰 | VC-001 | VC001-REQ-002~004, 008, 011 |
| SRC-PDF-001/002/003 → EVD-0006~0007 | 탐색·CTA·신뢰 요소의 발주 기준 | VC-001 | VC001-REQ-005, 009, 010 |
| SRC-BRAND-001 + SRC-PER-001/002 → EVD-0008~0010 | 브랜드 일관성과 미검증 요구 경계 | VC-001 | VC001-REQ-007, 008, 011~013 |
| SRC-BRAND-001 + SRC-PER-001/002 → EVD-0011~0012 | 패키지 사용 흐름과 성능 검증 | VC-002 | VC002-REQ-001~006 |
| SRC-BRAND-001 + SRC-PER-001/002 + SRC-PDF-003 → EVD-0013~0014 | 성분·영양 신뢰와 비의료적 접근성 | VC-003 | VC003-REQ-001~006 |
| SRC-BRAND-001 + SRC-PDF-001/002 + SRC-PER-001/002 → EVD-0015~0016 | 상황 탐색과 조건부 전환 | VC-004 | VC004-REQ-001~006 |
| SRC-BRAND-001 + SRC-PER-001/002 → EVD-0017~0018 | 제품 중심 브랜드 콘텐츠 | VC-005 | VC005-REQ-001~006 |
| SRC-BRAND-001 + SRC-PER-001/002 → EVD-0019 | 맛·식감 정보와 라인업 통제 | VC-006 | VC006-REQ-001~006 |
| SRC-BRAND-001 + SRC-PER-001/002 → EVD-0020 | 용량·가격·가치 판단 | VC-007 | VC007-REQ-001~006 |
| SRC-BRAND-001 + SRC-PER-001/002 → EVD-0021 | 가족 공유·주의 정보 | VC-008 | VC008-REQ-001~006 |
| SRC-BRAND-001 + SRC-PER-001/002 → EVD-0022 | 정리·폐기·환경 주장 | VC-009 | VC009-REQ-001~006 |
| SRC-BRAND-001 + SRC-PDF-001/002/003 → EVD-0023 | 포용적 정보·상태·복구 | VC-010 | VC010-REQ-001~006 |

## 4. 보류·제한

- 보조 리서치·분류·분석 파일은 이번 1개 시험 생성에서 버전 정합성을 재검증하지 않아 보류했다.
- 페르소나 TXT는 읽을 수 있으나 실제 인터뷰 방법과 표본 대표성은 확인되지 않았다.
- M4A 자료는 발견되지 않았다.
- 이름과 직책은 `synthetic`; 핵심 요구는 위 Source/Evidence에 연결했다.
