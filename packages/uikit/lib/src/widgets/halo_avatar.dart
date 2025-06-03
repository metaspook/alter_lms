import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class HaloAvatar extends StatelessWidget {
  const HaloAvatar({
    required this.imageBuilder,
    super.key,
    this.aspectRatioPercent = 110,
  });
  final int aspectRatioPercent;
  final Image Function({
    Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
  })
  imageBuilder;

  @override
  Widget build(BuildContext context) {
    final size = context.mediaQuery.size.aspectRatio * aspectRatioPercent;
    final borderRadius = BorderRadius.circular(
      appSpacing * (aspectRatioPercent / 36.25),
    );
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: borderRadius,
            child: imageBuilder(
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  AppIcons.notFoundRecord.icon,
                  color: AppIcons.notFoundRecord.color,
                );
              },
            ),
          ),
          Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius,
                side: const BorderSide(
                  width: appSpacing * .25,
                  color: AppColors.secondary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
