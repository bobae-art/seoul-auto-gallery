import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

import '../data/listings.dart';
import '../theme/tokens.dart';
import 'svg.dart';

/// 매물 카드 (380 폭, 사진 120 + 상세 248)
class ListingCard extends StatelessWidget {
  const ListingCard({super.key, required this.car, required this.wished, required this.onWish, required this.onTap});
  final CarListing car;
  final bool wished;
  final VoidCallback onWish;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: 380,
        color: BbColors.white,
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Photo(car: car),
                const SizedBox(width: 12),
                SizedBox(width: 248, child: _Details(car: car, wished: wished, onWish: onWish)),
              ],
            ),
            const SizedBox(height: 18),
            const SizedBox(width: 380, height: 1, child: ColoredBox(color: BbColors.photoBg)),
          ],
        ),
      ),
    );
  }
}

class _Photo extends StatelessWidget {
  const _Photo({required this.car});
  final CarListing car;

  @override
  Widget build(BuildContext context) {
    final image = 'assets/images/${car.image}';
    return Container(
      width: 120,
      height: 120,
      color: BbColors.photoBg,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          if (car.blurFill)
            Positioned(
              left: -18,
              top: -18,
              width: 156,
              height: 156,
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
          Positioned.fill(child: Image.asset(image, fit: BoxFit.contain)),
          Positioned(
            left: 8,
            top: 99,
            child: Text(car.time, style: bb(12, w400, 18, BbColors.white)),
          ),
          Positioned(
            left: 84,
            top: 100,
            width: 28,
            height: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Svg('ic_photo_count.svg', width: 12, height: 12),
                const SizedBox(width: 4),
                Text('${car.photos}', style: bb(10, w700, 15, BbColors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({required this.car, required this.wished, required this.onWish});
  final CarListing car;
  final bool wished;
  final VoidCallback onWish;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          keepAll(car.title),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: bb(16, w600, 20, BbColors.textStrong),
        ),
        SizedBox(
          height: 24,
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(car.spec, softWrap: false, style: bb(14, w400, 20, BbColors.textSub)),
          ),
        ),
        SizedBox(
          height: 24,
          child: Row(
            children: car.price == null
                ? [Text('가격 상담', style: bb(16, w700, 24, BbColors.textStrong))]
                : [
                    Text(car.price!, style: bb(16, w700, 24, BbColors.textStrong)),
                    Text('만원', style: bb(16, w400, 24, BbColors.textStrong)),
                  ],
          ),
        ),
        SizedBox(
          height: 28,
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              children: [
                const SvgInBox('ic_location.svg', box: 16, width: 10.9333, height: 13.9333),
                const SizedBox(width: 4),
                Text('서울 서초구', style: bb(14, w400, 20, BbColors.textWeak)),
                const SizedBox(width: 4),
                Text('서울오토갤러리', style: bb(14, w400, 20, BbColors.textWeak)),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 24,
          child: Padding(
            padding: const EdgeInsets.only(top: 4),
            child: SizedBox(
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset('assets/images/seller_avatar.png', width: 16, height: 16),
                      const SizedBox(width: 6),
                      Text(car.seller, softWrap: false, style: bb(14, w400, 20, BbColors.textStrong)),
                    ],
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: onWish,
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: Center(
                        child: AnimatedScale(
                          scale: wished ? 1.1 : 1,
                          duration: const Duration(milliseconds: 150),
                          child: Svg('ic_wish_off.svg', width: 24, height: 24, color: wished ? BbColors.wishOn : null),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
