import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? active;
  final Color? inactive;
  final int? index;
  final int? length;
  final double? radius;
  final double? margin;

  const Indicator({
    super.key,
    this.height,
    this.width,
    this.active,
    this.inactive,
    this.index,
    this.length,
    this.radius,
    this.margin,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: _buildPageIndicator(length!, index!),
    );
  }

  Widget indicator(bool isActive) {
    return RotatedBox(
      quarterTurns: isActive ? 2 : 0,
      child: AnimatedContainer(
        duration: const Duration(microseconds: 500),
        // transform: Matrix4.diagonal3(1),
        height: height,
        width: isActive ? width! + 15 : width,
        margin: EdgeInsets.symmetric(horizontal: margin!),
        decoration: BoxDecoration(
          borderRadius: isActive ? BorderRadius.circular(radius!) : null,
          shape: isActive ? BoxShape.rectangle : BoxShape.circle,
          color: isActive ? active : inactive,
        ),
      ),
    );
  }

  List<Widget> _buildPageIndicator(int length, int index) {
    List<Widget> list = [];
    for (int i = 0; i < length; i++) {
      list.add(i == index ? indicator(true) : indicator(false));
    }
    return list;
  }
}
