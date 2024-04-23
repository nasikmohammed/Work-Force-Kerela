class AgentModel {
  // agent
  String? agentname;
  String? agentaddress;
  String? agentcompanyname;
  String? agentcontactnumber;
  String? agentstate;
  String? agentcity;
  String? agentemail;
  String? agentpassword;
  String? agentconfirmpassword;
  String? agentwebsite;
  AgentModel(
      { //agent
      this.agentname,
      this.agentaddress,
      this.agentcompanyname,
      this.agentcontactnumber,
      this.agentstate,
      this.agentcity,
      this.agentemail,
      this.agentpassword,
      this.agentconfirmpassword,
      this.agentwebsite});
  Map<String, dynamic> toJson(docId) => {
        //agent
        "agentname": agentname,
        "agentaddress": agentaddress,
        "agentcompanyname": agentcompanyname,
        "agentcontactnumber": agentcontactnumber,
        "agentstate": agentstate,
        "agentcity": agentcity,
        "agentemail": agentemail,
        "agentpassword": agentpassword,
        "agentconfirmpassword": agentconfirmpassword,
        "agentwebsite": agentconfirmpassword,
      };
  factory AgentModel.fromJson(Map<String, dynamic> json) {
    return AgentModel(
      agentname: json["agentname"],
      agentaddress: json["agentaddress"],
      agentcompanyname: json["agentcompanyname"],
      agentcontactnumber: json["agentcontactnumber"],
      agentstate: json["agentstate"],
      agentcity: json["agentcity"],
      agentemail: json["agentemail"],
      agentpassword: json["agentpassword"],
      agentconfirmpassword: json["agentconfirmpassword"],
      agentwebsite: json["agentwebsite"],
    );
  }
}
