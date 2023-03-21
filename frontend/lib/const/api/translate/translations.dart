class Translation {
  static String getLanguageCode(String language) {
    switch (language) {
      case '中国':
        return 'zh';
      case 'Việt Nam':
        return 'vi';
      case 'ไทย':
        return 'th';
      case "O'zbekiston":
        return 'uz';
      case 'Republika ng Pilipinas':
        return 'fil';
      default:
        return 'ko';
    }
  }
}

