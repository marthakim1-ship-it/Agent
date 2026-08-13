# YOVIA REQUIREMENT MASTER

## 문서 상태

- 생성 범위: 가상 클라이언트 VC-001~VC-020
- 요구사항 수: 127
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
| VC006-REQ-001 | VC-006 | 확정 맛·식감·토핑을 실제 제품 자산으로 구분 | Product Understanding | Must | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0019 | Medium | High | 제품 이해 강화 | SPECIALIZED | 없음 | true | 라인업 필요 |
| VC006-REQ-002 | VC-006 | 콘셉트와 실제 촬영 자산 상태 명시 | Trust | Must | SRC-BRAND-001 | EVD-0017, EVD-0019 | High | High | 오인 방지 | COMMON | 없음 | true | 자산 검증 |
| VC006-REQ-003 | VC-006 | 맛·질감·토핑 비교 정보 제공 | Information | Should | SRC-PER-001, SRC-PER-002 | EVD-0019 | Medium | Medium | 선택 지원 | SPECIALIZED | 없음 | true | 관능 기준 필요 |
| VC006-REQ-004 | VC-006 | 맛 컬러에 이름·상태 텍스트 병기 | Accessibility | Should | SRC-BRAND-001 | EVD-0017 | Medium | High | 명확성 가치 | DERIVED | 없음 | false | 색상 단독 금지 |
| VC006-REQ-005 | VC-006 | 모바일 이미지와 정보·CTA 밀도 조절 | Responsive | Should | SRC-BRAND-001 | EVD-0018 | Medium | High | 모바일 이해 | COMMON | 없음 | false | 순서 검증 |
| VC006-REQ-006 | VC-006 | 미확정 맛·감미료·기능성 표현 비공개 | Constraint | Hold | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0010, EVD-0019 | High | High | 확정 원칙 준수 | VALIDATION_REQUIRED | 없음 | true | 공개 통제 |
| VC007-REQ-001 | VC-007 | 확정 용량·구성·가격 동일 기준 비교 | Information | Must | SRC-PER-001, SRC-PER-002 | EVD-0020 | Medium | Medium | 가치 판단 지원 | SPECIALIZED | 없음 | true | 값 미확정 |
| VC007-REQ-002 | VC-007 | 가격·할인·배송은 확정 정책만 표시 | Constraint | Must | SRC-BRAND-001 | EVD-0016, EVD-0020 | High | High | 허위 약속 방지 | COMMON | 없음 | true | 정책 필요 |
| VC007-REQ-003 | VC-007 | 단위 가격·묶음 구성 비교 후보 | Purchase | Should | SRC-PER-001, SRC-PER-002 | EVD-0020 | Medium | Medium | 비교 문제와 연결 | SPECIALIZED | 없음 | true | 정책 후 적용 |
| VC007-REQ-004 | VC-007 | 편의 가치와 실제 구성을 가격 옆 설명 | Content | Should | SRC-BRAND-001 | EVD-0002, EVD-0020 | Medium | High | 가치 설명 | DERIVED | 없음 | true | 구성 필요 |
| VC007-REQ-005 | VC-007 | 모바일 비교 기준을 카드로 제공 | Responsive | Should | SRC-PDF-001, SRC-PDF-002 | EVD-0007 | Medium | High | 모바일 명확성 | DERIVED | 없음 | false | 표 대체 |
| VC007-REQ-006 | VC-007 | 미확정 대용량·번들·구독 혜택 금지 | Retention | Hold | SRC-BRAND-001, SRC-PER-001 | EVD-0016, EVD-0020 | High | High | 정책 경계 | VALIDATION_REQUIRED | 없음 | true | 공개 금지 |
| VC008-REQ-001 | VC-008 | 원료·첨가물·알레르기·교차접촉 분리 | Trust | Must | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0005, EVD-0021 | High | High | 안전 판단 | COMMON | 없음 | true | 문서 필요 |
| VC008-REQ-002 | VC-008 | 중요한 주의를 접힌 영역에만 숨기지 않음 | Accessibility | Must | SRC-PER-001, SRC-PER-002 | EVD-0021 | Medium | High | 안전 우선 | SPECIALIZED | 없음 | true | 우선순위 검증 |
| VC008-REQ-003 | VC-008 | 적용 대상과 섭취·보관 주의 범위 표시 | Information | Should | SRC-PER-001, SRC-PER-002 | EVD-0021 | Medium | High | 오인 방지 | DERIVED | 없음 | true | 적용 대상 미확정 |
| VC008-REQ-004 | VC-008 | 경고를 색상·아이콘·텍스트로 구분 | UI | Should | SRC-BRAND-001, SRC-PDF-003 | EVD-0014, EVD-0021 | Medium | High | 명확성·접근성 | DERIVED | 없음 | false | 색상 단독 금지 |
| VC008-REQ-005 | VC-008 | 가족 공유 맥락에서 사실·주의 우선 | Content | Should | SRC-PER-001, SRC-PER-002 | EVD-0021 | Medium | Medium | 후보 세그먼트 | SPECIALIZED | 없음 | true | 타깃 검증 |
| VC008-REQ-006 | VC-008 | 어린이 적합·유기농·무첨가 효능 금지 | Constraint | Hold | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0010, EVD-0021 | High | High | 검증 경계 | VALIDATION_REQUIRED | 없음 | true | 공개 금지 |
| VC009-REQ-001 | VC-009 | 사용 방법에 정리·잔여물·폐기 포함 | UX | Must | SRC-PER-001, SRC-PER-002 | EVD-0012, EVD-0022 | Medium | High | 전체 사용 경험 | COMMON | 없음 | true | 시험 필요 |
| VC009-REQ-002 | VC-009 | 소재·재활용·환경 효과는 근거만 표시 | Constraint | Must | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0022 | High | High | 그린워싱 방지 | COMMON | 없음 | true | 소재 미확정 |
| VC009-REQ-003 | VC-009 | 분리배출 적용 지역·조건 명시 | Information | Should | SRC-PER-001, SRC-PER-002 | EVD-0022 | Low | Medium | 실용 정보 | SPECIALIZED | 없음 | true | 지역 검증 |
| VC009-REQ-004 | VC-009 | 환경 상태와 근거 링크 표시 | Trust | Should | SRC-BRAND-001 | EVD-0022 | Medium | High | 투명성 | DERIVED | 없음 | true | 근거 필요 |
| VC009-REQ-005 | VC-009 | 모바일 정리 과정을 단계형 제공 | Responsive | Should | SRC-PER-001, SRC-PER-002 | EVD-0011, EVD-0022 | Medium | High | 사용성 | DERIVED | 없음 | true | 단계 검증 |
| VC009-REQ-006 | VC-009 | 친환경·생분해·폐기 감소 수치 금지 | Constraint | Hold | SRC-BRAND-001, SRC-PER-001, SRC-PER-002 | EVD-0022 | High | High | 미확정 주장 통제 | VALIDATION_REQUIRED | 없음 | true | 공개 금지 |
| VC010-REQ-001 | VC-010 | 핵심 정보·CTA 키보드·보조기술 탐색 | Accessibility | Must | SRC-BRAND-001, SRC-PDF-001, SRC-PDF-002, SRC-PDF-003 | EVD-0023 | Medium | High | 명확한 경험 확장 | SPECIALIZED | 없음 | true | 감사 필요 |
| VC010-REQ-002 | VC-010 | 제품군·검증·오류를 색상만으로 구분 금지 | UI | Must | SRC-BRAND-001, SRC-PDF-003 | EVD-0014, EVD-0023 | High | High | 명확성 가치 | COMMON | 없음 | false | 텍스트 병기 |
| VC010-REQ-003 | VC-010 | 이미지 대체 텍스트·컨트롤 이름 제공 | Accessibility | Should | SRC-PDF-001, SRC-PDF-002 | EVD-0023 | Medium | High | 정보 접근성 | SPECIALIZED | 없음 | true | 테스트 필요 |
| VC010-REQ-004 | VC-010 | 모바일 확대·1열에서도 순서·행동 유지 | Responsive | Should | SRC-BRAND-001, SRC-PDF-001 | EVD-0007, EVD-0023 | Medium | High | 모바일 기준 | DERIVED | 없음 | true | 반응형 검증 |
| VC010-REQ-005 | VC-010 | 로딩·빈·오류·완료와 복구 명시 | UX | Should | SRC-PDF-001, SRC-PDF-002, SRC-PDF-003 | EVD-0006, EVD-0023 | Medium | High | 이탈 방지 | DERIVED | 없음 | true | 상태 설계 |
| VC010-REQ-006 | VC-010 | 검증 없는 접근성 준수·인증 표시 금지 | Constraint | Hold | SRC-BRAND-001 | EVD-0023 | Medium | High | 근거 원칙 | VALIDATION_REQUIRED | 없음 | true | 감사 전 금지 |

