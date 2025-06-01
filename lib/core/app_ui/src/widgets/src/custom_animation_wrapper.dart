import 'package:flutter/material.dart';

import '../../../../models/models.dart';

/// Types of animations you can apply.

/// Reusable animated wrapper for any widget.
class CustomAnimatedWrapper extends StatefulWidget {
  final Widget child;
  final AnimationType animationType;
  final Duration duration;
  final Curve curve;

  const CustomAnimatedWrapper({
    Key? key,
    required this.child,
    this.animationType = AnimationType.fade,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeInOut,
  }) : super(key: key);

  @override
  State<CustomAnimatedWrapper> createState() => _CustomAnimatedWrapperState();
}

class _CustomAnimatedWrapperState extends State<CustomAnimatedWrapper>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;
  late final Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..forward();

    _fadeAnimation = CurvedAnimation(parent: _controller, curve: widget.curve);

    _scaleAnimation = Tween<double>(
      begin: 0.2,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));

    _slideAnimation = Tween<Offset>(
      begin: _getOffset(widget.animationType),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));
  }

  Offset _getOffset(AnimationType type) {
    switch (type) {
      case AnimationType.slideFromTop:
        return const Offset(0, -0.9);
      case AnimationType.slideFromBottom:
        return const Offset(-0.0, -0.8);
      case AnimationType.slideFromLeft:
        return const Offset(-0.1, 0);
      case AnimationType.slideFromRight:
        return const Offset(0.1, 0);
      default:
        return Offset.zero;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimation() {
    switch (widget.animationType) {
      case AnimationType.fade:
        return FadeTransition(opacity: _fadeAnimation, child: widget.child);
      case AnimationType.scale:
        return ScaleTransition(scale: _scaleAnimation, child: widget.child);
      case AnimationType.fadeScale:
        return FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(scale: _scaleAnimation, child: widget.child),
        );
      case AnimationType.slideFromTop:
      case AnimationType.slideFromBottom:
      case AnimationType.slideFromLeft:
      case AnimationType.slideFromRight:
        return SlideTransition(position: _slideAnimation, child: widget.child);
      case AnimationType.none:
        return widget.child;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildAnimation();
  }
}
