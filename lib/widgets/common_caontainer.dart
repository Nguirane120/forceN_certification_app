import 'package:flutter/material.dart';
import 'package:todoapp/utils/utils.dart';

class CommonCaontainer extends StatelessWidget {
  const CommonCaontainer(
      {super.key,
      this.height,
      this.width,
      this.child,
      this.borderRadius = 16,
      this.padding,
      this.color});
  final double? height;
  final double? width;
  final Widget? child;
  final double? borderRadius;
  final EdgeInsets? padding;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colors = context.colorScheme;

    return Container(
      height: height,
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: color ?? colors.primaryContainer,
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: child,
    );
  }
}
