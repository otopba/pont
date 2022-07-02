import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future<T?> showPontBottomSheet<T>({
  required BuildContext context,
  required Widget child,
}) {
  return showBarModalBottomSheet<T>(
    context: context,
    builder: (context) => Container(
      child: child,
      color: Colors.white,
    ),
    bounce: false,
    useRootNavigator: true,
    topControl: Container(
      height: 30,
      width: double.maxFinite,
      color: Colors.white.withOpacity(0.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 5,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    ),
    shape: const RoundedRectangleBorder(
      side: BorderSide(),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    barrierColor: Colors.black.withOpacity(0.67),
    closeProgressThreshold: 0.8,
    elevation: 0,
  );
}
