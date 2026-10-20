import 'package:flutter/material.dart';

import '../theme/tokens.dart';
import 'svg.dart';

/// 412px 하단 메뉴 (곡선 배경 + 매물등록 디스크)
class BottomNav extends StatelessWidget {
  const BottomNav({super.key, required this.index, required this.onSelect});
  final int index;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 412,
      height: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Positioned(left: -1, top: 0, width: 412, height: 75, child: Svg('nav_background.svg', width: 412, height: 75)),
          const Positioned(left: 0, top: 74, width: 412, height: 6, child: ColoredBox(color: BbColors.white)),
          Positioned(
            left: 0,
            top: 5,
            width: 412,
            height: 69,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _NavItem(icon: 'ic_nav_home.svg', label: '홈', active: index == 0, onTap: () => onSelect(0)),
                _NavItem(icon: 'ic_nav_chat.svg', label: '채팅', active: index == 1, onTap: () => onSelect(1)),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onSelect(2),
                  child: SizedBox(
                    width: 84,
                    height: 69,
                    child: Column(
                      children: [
                        const SizedBox(
                          width: 44,
                          height: 42,
                          child: Stack(
                            children: [
                              Positioned.fill(child: Svg('nav_register_disc.svg', width: 44, height: 42)),
                              Center(child: Svg('ic_nav_register.svg', width: 15.4662, height: 15.4662)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: 58.578,
                          height: 19,
                          decoration: BoxDecoration(color: BbColors.textStrong, borderRadius: BorderRadius.circular(50)),
                          child: Center(child: Text('매물등록', style: bb(10, w700, 15, BbColors.white))),
                        ),
                      ],
                    ),
                  ),
                ),
                _NavItem(icon: 'ic_nav_community.svg', label: '커뮤니티', active: index == 3, onTap: () => onSelect(3)),
                _NavItem(icon: 'ic_nav_my.svg', label: '마이', active: index == 4, onTap: () => onSelect(4)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.icon, required this.label, required this.active, required this.onTap});
  final String icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: SizedBox(
        width: 82,
        height: 69,
        child: Padding(
          padding: const EdgeInsets.only(top: 11),
          child: Column(
            children: [
              const SizedBox(height: 7),
              Svg(icon, width: 24, height: 24, color: active ? BbColors.textStrong : BbColors.textWeak),
              const SizedBox(height: 4),
              Text(label, style: active ? bb(10, w700, 15, BbColors.textStrong) : bb(10, w500, 15, BbColors.textWeak)),
            ],
          ),
        ),
      ),
    );
  }
}
