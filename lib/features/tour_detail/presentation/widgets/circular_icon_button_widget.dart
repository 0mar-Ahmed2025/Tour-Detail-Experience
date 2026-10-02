import 'package:flutter/material.dart';

class CircularIconButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CircularIconButtonWidget({
    super.key,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onPressed,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFFE6E8EA), width: 1),
          ),
          child: Icon(icon, size: 20, color: const Color(0xFF191C1E)),
        ),
      ),
    );
  }
}
