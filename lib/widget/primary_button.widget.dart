import 'package:flash_cards/colors/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final double size;
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: size),
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
