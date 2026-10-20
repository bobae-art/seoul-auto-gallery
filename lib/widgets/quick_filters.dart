import 'package:flutter/material.dart';

import '../theme/tokens.dart';
import 'svg.dart';

const quickFilterLabels = ['제조사', '가격', '연식', '연료'];
const _quickFilterWidths = [81.0, 69.0, 69.0, 69.0];

/// 상단 고정 퀵 필터: 필터 버튼 + 선택된 카테고리 + 가로 스크롤 필터 칩
class QuickFilters extends StatelessWidget {
  const QuickFilters({
    super.key,
    required this.categoryVisible,
    required this.activeFilters,
    required this.onClearCategory,
    required this.onToggleFilter,
    required this.onFilterButton,
  });

  final bool categoryVisible;
  final Set<int> activeFilters;
  final VoidCallback onClearCategory;
  final ValueChanged<int> onToggleFilter;
  final VoidCallback onFilterButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      color: BbColors.white,
      padding: const EdgeInsets.only(top: 10, left: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onFilterButton,
            child: Container(
              width: 69,
              height: 32,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(color: BbColors.textStrong, borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  const Svg('ic_chip_filter.svg', width: 16, height: 16),
                  const SizedBox(width: 4),
                  Text('필터', style: bb(14, w600, 20, BbColors.white)),
                ],
              ),
            ),
          ),
          const SizedBox(width: 4),
          SizedBox(
            width: 323,
            height: 32,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              children: [
                if (categoryVisible) ...[
                  Container(
                    width: 129,
                    height: 32,
                    padding: const EdgeInsets.only(left: 12, right: 8),
                    decoration: BoxDecoration(color: BbColors.textStrong, borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        Text('서울오토갤러리', style: bb(14, w600, 20, BbColors.white)),
                        const SizedBox(width: 4),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: onClearCategory,
                          child: const Svg('ic_chip_clear.svg', width: 20, height: 18.4),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 4),
                ],
                for (var i = 0; i < quickFilterLabels.length; i++) ...[
                  if (i > 0) const SizedBox(width: 4),
                  _FilterChip(
                    label: quickFilterLabels[i],
                    width: _quickFilterWidths[i],
                    active: activeFilters.contains(i),
                    onTap: () => onToggleFilter(i),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, required this.width, required this.active, required this.onTap});
  final String label;
  final double width;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: width,
        height: 32,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: active ? BbColors.textStrong : BbColors.pageBg,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Text(label, style: bb(14, w500, 20, active ? BbColors.white : BbColors.textStrong)),
            const SizedBox(width: 4),
            SvgInBox('ic_chip_toggle.svg',
                box: 16, width: 10.0667, height: 5.56666, color: active ? BbColors.white : null),
          ],
        ),
      ),
    );
  }
}
