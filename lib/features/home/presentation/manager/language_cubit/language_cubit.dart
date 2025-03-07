import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en'));

  void changeLanguage() {
    emit(
      state.languageCode == 'en' ? const Locale('ar') : const Locale('en'),
    );
  }
}
