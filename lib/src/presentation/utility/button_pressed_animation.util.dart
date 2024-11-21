import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show HapticFeedback;

class ButtonPressAnimation extends StatefulWidget {
  const ButtonPressAnimation({
    required this.child,
    this.onTap,
    this.shrinkChild = true,
    super.key,
  });

  final Widget child;
  final VoidCallback? onTap;
  final bool shrinkChild;

  @override
  State<ButtonPressAnimation> createState() => _ButtonPressAnimationState();
}

class _ButtonPressAnimationState extends State<ButtonPressAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
      lowerBound: 0.96,
    );
    _controller
      ..reset()
      ..forward()
      ..addStatusListener((status) {
        if (status.isDismissed) {
          _controller
            ..reset()
            ..forward();
        }
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap == null
          ? null
          : () {
              HapticFeedback.lightImpact();
              widget.onTap?.call();
            },
      onTapDown: widget.shrinkChild ? (_) => _controller.reverse() : null,
      behavior: HitTestBehavior.translucent,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _controller.value,
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}
