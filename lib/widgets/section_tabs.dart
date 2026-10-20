import 'package:flutter/material.dart';

import '../theme/tokens.dart';

const sectionTabLabels = ['판매 차량', '상사', '딜러', '소개'];
const _tabWidths = [59.0, 28.0, 28.0, 28.0];

/// 판매 차량 / 상사 / 딜러 / 소개 탭
class SectionTabs extends StatelessWidget {
  const SectionTabs({super.key, required this.selected, required this.onSelect});
  final int selected;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: BbColors.white,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            height: 47,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  for (var i = 0; i < sectionTabLabels.length; i++) ...[
                    if (i > 0) const SizedBox(width: 24),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => onSelect(i),
                      child: SizedBox(
                        width: _tabWidths[i],
                        height: 47,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                sectionTabLabels[i],
                                maxLines: 1,
                                softWrap: false,
                                overflow: TextOverflow.visible,
                                style: selected == i
                                    ? bb(16, w700, 22, BbColors.textStrong)
                                    : bb(16, w400, 22, BbColors.tabInactive),
                              ),
                            ),
                            if (selected == i)
                              Positioned(
                                left: 0,
                                top: 45,
                                width: _tabWidths[i],
                                height: 2,
                                child: const ColoredBox(color: BbColors.textStrong),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          const Positioned(left: 0, right: 0, bottom: 0, height: 1, child: ColoredBox(color: BbColors.tabBorder)),
        ],
      ),
    );
  }
}
