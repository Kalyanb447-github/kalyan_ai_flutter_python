import 'package:flutter/material.dart';
import 'package:kalyan_ai_flutter_python/app/modules/find_your_emotion/views/components/styles.dart';

class CustomOutBox extends StatelessWidget {
  CustomOutBox({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: customGradient,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 24.0,
      ),
      child: child,
    );
  }
}
