class StateModel {
  String state;
  String alias;
  List<String> lgas;
  // constructor
  StateModel({this.state, this.alias, this.lgas});
  // Mappinng data from JSON
  StateModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    alias = json['alias'];
    lgas = json['lgas'].cast<String>();
  }
//Mapping Data to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = this.state;
    data['alias'] = this.alias;
    data['lgas'] = this.lgas;
    return data;
  }
}
