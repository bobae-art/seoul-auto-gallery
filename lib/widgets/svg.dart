import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// assets/icons 의 SVG 를 원본 크기 그대로 그린다.
class Svg extends StatelessWidget {
  const Svg(this.name, {super.key, required this.width, required this.height, this.color});
  final String name;
  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$name',
      width: width,
      height: height,
      colorFilter: color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
    );
  }
}

/// 고정 크기 박스 가운데에 원본 크기 SVG 를 놓는다 (CSS inset 으로 축소된 아이콘용).
class SvgInBox extends StatelessWidget {
  const SvgInBox(this.name, {super.key, required this.box, required this.width, required this.height, this.color});
  final String name;
  final double box;
  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: box,
      height: box,
      child: Center(child: Svg(name, width: width, height: height, color: color)),
    );
  }
}
