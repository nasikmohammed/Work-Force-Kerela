class AgentModel {
  // agent

  String? agencyname;

  String? agentstate;
  String? agentaddress;

  String? agentcity;
  String? agentemail;
  String? contactnumber;

  String? password;
  String? id;

  AgentModel({
    //agent

    this.agencyname,
    this.agentstate,
    this.agentaddress,
    this.agentcity,
    this.agentemail,
    this.contactnumber,
    this.password,
    this.id,
  });
  Map<String, dynamic> toJson(docId) => {
        //agent

        "agencyname": agencyname,
        "agentaddress": agentaddress,
        "agentstate": agentstate,

        "agentcity": agentcity,
        "agentemail": agentemail,
        "contactnumber": contactnumber,

        "password": password,
        "id": docId,
      };
  factory AgentModel.fromJson(Map<String, dynamic> json) {
    return AgentModel(
      agencyname: json["agencyname"],
      agentaddress: json["agentaddress"],
      agentcity: json["agentcity"],
      agentemail: json["agentemail"],
      agentstate: json["agentstate"],
      contactnumber: json["contactnumber"],
      password: json["password"],
      id: json["id"],
    );
  }
}
