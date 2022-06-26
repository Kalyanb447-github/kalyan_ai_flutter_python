import 'package:flutter/material.dart';

class CustomInBox extends StatelessWidget {
  CustomInBox({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5.0,
            blurRadius: 7.0,
          )
        ],
      ),
      child: child,
    );
  }
}
