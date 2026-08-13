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
| VC002-REQ-001 | VC-002 | 확정 패키지·스푼·토핑 관계를 실제 제품으로 설명 | Product Understanding | Must | SRC-BRAND-001 | EVD-0002 | High | High | 확정 차별화 요소 | COMMON | 없음 | false | VC-001과 공통 |
| VC002-REQ-002 | VC-002 | 개봉부터 취식·정리까지 순서대로 설명 | UX | Must | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0004, EVD-0011 | High | High | 간편 경험과 직접 일치 | SPECIALIZED | 없음 | false | 패키지 사용성 |
| VC002-REQ-003 | VC-002 | 패키지 성능은 검증 결과가 있을 때만 표시 | Trust | Must | SRC-PER-001, SRC-PER-002 | EVD-0012 | Medium | High | 과장 방지 | VALIDATION_REQUIRED | 없음 | true | 시험 필요 |
| VC002-REQ-004 | VC-002 | 모바일에서 부품·단계·주의사항을 명확히 표시 | Responsive | Should | SRC-BRAND-001, SRC-PER-001 | EVD-0011 | Medium | High | 사용 이해 지원 | SPECIALIZED | 없음 | false | 접근성 포함 |
| VC002-REQ-005 | VC-002 | 사용 전후와 정리 부담 감소를 검증 이미지로 설명 | Content | Should | SRC-PER-001, SRC-PER-002 | EVD-0004, EVD-0012 | Medium | Medium | 관련성은 높으나 시험 필요 | VALIDATION_REQUIRED | 없음 | true | 실제 촬영 필요 |
| VC002-REQ-006 | VC-002 | 대체 패키지 구조를 검증 전 대안으로 보존 | Technical | Hold | SRC-PER-001, SRC-PER-002 | EVD-0009 | Low | Low | 확정 사양 아님 | CONFLICT | 확정 패키지 방향 | true | 기술 검증 필요 |
| VC003-REQ-001 | VC-003 | 확정 정보와 실제 원료·영양·알레르기 정보 구분 | Trust | Must | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0005, EVD-0013 | High | High | 명확성과 신뢰에 부합 | COMMON | 없음 | true | 실제 데이터 필요 |
| VC003-REQ-002 | VC-003 | 영양 수치·인증·시험은 근거 문서가 있는 값만 노출 | Constraint | Must | SRC-BRAND-001 | EVD-0013 | High | High | 금지 원칙 준수 | COMMON | 없음 | true | 문서 연결 필요 |
| VC003-REQ-003 | VC-003 | 미검증 건강·의료 효능을 구매 문구로 사용 금지 | Constraint | Must | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0010 | High | High | 브랜드 경계 준수 | COMMON | VC001-REQ-013 | true | 효능 검증 필요 |
| VC003-REQ-004 | VC-003 | 모바일에서 핵심 성분과 상세 근거를 단계적으로 제공 | Information | Should | SRC-PER-001, SRC-PER-002, SRC-PDF-003 | EVD-0014 | Medium | High | 정보 접근성 향상 | SPECIALIZED | 없음 | true | 상세 데이터 필요 |
| VC003-REQ-005 | VC-003 | 전문적이되 병원 같은 공포·의학 이미지 회피 | Visual | Should | SRC-BRAND-001, SRC-PDF-003 | EVD-0014 | Medium | High | 브랜드 톤과 부합 | MAJORITY | 없음 | false | 친근한 신뢰 표현 |
| VC003-REQ-006 | VC-003 | QR 배치 추적 등 고도화 정보 기능 보류 | Technical | Hold | SRC-PER-001 | EVD-0010, EVD-0013 | Low | Low | 데이터 체계 미확정 | VALIDATION_REQUIRED | 없음 | true | 인프라 검증 필요 |
| VC004-REQ-001 | VC-004 | 핵심 사용 상황과 해결 문제를 빠르게 제시 | Content | Must | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0003, EVD-0015 | High | High | 핵심 타깃과 일치 | COMMON | 없음 | false | VC-001·005 공통 |
| VC004-REQ-002 | VC-004 | 모바일 이해→검토→확정 CTA 흐름 제공 | Conversion | Must | SRC-BRAND-001, SRC-PDF-001, SRC-PDF-002 | EVD-0007, EVD-0016 | Medium | High | 모바일 편의와 부합 | COMMON | 정보량 과다 | true | CTA 확정 필요 |
| VC004-REQ-003 | VC-004 | 가격·배송·구독·할인은 확정 정책만 표시 | Constraint | Must | SRC-BRAND-001 | EVD-0016 | High | High | 임의 정보 생성 방지 | MAJORITY | 없음 | true | 정책 필요 |
| VC004-REQ-004 | VC-004 | 확정 옵션을 사용 상황과 선택 기준으로 비교 | Navigation | Should | SRC-PDF-001, SRC-PDF-002 | EVD-0006, EVD-0015 | Medium | Medium | 탐색 적합, 옵션 미확정 | DERIVED | 없음 | true | 라인업 필요 |
| VC004-REQ-005 | VC-004 | CTA에 실제 다음 행동을 구체적으로 표현 | Conversion | Should | SRC-PDF-001, SRC-PDF-002, SRC-PDF-003 | EVD-0006 | Medium | High | 행동 명확성 지원 | COMMON | 없음 | true | 행동 정의 필요 |
| VC004-REQ-006 | VC-004 | 확정 시 반복 구매 혜택과 관리 방식 설명 | Retention | Could | SRC-PER-001 | EVD-0016 | Low | Medium | 습관 유지와 관련, 정책 미확정 | VALIDATION_REQUIRED | 없음 | true | 구독 미확정 |
| VC005-REQ-001 | VC-005 | 제품·질감·토핑·개봉·섭취를 핵심 시각 자산으로 사용 | Visual | Must | SRC-BRAND-001 | EVD-0017 | High | High | 확정 시각 자산 | COMMON | 없음 | false | VC-001·002 공통 |
| VC005-REQ-002 | VC-005 | 밝고 현대적인 YOVIA 인상과 제품 중심성 유지 | Brand | Must | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0001, EVD-0008 | High | High | 확정 톤과 일치 | MAJORITY | 극단 취향 | false | 브랜드 기준 우선 |
| VC005-REQ-003 | VC-005 | 확정 컬러를 정보 위계와 탐색 단서로 사용 | UI | Should | SRC-BRAND-001 | EVD-0017 | High | High | 확정 컬러 활용 | SPECIALIZED | 없음 | false | 접근성 검증 필요 |
| VC005-REQ-004 | VC-005 | 실제 사용 장면으로 스토리와 편의성 연결 | Content | Should | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0018 | Medium | High | 사용 상황과 부합 | COMMON | 없음 | false | 실제 촬영 권장 |
| VC005-REQ-005 | VC-005 | 모바일 이미지가 설명과 CTA를 밀어내지 않게 조절 | Responsive | Should | SRC-BRAND-001, SRC-PDF-001 | EVD-0018 | Medium | High | 모바일 이해 지원 | MAJORITY | 대형 비주얼 | false | 성능 고려 |
| VC005-REQ-006 | VC-005 | 미확정 맛·기능·효능의 제품화 비주얼 금지 | Constraint | Hold | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0008, EVD-0010 | High | Conflict | 오인 가능성으로 브랜드 원칙 충돌 | BRAND_CONFLICT | 감성·기능성 요구 | true | 검증 전 금지 |

## 집계

- Priority: Must 16 / Should 14 / Could 2 / Hold 5
- Relationship: COMMON 9 / MAJORITY 4 / SPECIALIZED 8 / CONFLICT 3 / DERIVED 5 / VALIDATION_REQUIRED 6 / BRAND_CONFLICT 2
- Brand Fit: High 27 / Medium 5 / Low 3 / Conflict 2
- Validation Needed: 22
