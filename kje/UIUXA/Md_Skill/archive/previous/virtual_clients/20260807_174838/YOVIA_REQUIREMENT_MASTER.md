# YOVIA REQUIREMENT MASTER

## 문서 상태

- 생성 범위: 가상 클라이언트 1개 시험 생성
- 요구사항 수: 13
- 브랜드 고정 기준: `input/00_brand/YOVIA_BRAND_CANONICAL.md`
- 주의: 페르소나 요구의 제품 사양·효능은 자동 확정하지 않음

| Requirement ID | Virtual Client | Request | Category | Priority | Source | Evidence | Confidence | Brand Fit | Brand Fit Reason | Relationship Type | Conflict | Validation Needed | Notes |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| VC001-REQ-001 | VC-001 | YOVIA의 브랜드 정의와 핵심 편익을 첫 화면에서 함께 이해 | Brand | Must | SRC-BRAND-001 | EVD-0001 | High | High | 최상위 확정 정의와 직접 일치 | SPECIALIZED | 없음 | false | 제품 경험 발주 관점 |
| VC001-REQ-002 | VC-001 | 파우치·빌트인 스푼·토핑의 올인원 과정을 제품 자산으로 설명 | Product Understanding | Must | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0002, EVD-0004 | High | High | 확정 차별화 요소 | SPECIALIZED | 없음 | false | 사용법 자체가 가치 |
| VC001-REQ-003 | VC-001 | 출근·등교·이동·업무의 편리한 사용 상황 제시 | Content | Must | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0003, EVD-0004 | High | High | 확정 핵심 타깃과 상황 | SPECIALIZED | 없음 | false | 운전 중 취식 권장 제외 |
| VC001-REQ-004 | VC-001 | 확정된 원료·영양·알레르기 정보를 빠르게 확인 | Trust | Must | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0005 | High | High | 명확성과 신뢰 가치에 부합 | DERIVED | 없음 | true | 실제 확정 데이터 필요 |
| VC001-REQ-005 | VC-001 | 모바일 핵심 정보와 CTA 흐름 최적화 | Responsive | Must | SRC-BRAND-001, SRC-PDF-001, SRC-PDF-002, SRC-PDF-003 | EVD-0006, EVD-0007 | Medium | High | 핵심 타깃의 모바일 이용 맥락과 부합 | DERIVED | 없음 | true | CTA 미확정 |
| VC001-REQ-006 | VC-001 | 제품 구조와 사용법을 단계적으로 설명 | UX | Should | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0002, EVD-0004 | High | High | 확정 사용 경험을 지원 | SPECIALIZED | 없음 | false | 최종 단계 수는 후속 결정 |
| VC001-REQ-007 | VC-001 | 밝고 현대적인 컬러·정보 위계, 제품 중심 비주얼 | Visual | Should | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0008 | High | High | 확정 컬러·톤과 일치 | CONFLICT | VC001-REQ-013 일부 극단 취향 | false | 취향보다 브랜드 기준 우선 |
| VC001-REQ-008 | VC-001 | 검증된 건강·영양 표현만 사용 | Constraint | Should | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0005, EVD-0010 | High | High | 브랜드 금지 원칙 준수 | VALIDATION_REQUIRED | VC001-REQ-013의 효능 기대 | true | 법적·과학적 검증 필요 |
| VC001-REQ-009 | VC-001 | 확정 제품 선택지를 비교하기 쉬운 카드로 표현 | Information | Should | SRC-PDF-001, SRC-PDF-002 | EVD-0006 | Medium | Medium | 탐색성은 적합하나 라인업 미확정 | DERIVED | 없음 | true | 제품군 확정 후 적용 |
| VC001-REQ-010 | VC-001 | 확정 판매 채널에 맞는 구체적 CTA 제공 | Conversion | Should | SRC-PDF-001, SRC-PDF-002, SRC-PDF-003 | EVD-0006, EVD-0007 | Medium | High | 명확한 다음 행동을 지원 | DERIVED | 없음 | true | 채널·정책 확정 필요 |
| VC001-REQ-011 | VC-001 | 검증된 누수·오염·폐기 부담 자료를 신뢰 콘텐츠로 활용 | Trust | Could | SRC-PER-001, SRC-PER-002 | EVD-0004, EVD-0009 | Medium | Medium | 편의 가치와 연결되나 시험 근거 없음 | VALIDATION_REQUIRED | 없음 | true | 시험 전 단정 금지 |
| VC001-REQ-012 | VC-001 | 대체 패키지 구조를 검증 전 채택하지 않음 | Technical | Hold | SRC-PER-001, SRC-PER-002 | EVD-0009 | Low | Low | 일부 니즈는 관련되나 확정 방향과 관계 불명 | CONFLICT | 확정 빌트인 스푼·토핑 경험 | true | 기술·사업 검증 필요 |
| VC001-REQ-013 | VC-001 | 미검증 영양 수치·건강 효능을 제품 가치나 CTA로 사용하지 않음 | Constraint | Hold | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0010 | Low | Conflict | 확정되지 않은 효능은 브랜드 원칙과 충돌 | BRAND_CONFLICT | VC001-REQ-008 | true | 검증되기 전 금지 |

## 집계

- Priority: Must 5 / Should 5 / Could 1 / Hold 2
- Relationship: COMMON 0 / SPECIALIZED 4 / CONFLICT 2 / DERIVED 3 / VALIDATION_REQUIRED 2 / BRAND_CONFLICT 1
- Brand Fit: High 9 / Medium 2 / Low 1 / Conflict 1
- Validation Needed: 8
