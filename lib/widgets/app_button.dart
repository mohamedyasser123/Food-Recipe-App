import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

enum AppButtonSize { big, medium, small }
enum AppButtonState { defult, hover, disabled }


class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final AppButtonSize size;
  final AppButtonState state;
  final bool withIcon;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
    this.size = AppButtonSize.medium,
    this.state = AppButtonState.defult,
    this.withIcon = false,
  });

  double _getHeight() {
    switch (size) {
      case AppButtonSize.big:
        return 64;
      case AppButtonSize.medium:
        return 48;
      case AppButtonSize.small:
        return 36;
    }
  }
  double _getWidth(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.small:
        return 120;
      case AppButtonSize.medium:
        return 200;
      case AppButtonSize.big:
        return double.infinity;
    }
  }
  double _getFontSize() {
    switch (size) {
      case AppButtonSize.big:
        return 16;
      case AppButtonSize.medium:
        return 14;
      case AppButtonSize.small:
        return 12;
    }
  }

  Color _getBackgroundColor() {
    switch (state) {
      case AppButtonState.defult:
        return AppColors.primary100;
      case AppButtonState.hover:
        return AppColors.primary100.withValues(alpha: .8);
      case AppButtonState.disabled:
        return AppColors.gray4;
    }
  }

  Color _getTextColor() {
    switch (state) {
      case AppButtonState.disabled:
        return AppColors.white;
      default:
        return AppColors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _getHeight(),
      width: _getWidth(size),
      child: ElevatedButton(
        onPressed: state == AppButtonState.disabled ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: _getBackgroundColor(),
          foregroundColor: _getTextColor(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: _getFontSize(),
                fontWeight: FontWeight.bold,
              ),
            ),
            if (withIcon) ...[
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward,
                size: _getFontSize(),
                color: _getTextColor(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
