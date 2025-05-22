class StudentHomeScreenModel {
  int? teamMemberId;
  String? teamMemberName;
  String? teamMemberCode;
  int? teamMemberIsLeader;
  int? teamMemberStudentId;
  String? teamMemberDoctorName;
  int? teamMemberDoctorId;

  StudentHomeScreenModel(
      {this.teamMemberId,
      this.teamMemberName,
      this.teamMemberCode,
      this.teamMemberIsLeader,
      this.teamMemberStudentId,
      this.teamMemberDoctorName,
      this.teamMemberDoctorId});

  StudentHomeScreenModel.fromJson(Map<String, dynamic> json) {
    teamMemberId = json['team_member_id'];
    teamMemberName = json['team_member_name'];
    teamMemberCode = json['team_member_code'];
    teamMemberIsLeader = json['team_member_is_leader'];
    teamMemberStudentId = json['team_member_student_id'];
    teamMemberDoctorName = json['team_member_doctor_name'];
    teamMemberDoctorId = json['team_member_doctor_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['team_member_id'] = this.teamMemberId;
    data['team_member_name'] = this.teamMemberName;
    data['team_member_code'] = this.teamMemberCode;
    data['team_member_is_leader'] = this.teamMemberIsLeader;
    data['team_member_student_id'] = this.teamMemberStudentId;
    data['team_member_doctor_name'] = this.teamMemberDoctorName;
    data['team_member_doctor_id'] = this.teamMemberDoctorId;
    return data;
  }
}
