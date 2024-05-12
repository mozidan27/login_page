import 'package:flutter/material.dart';

class SqureTile extends StatelessWidget {
  final String imagePath;
  final Function()? onTap;
  const SqureTile({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white60,
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
        height: 90,
        child: Image.asset(imagePath),
      ),
    );
  }
}
