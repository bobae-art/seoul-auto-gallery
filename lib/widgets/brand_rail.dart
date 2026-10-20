import 'package:flutter/material.dart';

import '../data/listings.dart';
import '../theme/tokens.dart';

/// 가로 스크롤 브랜드 레일 (80×80 카드 16개)
class BrandRail extends StatelessWidget {
  const BrandRail({super.key, required this.selected, required this.onSelect});
  final int? selected;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112,
      color: BbColors.white,
      padding: const EdgeInsets.only(top: 6),
      child: SizedBox(
        height: 106,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 18),
          itemCount: brands.length,
          separatorBuilder: (_, _) => const SizedBox(width: 10),
          itemBuilder: (context, i) => _BrandCard(
            brand: brands[i],
            selected: selected == i,
            onTap: () => onSelect(i),
          ),
        ),
      ),
    );
  }
}

class _BrandCard extends StatelessWidget {
  const _BrandCard({required this.brand, required this.selected, required this.onTap});
  final Brand brand;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        padding: const EdgeInsets.fromLTRB(4, 6, 4, 0),
        decoration: BoxDecoration(
          color: BbColors.white,
          borderRadius: BorderRadius.circular(8),
          border: selected ? Border.all(color: BbColors.textStrong, width: 1.5) : null,
          boxShadow: const [BoxShadow(color: Color(0x3D000000), offset: Offset(0, 3), blurRadius: 3.5)],
        ),
        child: Column(
          children: [
            SizedBox(
              width: 40,
              height: 40,
              child: Center(
                child: Image.asset(
                  'assets/images/${brand.image}',
                  width: brand.logoW,
                  height: brand.logoH,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              width: 72,
              height: 31.2,
              child: Column(
                children: [
                  const SizedBox(height: 0.2),
                  SizedBox(
                    height: 16,
                    child: Text(brand.name,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        softWrap: false,
                        style: bb(10.5, w400, 16, BbColors.textStrong)),
                  ),
                  Transform.translate(
                    offset: const Offset(0, -1),
                    child: SizedBox(
                      height: 16,
                      child: Text('(${brand.count})',
                          textAlign: TextAlign.center, style: bb(9.5, w400, 16, BbColors.textSub)),
                    ),
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
