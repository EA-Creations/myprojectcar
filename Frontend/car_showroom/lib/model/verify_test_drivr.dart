class VerifyTestDriveModel {
  List<Msg>? msg;

  VerifyTestDriveModel({this.msg});

  VerifyTestDriveModel.fromJson(Map<String, dynamic> json) {
    if (json['msg'] != null) {
      msg = <Msg>[];
      json['msg'].forEach((v) {
        msg!.add(new Msg.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.msg != null) {
      data['msg'] = this.msg!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Msg {
  String? sId;
  String? showroomId;
  CustomerId? customerId;
  CarId? carId;
  String? date;
  bool? testDriveStatus;
  int? iV;

  Msg(
      {this.sId,
      this.showroomId,
      this.customerId,
      this.carId,
      this.date,
      this.testDriveStatus,
      this.iV});

  Msg.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    showroomId = json['ShowroomId'];
    customerId = json['CustomerId'] != null
        ? new CustomerId.fromJson(json['CustomerId'])
        : null;
    carId = json['CarId'] != null ? new CarId.fromJson(json['CarId']) : null;
    date = json['Date'];
    testDriveStatus = json['TestDriveStatus'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['ShowroomId'] = this.showroomId;
    if (this.customerId != null) {
      data['CustomerId'] = this.customerId!.toJson();
    }
    if (this.carId != null) {
      data['CarId'] = this.carId!.toJson();
    }
    data['Date'] = this.date;
    data['TestDriveStatus'] = this.testDriveStatus;
    data['__v'] = this.iV;
    return data;
  }
}

class CustomerId {
  String? sId;
  String? name;
  String? email;
  int? phone;

  CustomerId({this.sId, this.name, this.email, this.phone});

  CustomerId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['Name'];
    email = json['Email'];
    phone = json['Phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['Phone'] = this.phone;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Carmodel'] = this.carmodel;
    data['Manufacturer'] = this.manufacturer;
    data['Price'] = this.price;
    data['Loan'] = this.loan;
    data['CarImage'] = this.carImage;
    return data;
  }
}