import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class CheckoutButton extends StatelessWidget {
  final double amount;
  final VoidCallback onPressed;

  const CheckoutButton({
    super.key,
    required this.amount,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: SafeArea(
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 56),
          ),
          child: const Text('Proceed to Checkout'),
        ),
      ),
    );
  }
}