| VC011-REQ-001 | VC-011 | 첫 화면에서 브랜드 정의와 제품 편익을 한 문장으로 이해 | Brand | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0024 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | COMMON | 없음 | false | 신규 운영 관점 |
| VC011-REQ-002 | VC-011 | 파우치·빌트인 스푼·토핑 관계를 초심자용 단계로 설명 | Product Understanding | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0024 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | SPECIALIZED | 없음 | false | 신규 운영 관점 |
| VC011-REQ-003 | VC-011 | 낯선 제품 용어에 짧은 도움말과 상세 연결 제공 | Information | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0024 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | DERIVED | 없음 | false | 신규 운영 관점 |
| VC011-REQ-004 | VC-011 | 모바일에서 정의→구성→사용법 순서를 유지 | Responsive | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0024 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | COMMON | 없음 | false | 신규 운영 관점 |
| VC011-REQ-005 | VC-011 | 입문 콘텐츠 완료 뒤 검증 정보·다음 행동을 연결 | UX | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0024 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | DERIVED | 없음 | true | 신규 운영 관점 |
| VC011-REQ-006 | VC-011 | 미확정 제품 사양을 입문 메시지로 사용 금지 | Constraint | Hold | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0024 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | VALIDATION_REQUIRED | 없음 | true | 신규 운영 관점 |
| VC012-REQ-001 | VC-012 | 제품별 확정 판매 채널과 다음 행동을 명확히 연결 | Conversion | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0025 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | COMMON | 없음 | true | 신규 운영 관점 |
| VC012-REQ-002 | VC-012 | 채널·지역·재고 상태의 기준일과 확인 범위를 표시 | Trust | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0025 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | SPECIALIZED | 없음 | true | 신규 운영 관점 |
| VC012-REQ-003 | VC-012 | 위치 권한 없이 지역을 직접 선택하는 대안 제공 | Accessibility | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0025 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | EXCEPTION | 없음 | true | 신규 운영 관점 |
| VC012-REQ-004 | VC-012 | 판매처 결과 없음·외부 이동·오류 상태를 설명 | UX | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0025 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | DERIVED | 없음 | true | 신규 운영 관점 |
| VC012-REQ-005 | VC-012 | 모바일에서 제품 맥락을 유지한 채 판매처로 이동 | Responsive | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0025 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | COMMON | 없음 | true | 신규 운영 관점 |
| VC012-REQ-006 | VC-012 | 판매 채널 확정 전 재고·배송 가능성을 약속하지 않음 | Constraint | Hold | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0025 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | VALIDATION_REQUIRED | 없음 | true | 신규 운영 관점 |
| VC013-REQ-001 | VC-013 | 사용법·보관·성분·구매 질문을 검증 답변으로 분류 | Information | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0026 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | COMMON | 없음 | true | 신규 운영 관점 |
| VC013-REQ-002 | VC-013 | 답변으로 해결되지 않는 문제에 책임 있는 문의 경로 제공 | UX | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0026 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | SPECIALIZED | 없음 | true | 신규 운영 관점 |
| VC013-REQ-003 | VC-013 | FAQ 검색·필터는 실제 문서량이 충분할 때만 적용 | Navigation | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0026 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | DERIVED | 없음 | true | 신규 운영 관점 |
| VC013-REQ-004 | VC-013 | 중요 알레르기·주의 정보는 접힌 답변에만 숨기지 않음 | Accessibility | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0026 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | COMMON | 없음 | true | 신규 운영 관점 |
| VC013-REQ-005 | VC-013 | 문의 접수·오류·완료 상태와 복귀 행동을 표시 | Interaction | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0026 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | DERIVED | 없음 | true | 신규 운영 관점 |
| VC013-REQ-006 | VC-013 | 승인되지 않은 보관·효능·품질 답변 공개 금지 | Constraint | Hold | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0026 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | VALIDATION_REQUIRED | 없음 | true | 신규 운영 관점 |
| VC014-REQ-001 | VC-014 | 수집 항목·목적·필수 여부를 행동 전에 설명 | Trust | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0027 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | SPECIALIZED | 없음 | true | 신규 운영 관점 |
| VC014-REQ-002 | VC-014 | 비필수 동의 거부 후에도 핵심 제품 정보 접근 유지 | UX | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0027 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | EXCEPTION | 없음 | true | 신규 운영 관점 |
| VC014-REQ-003 | VC-014 | 위치 권한 거부 시 직접 지역 선택 대안 제공 | Accessibility | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0027 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | EXCEPTION | 없음 | true | 신규 운영 관점 |
| VC014-REQ-004 | VC-014 | 동의 상태 확인·변경·철회 경로 후보 제공 | Technical | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0027 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | DERIVED | 없음 | true | 신규 운영 관점 |
| VC014-REQ-005 | VC-014 | 모바일에서 수락과 거부 선택을 동등하게 이해 | Responsive | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0027 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | DERIVED | 없음 | true | 신규 운영 관점 |
| VC014-REQ-006 | VC-014 | 정책·보관기간·도구 확정 전 준수 문구를 단정하지 않음 | Constraint | Hold | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0027 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | VALIDATION_REQUIRED | 없음 | true | 신규 운영 관점 |
| VC015-REQ-001 | VC-015 | 핵심 제품 정의·이미지·CTA를 우선 로드 대상으로 지정 | Technical | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0028 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | SPECIALIZED | 없음 | true | 신규 운영 관점 |
| VC015-REQ-002 | VC-015 | 느린 환경에서도 텍스트와 기본 탐색이 작동 | Responsive | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0028 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | EXCEPTION | 없음 | true | 신규 운영 관점 |
| VC015-REQ-003 | VC-015 | 제품 이미지에 크기·형식·대체 자산 기준 후보 설정 | Visual | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0028 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | DERIVED | 없음 | true | 신규 운영 관점 |
| VC015-REQ-004 | VC-015 | 복합 모션은 정보 이해 효과와 성능을 검증한 뒤 적용 | Interaction | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0028 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | COMMON | 없음 | true | 신규 운영 관점 |
| VC015-REQ-005 | VC-015 | 외부 연결·미디어 실패 시 재시도와 대체 경로 제공 | UX | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0028 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | DERIVED | 없음 | true | 신규 운영 관점 |
| VC015-REQ-006 | VC-015 | 실측 전 성능 등급·속도 개선 수치를 공개하지 않음 | Constraint | Hold | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0028 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | VALIDATION_REQUIRED | 없음 | true | 신규 운영 관점 |
| VC016-REQ-001 | VC-016 | 공통 브랜드 정의와 지역별 제품·정책 정보를 분리 | Information | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0029 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | SPECIALIZED | 없음 | true | 신규 운영 관점 |
| VC016-REQ-002 | VC-016 | 언어·지역 변경 후 현재 제품과 탐색 맥락 유지 | Navigation | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0029 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | EXCEPTION | 없음 | true | 신규 운영 관점 |
| VC016-REQ-003 | VC-016 | 언어 선택을 국기나 색상만으로 표현하지 않음 | Accessibility | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0029 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | COMMON | 없음 | false | 신규 운영 관점 |
| VC016-REQ-004 | VC-016 | 번역 확장과 혼합 문자를 견디는 모바일 구성 | Responsive | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0029 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | DERIVED | 없음 | true | 신규 운영 관점 |
| VC016-REQ-005 | VC-016 | 지역별 정보에 출처·기준일·적용 범위 표시 | Trust | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0029 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | SPECIALIZED | 없음 | true | 신규 운영 관점 |
| VC016-REQ-006 | VC-016 | 판매·영양·법정 표시가 확정되지 않은 지역은 공개 보류 | Constraint | Hold | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0029 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | VALIDATION_REQUIRED | 없음 | true | 신규 운영 관점 |
| VC017-REQ-001 | VC-017 | 제품 사실과 핵심 자산을 단일 승인 출처에서 운영 | Content | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0030 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | SPECIALIZED | 없음 | true | 신규 운영 관점 |
| VC017-REQ-002 | VC-017 | 실물·렌더·콘셉트 이미지 상태를 명확히 구분 | Trust | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0030 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | COMMON | 없음 | true | 신규 운영 관점 |
| VC017-REQ-003 | VC-017 | 콘텐츠별 소유자·기준일·갱신 조건을 관리 | Technical | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0030 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | DERIVED | 없음 | true | 신규 운영 관점 |
| VC017-REQ-004 | VC-017 | 제품 변경 시 관련 사용법·영양·CTA 연결을 함께 점검 | UX | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0030 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | DERIVED | 없음 | true | 신규 운영 관점 |
| VC017-REQ-005 | VC-017 | 모바일에서도 자산 상태와 핵심 사실의 일관성 유지 | Responsive | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0030 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | COMMON | 없음 | true | 신규 운영 관점 |
| VC017-REQ-006 | VC-017 | 승인되지 않거나 만료된 자산을 공개하지 않음 | Constraint | Hold | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0030 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | VALIDATION_REQUIRED | 없음 | true | 신규 운영 관점 |
| VC018-REQ-001 | VC-018 | 캠페인 메시지를 검증된 제품 사실과 직접 연결 | Brand | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0031 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | COMMON | 없음 | true | 신규 운영 관점 |
| VC018-REQ-002 | VC-018 | 기간·대상·상태·조건을 CTA 전에 명확히 표시 | Trust | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0031 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | SPECIALIZED | 없음 | true | 신규 운영 관점 |
| VC018-REQ-003 | VC-018 | 종료·품절·오류 시 관련 제품 또는 상시 정보로 연결 | UX | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0031 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | DERIVED | 없음 | true | 신규 운영 관점 |
| VC018-REQ-004 | VC-018 | SNS·광고 유입 메시지와 랜딩 첫 화면을 일치 | Content | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0031 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | SPECIALIZED | 없음 | true | 신규 운영 관점 |
| VC018-REQ-005 | VC-018 | 모바일 공유·딥링크 후 핵심 맥락과 행동 유지 | Responsive | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0031 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | DERIVED | 없음 | true | 신규 운영 관점 |
| VC018-REQ-006 | VC-018 | 확정되지 않은 할인·재고·효능 캠페인 공개 금지 | Constraint | Hold | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0031 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | VALIDATION_REQUIRED | 없음 | true | 신규 운영 관점 |
| VC019-REQ-001 | VC-019 | 제품 이해·사용법 확인·판매처 이동을 별도 목표로 정의 | Business | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0032 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | SPECIALIZED | 없음 | true | 신규 운영 관점 |
| VC019-REQ-002 | VC-019 | 측정 이벤트를 사용자 목표와 Requirement에 연결 | Technical | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0032 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | DERIVED | 없음 | true | 신규 운영 관점 |
| VC019-REQ-003 | VC-019 | 동의 상태에 따라 비필수 측정을 제한 | Trust | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0032 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | EXCEPTION | 없음 | true | 신규 운영 관점 |
| VC019-REQ-004 | VC-019 | 실험 변형에서도 접근성·사실·브랜드 기준 유지 | Constraint | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0032 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | COMMON | 없음 | true | 신규 운영 관점 |
| VC019-REQ-005 | VC-019 | 모바일·외부 이동·오류로 인한 흐름 단절을 구분 | UX | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0032 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | DERIVED | 없음 | true | 신규 운영 관점 |
| VC019-REQ-006 | VC-019 | 측정 설계 전 전환율·개선 효과를 주장하지 않음 | Constraint | Hold | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0032 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | VALIDATION_REQUIRED | 없음 | true | 신규 운영 관점 |
| VC020-REQ-001 | VC-020 | 품질·알레르기·보관 이슈를 일반 콘텐츠보다 우선 노출 가능하게 준비 | Trust | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0033 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | SPECIALIZED | 없음 | true | 신규 운영 관점 |
| VC020-REQ-002 | VC-020 | 영향 제품·범위·기준일·승인 행동을 식별 가능하게 표시 | Information | Must | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0033 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | SPECIALIZED | 없음 | true | 신규 운영 관점 |
| VC020-REQ-003 | VC-020 | 공지 갱신 상태와 이전 버전·문의 경로를 연결 | Content | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0033 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | DERIVED | 없음 | true | 신규 운영 관점 |
| VC020-REQ-004 | VC-020 | 색상만으로 위험·상태를 전달하지 않음 | Accessibility | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0033 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | COMMON | 없음 | false | 신규 운영 관점 |
| VC020-REQ-005 | VC-020 | 모바일에서 공지→제품 확인→행동 지침 경로를 짧게 유지 | Responsive | Should | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0033 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | DERIVED | 없음 | true | 신규 운영 관점 |
| VC020-REQ-006 | VC-020 | 실제 이슈·승인 절차 없이 리콜 기능이나 문구를 공개하지 않음 | Constraint | Hold | SRC-BRAND-001, SRC-REF-001, SRC-REF-002, SRC-REF-003 | EVD-0033 | Medium | High | YOVIA 명확성·신뢰·운영 품질에 부합 | VALIDATION_REQUIRED | 없음 | true | 신규 운영 관점 |

## 집계

- Priority: Must 46 / Should 59 / Could 2 / Hold 20
- Relationship: COMMON 29 / MAJORITY 4 / SPECIALIZED 30 / CONFLICT 3 / EXCEPTION 6 / DERIVED 32 / VALIDATION_REQUIRED 21 / BRAND_CONFLICT 2
- Brand Fit: High 112 / Medium 10 / Low 3 / Conflict 2
- Validation Needed: 101
- 집계 메모: 기존 37개 부분 집계 표기를 제거하고 전체 127개 행을 기준으로 검증한다.
