import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final Duration duration;
  final bool isCollapsed;
  final double screenWidth;
  final Animation<double> scaleAnimation;
  final BorderRadius radius;

  final Widget child;

  const Dashboard(
      {Key key,
      this.duration,
      this.isCollapsed,
      this.screenWidth,
      this.scaleAnimation,
      this.radius,
      this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.4 * screenWidth,
      right: isCollapsed ? 0 : -0.4 * screenWidth,
      child: ScaleTransition(
        scale: scaleAnimation,
        child: Material(
          borderRadius: radius,
          color: Theme.of(context).scaffoldBackgroundColor,
          elevation: 8,
          child: child,
        ),
      ),
    );
  }
}
