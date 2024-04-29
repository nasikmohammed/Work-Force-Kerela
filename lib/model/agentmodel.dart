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
  String? id;

  AgentModel({
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
    this.id,
  });
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
        "id": docId,
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
      id: json["id"],
    );
  }
}
