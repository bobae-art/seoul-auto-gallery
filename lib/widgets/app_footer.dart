import 'package:flutter/material.dart';

import '../theme/tokens.dart';
import 'svg.dart';

/// 모바일 푸터 (연락처, 계정 링크, 사업자 정보, 정책 링크, SNS, 컬러 모드)
class AppFooter extends StatelessWidget {
  const AppFooter({
    super.key,
    required this.businessOpen,
    required this.onToggleBusiness,
    required this.darkMode,
    required this.onDarkMode,
  });

  final bool businessOpen;
  final VoidCallback onToggleBusiness;
  final bool darkMode;
  final ValueChanged<bool> onDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: BbColors.pageBg,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 42,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Contact(label: '이용문의', number: '02-784-2329'),
                      const SizedBox(width: 32),
                      _Contact(label: '제휴광고', number: '070-4272-0114'),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: 380,
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(color: BbColors.pageBg, borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (final t in ['로그인', '매물등록', '매물관리', 'PC버전'])
                        Text(t, style: bb(14, w400, 19.6, BbColors.text333)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: onToggleBusiness,
                  child: Container(
                    width: 380,
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: BbColors.lineStrong, width: 1)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 43,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              children: [
                                Text('(주) 보배네트워크 사업자 정보', style: bb(14, w600, 19.6, BbColors.text)),
                                const SizedBox(width: 8),
                                AnimatedRotation(
                                  turns: businessOpen ? 0.5 : 0,
                                  duration: const Duration(milliseconds: 180),
                                  child: const Svg('ic_footer_chevron.svg', width: 18, height: 18),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AnimatedSize(
                          duration: const Duration(milliseconds: 180),
                          alignment: Alignment.topCenter,
                          child: businessOpen
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: Text(
                                    '대표 조재환 · 사업자등록번호 107-86-45765\n통신판매업신고 2010-서울영등포-00779\n서울특별시 영등포구 국제금융로 6길 33 · 고객센터 02-784-2329',
                                    style: bb(12, w400, 18, BbColors.textMuted),
                                  ),
                                )
                              : const SizedBox(width: 380),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 380,
                  height: 19.6,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (final t in ['고객센터', '제휴/광고', '제안/건의', '이용관리'])
                        Text(t, style: bb(14, w400, 19.6, BbColors.textMuted)),
                      Text('개인정보처리방침', style: bb(14, w600, 19.6, BbColors.link)),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Row(
                  children: [
                    Svg('ic_footer_instagram.svg', width: 24, height: 24),
                    SizedBox(width: 16),
                    Svg('ic_footer_facebook.svg', width: 24, height: 24),
                    SizedBox(width: 16),
                    Svg('ic_footer_youtube.svg', width: 24, height: 24),
                    SizedBox(width: 16),
                    Svg('ic_footer_threads.svg', width: 24, height: 24),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  width: 62,
                  height: 36,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: BbColors.white,
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: BbColors.photoBg, width: 1),
                  ),
                  child: Row(
                    children: [
                      _ModeButton(
                        selected: !darkMode,
                        onTap: () => onDarkMode(false),
                        child: const SvgInBox('ic_theme_light.svg', box: 12, width: 11, height: 11),
                      ),
                      _ModeButton(
                        selected: darkMode,
                        onTap: () => onDarkMode(true),
                        child: const Svg('ic_theme_dark.svg', width: 12, height: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // 하단 고정 메뉴 자리 (80)
          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

class _Contact extends StatelessWidget {
  const _Contact({required this.label, required this.number});
  final String label;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: bb(14, w600, 19.6, BbColors.textMuted)),
        const SizedBox(height: 2),
        SelectableText(number, style: bb(16, w600, 22.4, BbColors.text)),
      ],
    );
  }
}

class _ModeButton extends StatelessWidget {
  const _ModeButton({required this.selected, required this.onTap, required this.child});
  final bool selected;
  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          color: selected ? BbColors.photoBg : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(child: child),
      ),
    );
  }
}
