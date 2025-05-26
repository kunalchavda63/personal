import 'package:flutter/material.dart';

import '../../../../models/models.dart';

class CustomFloatingButton extends StatelessWidget {
  final String? label;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final String? toolTip;
  final Widget? child;
  final FabType type;

  const CustomFloatingButton({
    super.key,
    this.label,
    this.onTap,
    this.backgroundColor,
    this.toolTip,
    this.child,
    this.type = FabType.normal,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case FabType.extended:
        return FloatingActionButton.extended(
          onPressed: onTap,
          backgroundColor: backgroundColor,
          tooltip: toolTip,
          icon: child,
          label: Text(label ?? ''),
        );
      case FabType.small:
        return FloatingActionButton.small(
          onPressed: onTap,
          backgroundColor: backgroundColor,
          tooltip: toolTip,
          child: child,
        );
      case FabType.large:
        return FloatingActionButton.large(
          onPressed: onTap,
          backgroundColor: backgroundColor,
          tooltip: toolTip,
          child: child,
        );
      case FabType.normal:
        return FloatingActionButton(
          onPressed: onTap,
          backgroundColor: backgroundColor,
          tooltip: toolTip,
          child: child,
          shape: const CircleBorder(),
        );
    }
  }
}
