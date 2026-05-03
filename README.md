# UMC iOS Workbook (8기)

UMC(University MakeUs Challenge) 8기 iOS 파트 워크북 학습 결과 + Tuist 모듈화 연습.

## 📂 구조

```
UMC-iOS-Workbook/
├── Week1/ ~ Week7/             # 주차별 학습 결과 (본인 코드)
├── UMC-iOS-Workbook/           # 메인 워크북 프로젝트 소스
├── UMC-iOS-Workbook.xcodeproj
├── UMC_tuist_Practice/         # Tuist 모듈화 연습
└── Reference/
    └── JEONG-J/                # 외부 참고 코드 (submodule)
```

## 📚 Reference (참고 자료)

`Reference/JEONG-J/`는 [JEONG-J/UMC_8TH_Reference](https://github.com/JEONG-J/UMC_8TH_Reference) 레포의 git submodule입니다 — 같은 UMC 8기 워크북 커리큘럼의 모범 답안/풀이를 참고용으로 옆에 둡니다.

### 클론 시 참고

submodule이 같이 따라오게 하려면:
```bash
git clone --recurse-submodules https://github.com/GthingkingG/UMC-iOS-Workbook.git
```

이미 clone한 경우:
```bash
git submodule update --init --recursive
```

JEONG-J 원작자가 새 주차 코드 push 시 최신화:
```bash
git submodule update --remote Reference/JEONG-J
git add Reference/JEONG-J
git commit -m "[Chore] Reference/JEONG-J 최신 커밋 동기화"
```

## 🔐 환경 설정

### Kakao API Key (Week6_Practice)

```bash
cp Week6/Week6_Practice/Week6_Practice/Secrets.example.swift \
   Week6/Week6_Practice/Week6_Practice/Secrets.swift
```
`Secrets.swift`의 `YOUR_KAKAO_REST_API_KEY`를 본인 Kakao Developer 콘솔 키로 교체.

### Week5 OSRM 데이터

`Week5/Week5_OSRM/README.md` 따라 별도 다운로드 (대용량, .gitignore 처리됨).

## 🛠 빌드

각 Week 폴더의 `*.xcodeproj` 열고 ⌘R. iOS 시뮬레이터.

## 🔗 관련 작품 (Sibling Repo)

같은 UMC 8기 정규 워크북 커리큘럼의 누적 클론 코딩 과제는 별도 레포에서 단일 통합 앱으로 진행했습니다:

- **[UMC_Starbucks](https://github.com/GthingkingG/UMC_Starbucks)** — 스타벅스 클론 코딩 (Week2~Week6 누적 발전)
  - Week 단위 미니 실습은 본 레포(Workbook)에, 통합 앱은 별도 레포에 두어 grain 분리.
