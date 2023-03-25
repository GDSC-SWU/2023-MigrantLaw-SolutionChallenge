class API {
  // Domain URL
  final DOMAIN_URL = "http://34.64.48.227:8080";

  // 근로기준법
  final LABOR_LAW = "/law/232199";
  final LABOR_LAW_SEARCH = "/search/232199?q=";

  // 고용보험법
  final EMPLOYMENT_LAW = "/law/247483";
  final EMPLOYMENT_LAW_SEARCH = "/search/247483?q=";

  // 산재보험
  final SAFETY_LAW = "/law/239369";
  final SAFETY_LAW_SEARCH = "/search/239369?q=";

  // 퇴직급여법
  final RETIREMENT_LAW = "/law/239311";
  final RETIREMENT_LAW_SEARCH = "/search/239311?q=";

  // 남녀고용평등법
  final EQUALITY_LAW = "/law/72458";
  final EQUALITY_LAW_SEARCH = "/search/72458?q=";

  // 임금채권보장법
  final WAGE_LAW = "/law/231479";
  final WAGE_LAW_SEARCH = "/search/231479?q=";


  String getLaborUrl() {
    return "$DOMAIN_URL$LABOR_LAW";
  }

  String getLaborSearchUrl(String data) {
    return "$DOMAIN_URL$LABOR_LAW_SEARCH$data";
  }

  String getEmploymentUrl() {
    return "$DOMAIN_URL$EMPLOYMENT_LAW";
  }

  String getEmploymentSearchUrl(String data) {
    return "$DOMAIN_URL$EMPLOYMENT_LAW_SEARCH$data";
  }

  String getSafetyUrl() {
    return "$DOMAIN_URL$SAFETY_LAW";
  }

  String getSafetySearchUrl(String data) {
    return "$DOMAIN_URL$SAFETY_LAW_SEARCH$data";
  }

  String getRetirementUrl(){
    return "$DOMAIN_URL$RETIREMENT_LAW";
  }

  String getRetirementSearchUrl(String data){
    return "$DOMAIN_URL$RETIREMENT_LAW_SEARCH$data";
  }

  String getEqualityUrl() {
    return "$DOMAIN_URL$EQUALITY_LAW";
  }

  String getEqualitySearchUrl(String data) {
    return "$DOMAIN_URL$EQUALITY_LAW_SEARCH$data";
  }

  String getWageUrl() {
    return "$DOMAIN_URL$WAGE_LAW";
  }

  String getWageSearchUrl(String data) {
    return "$DOMAIN_URL$WAGE_LAW_SEARCH$data";
  }
}
