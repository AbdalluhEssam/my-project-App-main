class AppLink {
  /// ====================== for test in emulator ======================= ///
  //static const String server = "http://10.0.2.2/robotics"; for test in emulator

  /// ====================== Main Server Link ======================= ///
  static const String mainServer = "http://192.168.1.5/my_project";

  /// ====================== Student Login ======================= ///
  static const String studentLogin = "$mainServer/student_account/student_login.php";

  /// ====================== Doctor Login ======================= ///
  static const String doctorLogin = "$mainServer/doctor_account/doctor_login.php";

  /// ====================== Student Home Screen ======================= ///
  static const String studentHomeScreen = "$mainServer/student/home/team_member.php";
  static const String getTeamMemberId = "$mainServer/student/home/get_team_member_id.php";

  /// ====================== Test Link ======================= ///
  static const String test = "$mainServer/test.php";
}