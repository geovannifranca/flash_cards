import 'package:flash_cards/colors/app_colors.dart';
import 'package:flutter/material.dart';

class SecundaryButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  const SecundaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 60),
        shape: const RoundedRectangleBorder(side: BorderSide.none),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: const TextStyle(color: AppColors.primaryColor, fontSize: 18),
      ),
    );
  }
}
