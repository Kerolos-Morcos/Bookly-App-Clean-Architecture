import 'package:flutter/material.dart';
import 'package:bookly_app/core/utils/app_colors.dart';

class CustomScrollToTopButton extends StatelessWidget {
  final ScrollController scrollController;
  final ValueNotifier<bool> showScrollToTopButton;
  final VoidCallback onPressed;

  const CustomScrollToTopButton({
    super.key,
    required this.scrollController,
    required this.showScrollToTopButton,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: showScrollToTopButton,
      builder: (context, show, child) {
        return AnimatedOpacity(
          opacity: show ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: show
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: FloatingActionButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    onPressed: onPressed,
                    backgroundColor: AppColors.kSecondaryColor,
                    child: const Icon(
                      Icons.arrow_upward,
                      color: AppColors.kPrimaryColor,
                    ),
                  ),
                )
              : const SizedBox(),
        );
      },
    );
  }
}
