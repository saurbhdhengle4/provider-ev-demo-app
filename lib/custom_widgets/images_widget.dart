import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomImageWidget extends StatelessWidget {
  final String imagePath;
  final double? width;
  final double? height;
  final BoxFit fit;
  final double borderRadius;
  final Color? color;

  const CustomImageWidget({
    super.key,
    required this.imagePath,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.borderRadius = 0.0,
    this.color,
  });

  bool get isSvg => imagePath.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: isSvg
          ? SvgPicture.asset(
              imagePath,
              width: width,
              height: height,
              fit: fit,
              colorFilter: color != null
                  ? ColorFilter.mode(color!, BlendMode.srcIn)
                  : null,
            )
          : Image.asset(
              imagePath,
              width: width,
              height: height,
              fit: fit,
              color: color,
            ),
    );
  }
}
