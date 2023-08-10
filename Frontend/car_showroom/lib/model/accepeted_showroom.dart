class AccepetedShowroomModel {
  AccepetedShowroomModel({
    required this.msg,
  });
  late final List<Msg> msg;

  AccepetedShowroomModel.fromJson(Map<String, dynamic> json) {
    msg = List.from(json['msg']).map((e) => Msg.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msg'] = msg.map((e) => e.toJson()).toList();
    return data;
  }
}

class Msg {
  Msg({
    required this.id,
    required this.Name,
    required this.ShowroomName,
    required this.Email,
    required this.Phone,
    required this.Address,
    required this.City,
    required this.District,
    required this.State,
    required this.Pincode,
    required this.verification,
  });
  late final String id;
  late final String Name;
  late final String ShowroomName;
  late final String Email;
  late final int Phone;
  late final String Address;
  late final String City;
  late final String District;
  late final String State;
  late final bool verification;
  late final int Pincode;

  Msg.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    Name = json['Name'];
    ShowroomName = json['ShowroomName'];
    Email = json['Email'];
    Phone = json['Phone'];
    Address = json['Address'];
    City = json['City'];
    District = json['District'];
    State = json['State'];
    Pincode = json['Pincode'];
    // License = json['License'];
    verification = json['Verification'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['Name'] = Name;
    data['ShowroomName'] = ShowroomName;
    data['Email'] = Email;
    data['Phone'] = Phone;
    data['Address'] = Address;
    data['City'] = City;
    data['District'] = District;
    data['State'] = State;
    data['Pincode'] = Pincode;
    return data;
  }
}
