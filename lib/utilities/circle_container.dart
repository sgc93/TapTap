import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  const CircleContainer({
    super.key,
    required this.height,
    required this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.grey[900],
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black),
          boxShadow: [
            const BoxShadow(
              color: Colors.black,
              offset: Offset(4, 4),
              blurRadius: 8,
              spreadRadius: 1,
            ),
            BoxShadow(
              color: Colors.grey.shade600,
              offset: const Offset(-4, -4),
              blurRadius: 8,
              spreadRadius: 1,
            ),
          ]),
      child: child,
    );
  }
}
