String chooseLanguage = "en";

class Translation {
  static String getLanguageCode(int language) {
    switch (language) {
      case 0:
        return 'zh-tw';
      case 1:
        return 'vi';
      case 2:
        return 'th';
      case 3:
        return 'uz';
      case 4:
        return 'en';
      default:
        return 'ko';
    }
  }
}

