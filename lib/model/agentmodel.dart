class AgentModel {
  // agent
  String? agentfirstname;
  String? agentlastname;
  String? agentcountry;
  String? agentaddress;

  String? agentcity;
  String? agentemail;
  String? aadharnumber;
  String? martial;
  String? password;
  //addproject
  String? agentaddprojectname;
  String? agentaddplace;
  String? agentaddstartdate;
  String? agentaddenddate;
  String? agentaddnoworers;
  String? agentaddbudget;
  String? agentaddmanager;

  AgentModel(
      {
      //agent
      this.agentfirstname,
      this.agentlastname,
      this.agentcountry,
      this.agentaddress,
      this.agentcity,
      this.agentemail,
      this.aadharnumber,
      this.martial,
      this.password,
      //addproject
      this.agentaddprojectname,
      this.agentaddplace,
      this.agentaddstartdate,
      this.agentaddenddate,
      this.agentaddnoworers,
      this.agentaddbudget,
      this.agentaddmanager});
  Map<String, dynamic> toJson(docId) => {
        //agent
        "agentfirstname": agentfirstname,
        "agentaddress": agentaddress,
        "agentcountry": agentcountry,
        "agentlastname": agentlastname,

        "agentcity": agentcity,
        "agentemail": agentemail,
        "aadharnumber": aadharnumber,
        "martial": martial,
        "password": password,
        //agentaddprojrct
        "agentaddprojectname": agentaddprojectname,
        "agentaddplace": agentaddplace,
        "agentaddstartdate": agentaddstartdate,
        "agentaddenddate": agentaddenddate,
        "agentaddnoworers": agentaddnoworers,
        "agentaddbudget": agentaddbudget,
        "agentaddmanager": agentaddmanager
      };
  factory AgentModel.fromJson(Map<String, dynamic> json) {
    return AgentModel(
      agentfirstname: json["agentfirstname"],
      agentaddress: json["agentaddress"],
      agentlastname: json["agentlastname"],
      agentcity: json["agentcity"],
      agentemail: json["agentemail"],
      agentcountry: json["agentcountry"],
      aadharnumber: json["aadharnumber"],
      martial: json["martial"],
      password: json["password"],
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
