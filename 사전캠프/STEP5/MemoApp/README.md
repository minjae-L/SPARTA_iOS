# MemoApp

### 기능
- 상단 네비바 오른쪽의 추가버튼 클릭 시 AlertController 표시
- 간단한 메모 작성하여 추가
- TableView에 추가한 메모 표시
- Cell을 왼쪽으로 스왑하면 오른쪽에 삭제버튼 표시
- 하단의 Tabbar에서 메모 개수 카운팅
- 빈 문자열은 추가하지 않도록 설정


### UI
- TableView는 왼,오 superView에 맞게, 위 아래는 LayoutMarginGuide에 맞게 Autolayout설정
- Tabbar은 왼,오는 superView에 맞게, 아래는 superView의 bottomAnchor, 위는 설정없이 높이 80 설정
- 상단 네비바의 우측 추가버튼은 SF symbols에서 가져온 버튼모양
- 추가버튼 클릭 시 AlertController 표시, AlertController는 TextField가 추가되어있다.
- TableViewCell의 Label Constraint 설정


## 개발 환경
- Xcode 15.2.0

## 화면
<img width="404" height="800" alt="스크린샷 2024-11-05 오전 11 42 10" src="https://github.com/user-attachments/assets/a0a2e1fc-6a08-4efd-9c28-9f1407e02115">
