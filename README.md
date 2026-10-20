# 서울오토갤러리 · 보배드림 모바일 (Flutter Web)

Figma 시안 [보배드림 · 서울오토갤러리 · 모바일 412px](https://www.figma.com/design/Uu9ZGisAnyoXSLAKqzsqYL/?node-id=2-2) 을
**Flutter 3.47.7** 웹으로 재현한 프로젝트입니다.

- 디자인 폭 412px 를 기준으로 구현했고, 더 좁은 화면에서는 전체가 비례 축소됩니다. 넓은 화면에서는 412px 로 가운데 정렬됩니다.
- 아이콘·사진·브랜드 로고는 모두 Figma 원본 에셋(`assets/images`, `assets/icons`)이며 폰트는 Pretendard(`assets/fonts`)를 번들합니다.
- 동작하는 인터랙션: 섹션 탭, 필터 칩 토글·카테고리 해제·초기화, 브랜드 레일 선택, 테마 필터, 정렬(바텀시트, 실제 정렬), 찜 토글, 페이지네이션, 사업자 정보 펼치기, 라이트/다크 토글, 하단 메뉴.

## 개발

```bash
flutter pub get
flutter run -d chrome
flutter build web --release --base-href /seoul-auto-gallery/
```

## 배포

`main` 에 푸시하면 `.github/workflows/deploy-pages.yml` 이 Flutter 3.47.7 로 빌드해 `gh-pages` 브랜치에 게시합니다.
저장소 Settings → Pages → Source 가 **Deploy from a branch / gh-pages / (root)** 인지 확인해 주세요.

배포 주소: https://bobae-art.github.io/seoul-auto-gallery/
