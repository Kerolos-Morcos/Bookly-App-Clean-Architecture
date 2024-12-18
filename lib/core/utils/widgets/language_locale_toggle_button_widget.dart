import 'package:bookly_app/core/utils/app_colors.dart';
import 'package:bookly_app/features/home/presentation/manager/language_cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageToggleButton extends StatelessWidget {
  const LanguageToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = context.watch<LanguageCubit>().state.languageCode == 'ar';

    return FloatingActionButton(
      onPressed: () => context.read<LanguageCubit>().changeLanguage(),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Icon(
            Icons.language,
            size: 40,
            color: AppColors.kSecondaryColor,
          ),
          Positioned(
            top: -5,
            left: isArabic ? 25 : 0,
            child: Text(
              isArabic ? 'ar' : 'en',
              style: const TextStyle(
                color: Colors.green,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
