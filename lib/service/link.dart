class AppLink {
  static String appRoot = "http://10.0.2.2:8000";

  static String serverApiRoot = "$appRoot/api";
  static String login = "$serverApiRoot/auth/login";
  static String register = "$serverApiRoot/auth/register";
  static String products = "$serverApiRoot/products";
  static String specifics = "$serverApiRoot/specifics";
  static String treatment = "$serverApiRoot/treatment";
  static Map<String, String> getHeader() {
    Map<String, String> mainHeader = {
      'Content-Type': 'application/json',
      'Authorization':
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4NTU2NGU1MDYxZDNjMDY2YzFmZTAzZiIsInJvbGUiOiJkb2N0b3IiLCJ1c2VybmFtZSI6Im1vZ2hhcmVlYiIsImNyZWF0ZWRBdCI6IjIwMjUtMDYtMjBUMTM6NDA6NTQuMjIzWiIsImlhdCI6MTc1MDQzMDExMn0.33Y6vbu3nV-t544YOpPxWRHlQqpwLmT-FKqINYX2pnQ"
    };
    return mainHeader;
  }

  static String fixImageUrl(String path) {
    if (path.startsWith('http')) return path;
    if (!path.startsWith('/')) path = '/$path';
    return '$appRoot$path';
  }
}
