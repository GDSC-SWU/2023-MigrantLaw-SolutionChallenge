import 'package:shared_preferences/shared_preferences.dart';

String chooseLanguage = "ko";

class Translation {

  static saveData(String data) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('Language', data);
    print("SAVE DATA : ${prefs.getString('Language')}");
  }

}

