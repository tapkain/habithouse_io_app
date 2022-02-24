import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ModalPage<T> extends Page<T> {
  const ModalPage({required this.child});

  final Widget child;

  @override
  Route<T> createRoute(BuildContext context) {
    return ModalBottomSheetRoute<T>(
      builder: (context) => child,
      expanded: false,
      settings: this,
      closeProgressThreshold: 0.9,
    );
  }
}
