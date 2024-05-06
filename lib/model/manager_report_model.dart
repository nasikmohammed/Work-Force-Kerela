class ManagerReportModel {
  String? reportManagerissues;
  ManagerReportModel({this.reportManagerissues});
  Map<String, dynamic> toJson(docId) => {
        "reportManagerissues": reportManagerissues,
      };
  factory ManagerReportModel.fromJson(Map<String, dynamic> json) {
    return ManagerReportModel(reportManagerissues: json["reportManagerissues"]);
  }
}
