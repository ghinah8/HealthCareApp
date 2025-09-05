class AppLink {
  static String appRoot = "http://10.0.2.2:8000";

  static String serverApiRoot = "$appRoot/api";

  static String login = "$serverApiRoot/auth/login";
  static String register = "$serverApiRoot/auth/register";
  static String products = "$serverApiRoot/products";
  static String specifics = "$serverApiRoot/specifics";
  static String treatment = "$serverApiRoot/treatment";
  static String doctors = "$serverApiRoot/users?role=doctor";
  static String getOneDoctor(String id) {
    return "$serverApiRoot/users/$id";
  }

  static String createOrder = "$serverApiRoot/orders";

  static String getallAmbulance = "$serverApiRoot/ambulances";
  static Map<String, String> getHeader() {
    Map<String, String> mainHeader = {
      'Content-Type': 'application/json',
      'Authorization':
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4YWNjMzI4NDg4OTc5MGUzNTMzZWFjMSIsInJvbGUiOiJwYXRpZW50IiwidXNlcm5hbWUiOiJzYXJhIGhhYmliIiwiY3JlYXRlZEF0IjoiMjAyNS0wOC0yNVQyMDoxMDoxNi43MTVaIiwiaWF0IjoxNzU2MTUyNjE2fQ.PeIoP5JkcxRwd6opYPxDssaCkfL0f9QSmrgQvcwfSIQ"
    };
    return mainHeader;
  }

  static String fixImageUrl(String path) {
    if (path.startsWith('http')) return path;
    if (!path.startsWith('/')) path = '/$path';
    return '$appRoot$path';
  }
}
