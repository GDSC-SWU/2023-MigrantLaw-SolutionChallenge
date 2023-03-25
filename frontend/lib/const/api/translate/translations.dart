import 'package:shared_preferences/shared_preferences.dart';

String chooseLanguage = "ko";

class TranslationLanguage {

  Future<void> saveData(String data) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('Language', data);
      print("SAVE DATA : $data");
    } catch (e) {
      // 예외 처리
      print('Error saving data: $e');
    }
  }

  Future<String?> loadData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final myValue = prefs.getString('Language') ?? "ko";
      print("myValue : $myValue");
      return myValue;
    } catch (e) {
      // 예외 처리
      print('Error loading data: $e');
      return null;
    }
  }
}

