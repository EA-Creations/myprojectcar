class CarReview {
  List<Msg>? msg;

  CarReview({this.msg});

  CarReview.fromJson(Map<String, dynamic> json) {
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
  CustomerId? customerId;
  String? carId;
  String? feedbacks;
  int? rating;
  int? iV;

  Msg(
      {this.sId,
      this.customerId,
      this.carId,
      this.feedbacks,
      this.rating,
      this.iV});

  Msg.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    customerId = json['CustomerId'] != null
        ? new CustomerId.fromJson(json['CustomerId'])
        : null;
    carId = json['CarId'];
    feedbacks = json['Feedbacks'];
    rating = json['Rating'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.customerId != null) {
      data['CustomerId'] = this.customerId!.toJson();
    }
    data['CarId'] = this.carId;
    data['Feedbacks'] = this.feedbacks;
    data['Rating'] = this.rating;
    data['__v'] = this.iV;
    return data;
  }
}

class CustomerId {
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
  int? iV;

  CustomerId(
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
      this.iV});

  CustomerId.fromJson(Map<String, dynamic> json) {
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
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['Name'] = this.name;
    data['Email'] = this.email;
    data['Phone'] = this.phone;
    data['Address'] = this.address;
    data['City'] = this.city;
    data['District'] = this.district;
    data['State'] = this.state;
    data['Pincode'] = this.pincode;
    data['Password'] = this.password;
    data['UserType'] = this.userType;
    data['__v'] = this.iV;
    return data;
  }
}