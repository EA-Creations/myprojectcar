class CarListModel {
  List<Msg>? msg;

  CarListModel({this.msg});

  CarListModel.fromJson(Map<String, dynamic> json) {
    if (json['msg'] != null) {
      msg = <Msg>[];
      json['msg'].forEach((v) {
        msg!.add(Msg.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (msg != null) {
      data['msg'] = msg!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Msg {
  String? sId;
  Showroom? showroom;
  String? carmodel;
  String? manufacturer;
  String? carspecs;
  String? price;
  String? milleage;
  String? features;
  String? colors;
  String? availability;
  String? warranty;
  String? loan;
  String? carImage;
  int? iV;

  Msg(
      {this.sId,
      this.showroom,
      this.carmodel,
      this.manufacturer,
      this.carspecs,
      this.price,
      this.milleage,
      this.features,
      this.colors,
      this.availability,
      this.warranty,
      this.loan,
      this.carImage,
      this.iV});

  Msg.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    showroom =
        json['Showroom'] != null ? Showroom.fromJson(json['Showroom']) : null;
    carmodel = json['Carmodel'];
    manufacturer = json['Manufacturer'];
    carspecs = json['Carspecs'];
    price = json['Price'];
    milleage = json['Milleage'];
    features = json['Features'];
    colors = json['Colors'];
    availability = json['Availability'];
    warranty = json['Warranty'];
    loan = json['Loan'];
    carImage = json['CarImage'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (showroom != null) {
      data['Showroom'] = showroom!.toJson();
    }
    data['Carmodel'] = carmodel;
    data['Manufacturer'] = manufacturer;
    data['Carspecs'] = carspecs;
    data['Price'] = price;
    data['Milleage'] = milleage;
    data['Features'] = features;
    data['Colors'] = colors;
    data['Availability'] = availability;
    data['Warranty'] = warranty;
    data['Loan'] = loan;
    data['CarImage'] = carImage;
    data['__v'] = iV;
    return data;
  }
}

class Showroom {
  String? sId;
  String? name;
  String? email;
  int? phone;
  String? address;
  String? city;
  String? district;
  String? state;
  int? pincode;
  String? password;
  String? userType;
  String? showroomName;
  String? license;
  bool? verification;
  int? iV;

  Showroom(
      {this.sId,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.city,
      this.district,
      this.state,
      this.pincode,
      this.password,
      this.userType,
      this.showroomName,
      this.license,
      this.verification,
      this.iV});

  Showroom.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    email = json['Email'];
    phone = json['Phone'];
    address = json['Address'];
    city = json['City'];
    district = json['District'];
    state = json['State'];
    pincode = json['Pincode'];
    password = json['Password'];
    userType = json['UserType'];
    showroomName = json['ShowroomName'];
    license = json['License'];
    verification = json['Verification'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['Name'] = name;
    data['Email'] = email;
    data['Phone'] = phone;
    data['Address'] = address;
    data['City'] = city;
    data['District'] = district;
    data['State'] = state;
    data['Pincode'] = pincode;
    data['Password'] = password;
    data['UserType'] = userType;
    data['ShowroomName'] = showroomName;
    data['License'] = license;
    data['Verification'] = verification;
    data['__v'] = iV;
    return data;
  }
}
