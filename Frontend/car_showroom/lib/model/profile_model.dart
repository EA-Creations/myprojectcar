class ProfileModel {
  ProfileModel({
    required this.msg,
  });
  late final List<Msg> msg;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    msg = List.from(json['msg']).map((e) => Msg.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['msg'] = msg.map((e) => e.toJson()).toList();
    return data;
  }
}

class Msg {
  Msg(
      {required this.id,
      required this.Name,
      required this.Email,
      required this.Phone,
      required this.Address,
      required this.City,
      required this.District,
      required this.State,
      required this.Pincode,
      required this.Password,
      required this.UserType,
      required this.ShowroomName,
      required this.License,
      required this.Verification});
  late final String id;
  late final String Name;
  late final String Email;
  late final int Phone;
  late final String Address;
  late final String City;
  late final String District;
  late final String State;
  late final int Pincode;
  late final String Password;
  late final String UserType;
  late final String? ShowroomName;
  late final String? License;
  late final bool? Verification;

  Msg.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    Name = json['Name'];
    Email = json['Email'];
    Phone = json['Phone'];
    Address = json['Address'];
    City = json['City'];
    District = json['District'];
    State = json['State'];
    Pincode = json['Pincode'];
    Password = json['Password'];
    UserType = json['UserType'];
    ShowroomName = json['ShowroomName'];
    License = json['License'];
    Verification = json['Verification'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = id;
    data['Name'] = Name;
    data['Email'] = Email;
    data['Phone'] = Phone;
    data['Address'] = Address;
    data['City'] = City;
    data['District'] = District;
    data['State'] = State;
    data['Pincode'] = Pincode;
    data['Password'] = Password;
    data['UserType'] = UserType;
    data['ShowroomName'] = ShowroomName;
    data['License'] = License;
    data['Verification'] = Verification;
    return data;
  }
}
