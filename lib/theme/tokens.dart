import 'package:flutter/material.dart';

/// 보배드림 모바일 색상 토큰 (Figma 변수 기준)
class BbColors {
  static const white = Color(0xFFFFFFFF);
  static const pageBg = Color(0xFFF4F4F4);
  static const textStrong = Color(0xFF222222);
  static const text = Color(0xFF1A1A1A);
  static const textSub = Color(0xFF595959);
  static const textWeak = Color(0xFF8C8C8C);
  static const textMuted = Color(0xFF767676);
  static const photoBg = Color(0xFFEBEBEB);
  static const lineStrong = Color(0xFFE0E0E0);
  static const tabInactive = Color(0xFF8B95A1);
  static const tabBorder = Color(0xFFEDEDED);
  static const searchBg = Color(0xFFF0F0F0);
  static const searchDivider = Color(0xFFC0C0C0);
  static const link = Color(0xFF1B4C8C);
  static const pageBorder = Color(0xFFE8E8E8);
  static const text333 = Color(0xFF333333);
  static const text3a = Color(0xFF3A3A3A);
  static const heroBg = Color(0xFF071A3A);
  static const wishOn = Color(0xFFE8442C);
}

/// Pretendard 텍스트 스타일. [lineHeight] 는 px 단위 (CSS line-height).
TextStyle bb(
  double size,
  FontWeight weight,
  double lineHeight,
  Color color, {
  double letterSpacing = 0,
  List<Shadow>? shadows,
}) {
  return TextStyle(
    fontFamily: 'Pretendard',
    fontSize: size,
    fontWeight: weight,
    height: lineHeight / size,
    color: color,
    letterSpacing: letterSpacing,
    leadingDistribution: TextLeadingDistribution.even,
    shadows: shadows,
    decoration: TextDecoration.none,
  );
}

const w400 = FontWeight.w400;
const w500 = FontWeight.w500;
const w600 = FontWeight.w600;
const w700 = FontWeight.w700;

/// CSS `word-break: keep-all` 처럼 공백에서만 줄바꿈되도록 글자 사이에 WORD JOINER(U+2060)를 넣는다.
String keepAll(String text) {
  final buf = StringBuffer();
  final runes = text.runes.toList();
  for (var i = 0; i < runes.length; i++) {
    buf.writeCharCode(runes[i]);
    if (i + 1 < runes.length && runes[i] != 0x20 && runes[i + 1] != 0x20) buf.write('⁠');
  }
  return buf.toString();
}
