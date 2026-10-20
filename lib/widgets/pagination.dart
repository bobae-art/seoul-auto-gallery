import 'package:flutter/material.dart';

import '../theme/tokens.dart';
import 'svg.dart';

/// 페이지 1 / 2 · 다음 · 마지막
class Pagination extends StatelessWidget {
  const Pagination({super.key, required this.page, required this.pageCount, required this.onPage});
  final int page;
  final int pageCount;
  final ValueChanged<int> onPage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      color: BbColors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Center(
        child: SizedBox(
          width: 140,
          height: 32,
          child: Row(
            children: [
              for (var p = 1; p <= pageCount; p++) ...[
                if (p > 1) const SizedBox(width: 4),
                _PageButton(
                  current: page == p,
                  onTap: () => onPage(p),
                  child: Text('$p',
                      style: bb(14, w500, 19.6, page == p ? BbColors.white : BbColors.text3a)),
                ),
              ],
              const SizedBox(width: 4),
              _PageButton(
                current: false,
                onTap: () => onPage((page + 1).clamp(1, pageCount)),
                child: const Svg('ic_page_next.svg', width: 16, height: 16),
              ),
              const SizedBox(width: 4),
              _PageButton(
                current: false,
                onTap: () => onPage(pageCount),
                child: const Svg('ic_page_last.svg', width: 16, height: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PageButton extends StatelessWidget {
  const _PageButton({required this.current, required this.onTap, required this.child});
  final bool current;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: current ? BbColors.text : BbColors.white,
          borderRadius: BorderRadius.circular(16),
          border: current ? null : Border.all(color: BbColors.pageBorder, width: 2),
        ),
        child: Center(child: child),
      ),
    );
  }
}
