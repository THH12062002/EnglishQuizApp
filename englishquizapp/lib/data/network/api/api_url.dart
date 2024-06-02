class ApiUrl {
  static String baseUrl = 'http://192.168.1.8:8080';
  static String login = '$baseUrl/login';
  static String getUser = '$baseUrl/users';
  static String register = '$baseUrl/users/register';
  static String getRecords = '$baseUrl/records';
  static String getEasyQuestions = '$baseUrl/questions/easy';
  static String getMediumQuestions = '$baseUrl/questions/medium';
  static String getHardQuestions = '$baseUrl/questions/hard';
}
