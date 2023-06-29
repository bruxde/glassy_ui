import 'dart:ui';

import 'package:flutter/material.dart';

class GlassyAppbar extends StatefulWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double? appBarHeight;
  final double? blurIntensity;
  final Color? backgroundColor;
  final double? colorOpacity;
  const GlassyAppbar({
    super.key,
    this.appBarHeight,
    this.blurIntensity,
    this.title,
    this.leading,
    this.actions,
    this.bottom,
    this.backgroundColor,
    this.colorOpacity,
  });

  @override
  State<GlassyAppbar> createState() => _GlassyAppbarState();

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? 60);
  Color get bgColor => (backgroundColor ?? Colors.black).withOpacity(colorOpacity ?? 0.3);
  double get intensity => blurIntensity ?? 15;
}

class _GlassyAppbarState extends State<GlassyAppbar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: widget.preferredSize,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: widget.intensity,
            sigmaY: widget.intensity,
          ),
          child: AppBar(
            backgroundColor: widget.bgColor,
            leading: widget.leading,
            title: widget.title,
            bottom: widget.bottom,
            actions: widget.actions,
          ),
        ),
      ),
    );
  }
}
