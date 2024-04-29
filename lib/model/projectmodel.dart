class ProjectDetailsModel {
  String? agentaddprojectname;
  String? agentaddplace;
  String? agentaddstartdate;
  String? agentaddenddate;
  String? agentaddnoworers;
  String? agentaddbudget;
  String? agentaddmanager;
  ProjectDetailsModel(
      {this.agentaddprojectname,
      this.agentaddplace,
      this.agentaddstartdate,
      this.agentaddenddate,
      this.agentaddnoworers,
      this.agentaddbudget,
      this.agentaddmanager});
  Map<String, dynamic> toJson(docId) => {
        //agentaddprojrct
        "agentaddprojectname": agentaddprojectname,
        "agentaddplace": agentaddplace,
        "agentaddstartdate": agentaddstartdate,
        "agentaddenddate": agentaddenddate,
        "agentaddnoworers": agentaddnoworers,
        "agentaddbudget": agentaddbudget,
        "agentaddmanager": agentaddmanager
      };
  factory ProjectDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProjectDetailsModel(
      agentaddprojectname: json["agentaddprojectname"],
      agentaddplace: json["agentaddplace"],
      agentaddstartdate: json["agentaddstartdate"],
      agentaddenddate: json["agentaddenddate"],
      agentaddnoworers: json["agentaddnoworers"],
      agentaddbudget: json["agentaddbudget"],
      agentaddmanager: json["agentaddmanager"],
    );
  }
}
