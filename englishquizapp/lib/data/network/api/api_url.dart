class ApiUrl {
  //static String baseUrl = 'http://localhost:8080';
  //static String baseUrl = 'http://10.102.72.120:8080';
  static String baseUrl = 'http://192.168.1.9:8080';
  static String login = '$baseUrl/login';
  static String register = '$baseUrl/users/register';
  static String getEasyQuestions = '$baseUrl/questions/easy';
  static String getMediumQuestions = '$baseUrl/questions/medium';
  static String getHardQuestions = '$baseUrl/questions/hard';
}
