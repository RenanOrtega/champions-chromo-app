import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SquareTile extends StatelessWidget {
  final String svgPath;
  final VoidCallback onTap;

  const SquareTile({super.key, required this.svgPath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: Colors.blue.withValues(alpha: 0.1),
        highlightColor: Colors.blue.withValues(alpha: 0.3),
        child: Ink(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(16),
          ),
          child: SvgPicture.asset(
            svgPath,
            height: 40,
          ),
        ),
      ),
    );
  }
}
