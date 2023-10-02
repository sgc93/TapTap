import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  final bool isCircle;
  const MyContainer({
    super.key,
    required this.height,
    required this.width,
    required this.child,
    required this.isCircle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius:
            isCircle ? BorderRadius.circular(100) : BorderRadius.circular(20),
        color: Colors.grey[900],
        boxShadow: [
          const BoxShadow(
            color: Colors.black,
            offset: Offset(4, 4),
            blurRadius: 5,
            // spreadRadius: 10,
          ),
          BoxShadow(
            color: Colors.grey.shade800,
            offset: const Offset(-4, -4),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
