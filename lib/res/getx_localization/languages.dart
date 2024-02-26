import 'package:get/get.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello',
          'world': 'World',
        },
        'hi_IN': {
          'hello': 'नमस्ते',
          'world': 'दुनिया',
        }
      };
}
