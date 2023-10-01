import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  const MyContainer({
    super.key,
    required this.height,
    required this.width,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        // shape: BoxShape.circle,
        color: Colors.grey[900],
        boxShadow: [
          const BoxShadow(
            color: Colors.black,
            offset: Offset(4, 4),
            blurRadius: 5,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.grey.shade800,
            offset: const Offset(-4, -4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
