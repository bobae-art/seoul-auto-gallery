import 'package:flutter/material.dart';

import '../theme/tokens.dart';
import 'svg.dart';

/// 상단 헤더: 뒤로가기 + 검색창(저장검색) + 찜
class AppHeader extends StatelessWidget {
  const AppHeader({super.key, required this.onWishlist, required this.onSearch});
  final VoidCallback onWishlist;
  final ValueChanged<String> onSearch;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: BbColors.white,
      padding: const EdgeInsets.fromLTRB(12, 10, 16, 0),
      child: Row(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('이전 화면으로 이동 (데모)'), duration: Duration(seconds: 1)),
            ),
            child: const Svg('ic_header_back.svg', width: 24, height: 24),
          ),
          const SizedBox(width: 12),
          Container(
            width: 312,
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            decoration: BoxDecoration(
              color: BbColors.searchBg,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Row(
              children: [
                const Svg('ic_header_search.svg', width: 20, height: 20),
                const SizedBox(width: 8),
                SizedBox(
                  width: 227.2,
                  height: 21,
                  child: TextField(
                    style: bb(15, w600, 21, BbColors.textStrong),
                    cursorColor: BbColors.textStrong,
                    textInputAction: TextInputAction.search,
                    onSubmitted: onSearch,
                    decoration: InputDecoration(
                      isCollapsed: true,
                      border: InputBorder.none,
                      hintText: '중고차',
                      hintStyle: bb(15, w600, 21, BbColors.textMuted),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(width: 0.8, height: 32, color: BbColors.searchDivider),
                const SizedBox(width: 8),
                const Svg('ic_header_bookmark.svg', width: 24, height: 24),
              ],
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onWishlist,
            child: const SizedBox(
              width: 24,
              height: 24,
              child: Svg('ic_header_heart.svg', width: 24, height: 24),
            ),
          ),
        ],
      ),
    );
  }
}
