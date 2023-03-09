class API {
  // Domain URL
  final DOMAIN_URL = "http://34.64.81.164:8080";

  // 근로기준법
  final LABOR_LAW = "/law/232199";
  // 고용보험법
  final EMPLOYMENT_LAW = "/law/247483";
  // 산재보험
  final SAFETY_LAW = "/law/239369";
  // 퇴직급여법
  final RETIREMENT_LAW = "/law/239311";
  // 남녀고용평등법
  final EQUALITY_LAW = "/law/72458";
  // 임금채권보장법
  final WAGE_LAW = "/law/231479";

  String getLaborUrl() {
    return "$DOMAIN_URL$LABOR_LAW";
  }

  String getEmploymentUrl() {
    return "$DOMAIN_URL$EMPLOYMENT_LAW";
  }

  String getSafetyUrl() {
    return "$DOMAIN_URL$SAFETY_LAW";
  }

  String getRetirementUrl(){
    return "$DOMAIN_URL$RETIREMENT_LAW";
  }

  String getEqualityUrl() {
    return "$DOMAIN_URL$EQUALITY_LAW";
  }

  String getWageUrl() {
    return "$DOMAIN_URL$WAGE_LAW";
  }
}
