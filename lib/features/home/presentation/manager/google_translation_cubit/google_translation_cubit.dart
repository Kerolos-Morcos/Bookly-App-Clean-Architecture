import 'package:bookly_app/core/utils/functions/google_translate_any_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GoogleTranslationCubit extends Cubit<Map<String, String>> {
  GoogleTranslationCubit() : super({});
  void translate(String text, String targetLanguage) async {
    try {
      String translatedText =
          await GoogleTranslateAnyText.translateText(text, targetLanguage);
      emit({...state, text: translatedText});
    } catch (e) {
      emit({});
    }
  }
}
