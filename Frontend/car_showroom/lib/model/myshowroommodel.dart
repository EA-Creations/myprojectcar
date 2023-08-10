class MyShowroomModel {
  List<Msg>? msg;

  MyShowroomModel({this.msg});

  MyShowroomModel.fromJson(Map<String, dynamic> json) {
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
  ShowroomId? showroomId;
  String? customerId;
  CarId? carId;
  bool? bookingStatus;
  int? iV;

  Msg(
      {this.sId,
      this.showroomId,
      this.customerId,
      this.carId,
      this.bookingStatus,
      this.iV});

  Msg.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    showroomId = json['ShowroomId'] != null
        ? ShowroomId.fromJson(json['ShowroomId'])
        : null;
    customerId = json['CustomerId'];
    carId = json['CarId'] != null ? CarId.fromJson(json['CarId']) : null;
    bookingStatus = json['BookingStatus'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    if (showroomId != null) {
      data['ShowroomId'] = showroomId!.toJson();
    }
    data['CustomerId'] = customerId;
    if (carId != null) {
      data['CarId'] = carId!.toJson();
    }
    data['BookingStatus'] = bookingStatus;
    data['__v'] = iV;
    return data;
  }
}

class ShowroomId {
  String? sId;
  String? name;
  String? email;
  int? phone;
  String? address;
  String? city;
  String? district;
  String? showroomName;

  ShowroomId(
      {this.sId,
      this.name,
      this.email,
      this.phone,
      this.address,
      this.city,
      this.district,
      this.showroomName});

  ShowroomId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    email = json['Email'];
    phone = json['Phone'];
    address = json['Address'];
    city = json['City'];
    district = json['District'];
    showroomName = json['ShowroomName'];
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
    data['ShowroomName'] = showroomName;
    return data;
  }
}

class CarId {
  String? sId;
  String? carmodel;
  String? manufacturer;
  String? price;
  String? loan;
  String? carImage;

  CarId(
      {this.sId,
      this.carmodel,
      this.manufacturer,
      this.price,
      this.loan,
      this.carImage});

  CarId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    carmodel = json['Carmodel'];
    manufacturer = json['Manufacturer'];
    price = json['Price'];
    loan = json['Loan'];
    carImage = json['CarImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['Carmodel'] = carmodel;
    data['Manufacturer'] = manufacturer;
    data['Price'] = price;
    data['Loan'] = loan;
    data['CarImage'] = carImage;
    return data;
  }
}
