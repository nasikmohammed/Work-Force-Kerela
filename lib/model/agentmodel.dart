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
  String? image;

  AgentModel(
      {
      //agent

      this.agencyname,
      this.agentstate,
      this.agentaddress,
      this.agentcity,
      this.agentemail,
      this.contactnumber,
      this.password,
      this.id,
      this.image});
  Map<String, dynamic> toJson() => {
        //agent

        "agencyname": agencyname,
        "agentaddress": agentaddress,
        "agentstate": agentstate,

        "agentcity": agentcity,
        "agentemail": agentemail,
        "contactnumber": contactnumber,

        "password": password,

        "image": image
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
      image: json["image"],
    );
  }
}
