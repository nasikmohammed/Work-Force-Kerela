class UserReportsModel {
  String? reportuserissues;
  UserReportsModel({this.reportuserissues});
  Map<String, dynamic> toJson(docId) => {
        "reportuserissues": reportuserissues,
      };
  factory UserReportsModel.fromJson(Map<String, dynamic> json) {
    return UserReportsModel(reportuserissues: json["reportuserissues"]);
  }
}
