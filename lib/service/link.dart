class AppLink {
  static String appRoot = "http://10.0.2.2:8000";

  static String serverApiRoot = "$appRoot/api";
  static String login = "$serverApiRoot/auth/login";
  static String register = "$serverApiRoot/auth/register";
  static String products = "$serverApiRoot/products";

  static Map<String, String> getHeader() {
    Map<String, String> mainHeader = {'Content-Type': 'application/json'};
    return mainHeader;
  }

  static String fixImageUrl(String path) {
    if (path.startsWith('http')) return path;
    if (!path.startsWith('/')) path = '/$path';
    return '$appRoot$path';
  }
}
