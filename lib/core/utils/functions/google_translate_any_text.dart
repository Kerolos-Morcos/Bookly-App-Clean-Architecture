import 'package:translator/translator.dart';

class GoogleTranslateAnyText {
  static Future<String> translateText(
      String text, String targetLanguage) async {
    final translator = GoogleTranslator();
    var translation = await translator.translate(text, to: targetLanguage);
    return translation.text;
  }
}
