import 'package:flash_cards/colors/app_colors.dart';
import 'package:flutter/material.dart';

class PimaryButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  const PimaryButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 60),
        shape: const RoundedRectangleBorder(side: BorderSide.none),
        backgroundColor: AppColors.primaryColor,
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(color: AppColors.secundaryColor, fontSize: 18),
      ),
    );
  }
}
