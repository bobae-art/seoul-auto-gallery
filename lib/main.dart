import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'pages/gallery_page.dart';
import 'theme/tokens.dart';

void main() {
  runApp(const SeoulAutoGalleryApp());
}

class SeoulAutoGalleryApp extends StatelessWidget {
  const SeoulAutoGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '서울오토갤러리 · 보배드림',
      debugShowCheckedModeBanner: false,
      // 데스크톱 브라우저에서도 마우스 드래그로 가로 레일을 넘길 수 있게 한다.
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse, PointerDeviceKind.trackpad, PointerDeviceKind.stylus},
        scrollbars: false,
      ),
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: BbColors.pageBg,
        colorScheme: ColorScheme.fromSeed(seedColor: BbColors.textStrong, brightness: Brightness.light),
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      home: const GalleryPage(),
    );
  }
}
