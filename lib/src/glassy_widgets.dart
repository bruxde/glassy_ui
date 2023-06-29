import 'dart:ui';

import 'package:flutter/material.dart';

class GlassyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double? appBarHeight;
  final double? blurIntensity;
  final Color? backgroundColor;
  final double? colorOpacity;
  final double? elevation;
  final Color? shadowColor;
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
    this.elevation,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: intensity,
            sigmaY: intensity,
          ),
          child: AppBar(
            shadowColor: shadowColor,
            elevation: elevation,
            backgroundColor: bgColor,
            surfaceTintColor: Colors.transparent,
            leading: leading,
            title: title,
            bottom: bottom,
            actions: actions,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? 60);
  Color get bgColor => (backgroundColor ?? Colors.black).withOpacity(colorOpacity ?? 0.1);
  double get intensity => blurIntensity ?? 15;
}

class GlassyFab extends StatefulWidget {
  final double? blurIntensity;
  final Color? backgroundColor;
  final double? colorOpacity;
  final Function()? onPressed;
  final Widget? child;
  final double? borderRadius;
  final EdgeInsets? padding;
  final double? size;
  const GlassyFab({
    super.key,
    this.blurIntensity,
    this.backgroundColor,
    this.colorOpacity,
    this.onPressed,
    this.child,
    this.borderRadius,
    this.padding,
    this.size,
  });

  @override
  State<GlassyFab> createState() => _GlassyFabState();

  double get intensity => blurIntensity ?? 15;
  Color get bgColor => (backgroundColor ?? Colors.black).withOpacity(colorOpacity ?? 0.1);
}

class _GlassyFabState extends State<GlassyFab> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: widget.intensity,
          sigmaY: widget.intensity,
        ),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          splashFactory: InkSparkle.constantTurbulenceSeedSplashFactory,
          onTap: widget.onPressed,
          child: Container(
            width: widget.size ?? 60,
            height: widget.size ?? 60,
            padding: widget.padding ?? const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: widget.bgColor,
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
            ),
            child: Center(
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

class GlassyCard extends StatelessWidget {
  final double? blurIntensity;
  final Color? backgroundColor;
  final double? colorOpacity;
  final Widget? child;
  final double? borderRadius;

  final EdgeInsets? margin;
  final EdgeInsets? padding;
  const GlassyCard({
    super.key,
    this.blurIntensity,
    this.backgroundColor,
    this.colorOpacity,
    this.child,
    this.margin,
    this.padding,
    this.borderRadius,
  });

  double get intensity => blurIntensity ?? 15;
  Color get bgColor => (backgroundColor ?? Colors.black).withOpacity(colorOpacity ?? 0.1);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: intensity,
            sigmaY: intensity,
          ),
          child: Container(
            padding: padding ?? EdgeInsets.zero,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class GlassyContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double? borderRadius;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Widget? child;
  const GlassyContainer({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.child,
    this.margin,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
      ),
      child: child,
    );
  }
}
