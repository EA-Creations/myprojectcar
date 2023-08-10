class MyCarModel {
  List<Msg>? msg;

  MyCarModel({this.msg});

  MyCarModel.fromJson(Map<String, dynamic> json) {
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
    showroomId = json['ShowroomId'];
    customerId = json['CustomerId'];
    carId = json['CarId'] != null ? new CarId.fromJson(json['CarId']) : null;
    bookingStatus = json['BookingStatus'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['ShowroomId'] = this.showroomId;
    data['CustomerId'] = this.customerId;
    if (this.carId != null) {
      data['CarId'] = this.carId!.toJson();
    }
    data['BookingStatus'] = this.bookingStatus;
    data['__v'] = this.iV;
    return data;
  }
}

class CarId {
  String? sId;
  String? showroom;
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

  CarId(
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

  CarId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    showroom = json['Showroom'];
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Showroom'] = this.showroom;
    data['Carmodel'] = this.carmodel;
    data['Manufacturer'] = this.manufacturer;
    data['Carspecs'] = this.carspecs;
    data['Price'] = this.price;
    data['Milleage'] = this.milleage;
    data['Features'] = this.features;
    data['Colors'] = this.colors;
    data['Availability'] = this.availability;
    data['Warranty'] = this.warranty;
    data['Loan'] = this.loan;
    data['CarImage'] = this.carImage;
    data['__v'] = this.iV;
    return data;
  }
}