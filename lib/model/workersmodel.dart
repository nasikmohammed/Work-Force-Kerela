class WorkersModel {
  String? workersname;
  String? workersplace;
  String? workersage;
  String? workersidnumber;
  String? workersemail;
  String? workerstype;
  String? workerspassword;
  String? workerimage;
  String? reportid;
  String? id;
  WorkersModel(
      {this.workersname,
      this.workersplace,
      this.workersage,
      this.workersidnumber,
      this.workersemail,
      this.workerstype,
      this.workerspassword,
      this.workerimage,
      this.id,this.reportid});

  Map<String, dynamic> toJson(docId) => {
        "workersname": workersname,
        "workersplace": workersplace,
        "workersage": workersage,
        "workersidnumber": workersidnumber,
        "workersemail": workersemail,
        "workersid": workerstype,
        "workerspassword": workerspassword,
        "workerimage": workerimage,
        "id": id,
         "reportid": reportid,
      };
  factory WorkersModel.fromJson(Map<String, dynamic> json) {
    return WorkersModel(
      workersname: json["workersname"],
      workersplace: json["workersplace"],
      workersage: json["workersage"],
      workersidnumber: json["workersidnumber"],
      workersemail: json["workersemail"],
      workerstype: json["workerstype"],
      workerspassword: json["workerspassword"],
      workerimage: json["workerimage"],
       reportid: json["reportid"],
       id: json["id"],
    );
  }
}
