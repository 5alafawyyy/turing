import 'package:flutter/material.dart';

/// Global widget that depicts a custom rounded user icon
/// Use for creating user profile images

class RoundedImage extends StatelessWidget {
  final String? url;
  final String path;
  final double width;
  final double height;
  final EdgeInsets? margin;
  final double borderRadius;

  const RoundedImage({
    this.url,
    this.path = "",
    this.margin,
    this.width = 40,
    this.height = 40,
    this.borderRadius = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          image:  path.isEmpty?  NetworkImage(url!) : AssetImage(path) as ImageProvider , // path.isNotEmpty? AssetImage(path): NetworkImage(url!),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
