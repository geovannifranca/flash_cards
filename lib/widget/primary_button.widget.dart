import 'package:flash_cards/colors/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final double size;
  final Color color;
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.size,
    this.color = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: size),
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        backgroundColor: color,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(color: AppColors.secundaryColor, fontSize: 18),
      ),
    );
  }
}
