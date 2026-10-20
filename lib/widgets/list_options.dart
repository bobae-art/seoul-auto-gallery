import 'package:flutter/material.dart';

import '../data/listings.dart';
import '../theme/tokens.dart';
import 'svg.dart';

const themeLabels = ['숏폼카', '국산차', '수입차', '슈퍼카', '럭셔리카', '클래식카'];
const _themeWidths = [40.0, 40.0, 40.0, 40.0, 50.0, 50.0];

/// 테마 필터 + 정렬 + 그리드 보기
class ListOptions extends StatelessWidget {
  const ListOptions({
    super.key,
    required this.selectedTheme,
    required this.onSelectTheme,
    required this.sortKey,
    required this.onSortTap,
    required this.gridMode,
    required this.onGridTap,
  });

  final int? selectedTheme;
  final ValueChanged<int> onSelectTheme;
  final SortKey sortKey;
  final VoidCallback onSortTap;
  final bool gridMode;
  final VoidCallback onGridTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      color: BbColors.white,
      child: Stack(
        children: [
          Positioned(
            left: 16,
            top: 0,
            width: 380,
            height: 33,
            child: Row(
              children: [
                SizedBox(
                  width: 247,
                  height: 32,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    children: [
                      for (var i = 0; i < themeLabels.length; i++) ...[
                        if (i > 0) const SizedBox(width: 8),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => onSelectTheme(i),
                          child: Container(
                            width: _themeWidths[i],
                            height: 28,
                            margin: const EdgeInsets.symmetric(vertical: 2),
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              themeLabels[i],
                              softWrap: false,
                              style: bb(12, w700, 18,
                                  selectedTheme == i ? BbColors.textStrong : BbColors.textWeak),
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onSortTap,
                  child: SizedBox(
                    width: 88,
                    height: 32,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 4,
                          height: 17,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(width: 1, height: 17, child: ColoredBox(color: BbColors.searchBg)),
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(sortKey.label,
                              softWrap: false,
                              overflow: TextOverflow.clip,
                              style: bb(14, w500, 18, BbColors.textStrong)),
                        ),
                        const SizedBox(width: 5),
                        const Svg('ic_sort_chevron.svg', width: 13, height: 13),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                SizedBox(
                  width: 37,
                  height: 32,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: onGridTap,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: gridMode ? BbColors.pageBg : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(child: Svg('ic_view_grid.svg', width: 19.1, height: 19.1)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(left: 0, right: 0, top: 33, height: 1, child: ColoredBox(color: BbColors.pageBg)),
        ],
      ),
    );
  }
}
