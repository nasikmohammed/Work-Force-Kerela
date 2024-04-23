class ManagerModel {
  String? managername;
  String? manageraddress;
  String? managercontactnumber;
  String? managerstate;
  String? managercity;
  String? manageremail;
  String? managerpassword;
  ManagerModel(
      {this.managername,
      this.manageraddress,
      this.managercontactnumber,
      this.managerstate,
      this.managercity,
      this.manageremail,
      this.managerpassword});
  Map<String, dynamic> toJson(docId) => {
        "managername": managername,
        "manageraddress": manageraddress,
        "managercontactnumber": managercontactnumber,
        "managerstate": managerstate,
        "managercity": managercity,
        "manageremail": manageremail,
        "managerpassword": managerpassword,
      };
  factory ManagerModel.fromJson(Map<String, dynamic> json) {
    return ManagerModel(
      managername: json["managername"],
      manageraddress: json["manageraddress"],
      managercontactnumber: json["managercontactnumber"],
      managerstate: json["managerstate"],
      managercity: json["managercity"], 
      manageremail: json["manageremail"],
      managerpassword: json["managerpassword"],
    );
  }
}
