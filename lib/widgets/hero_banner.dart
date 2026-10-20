import 'package:flutter/material.dart';

import '../theme/tokens.dart';
import 'svg.dart';

/// 서울오토갤러리 배너 (건물 사진 + 그라데이션 + 마크/문구)
class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    const shadow = [Shadow(color: Color(0x57000000), offset: Offset(0, 1), blurRadius: 2)];
    return Container(
      height: 120,
      color: BbColors.white,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 10),
      child: Container(
        width: 380,
        height: 98,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: BbColors.heroBg,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [BoxShadow(color: Color(0x1F000000), offset: Offset(0, 1), blurRadius: 2)],
        ),
        child: Stack(
          children: [
            Positioned.fill(child: Image.asset('assets/images/banner_building.png', fit: BoxFit.cover)),
            const Positioned.fill(child: Svg('banner_gradient.svg', width: 380, height: 98)),
            Positioned(
              left: 16,
              top: 0,
              width: 348,
              height: 98,
              child: Row(
                children: [
                  Image.asset('assets/images/sag_mark.png', width: 34, height: 46, fit: BoxFit.contain),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('서울오토갤러리',
                          style: bb(18, w700, 23, BbColors.white, letterSpacing: -0.45, shadows: shadow)),
                      const SizedBox(height: 2),
                      Opacity(
                        opacity: 0.84,
                        child: Text('수입차 전문 매매단지',
                            style: bb(12, w400, 17, BbColors.white, letterSpacing: -0.2, shadows: shadow)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
