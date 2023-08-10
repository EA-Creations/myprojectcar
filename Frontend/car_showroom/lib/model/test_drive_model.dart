class TestDriveModel {
  TestDriveModel({
    required this.msg,
  });
  late final List<Msg> msg;
  
  TestDriveModel.fromJson(Map<String, dynamic> json){
    msg = List.from(json['msg']).map((e)=>Msg.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['msg'] = msg.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Msg {
  Msg({
    required this.id,
    required this.showroomId,
    required this.customerId,
    required this.carId,
    required this.Date,
    required this.TestDriveStatus, 
  });
  late final String  id;
  late final ShowroomId showroomId;
  late final String customerId;
  late final CarId carId;
  late final String Date;
  late final bool TestDriveStatus;
  late final int _V;
  
  Msg.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    showroomId = ShowroomId.fromJson(json['ShowroomId']);
    customerId = json['CustomerId'];
    carId = CarId.fromJson(json['CarId']);
    Date = json['Date'];
    TestDriveStatus = json['TestDriveStatus'];
    _V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['ShowroomId'] = showroomId.toJson();
    _data['CustomerId'] = customerId;
    _data['CarId'] = carId.toJson();
    _data['Date'] = Date;
    _data['TestDriveStatus'] = TestDriveStatus;
    _data['__v'] = _V;
    return _data;
  }
}

class ShowroomId {
  ShowroomId({
    required this.id,
    required this.Name,
    required this.Email,
    required this.Phone,
    required this.Address,
    required this.City,
    required this.District,
    required this.ShowroomName,
  });
  late final String id;
  late final String Name;
  late final String Email;
  late final int Phone;
  late final String Address;
  late final String City;
  late final String District;
  late final String ShowroomName;
  
  ShowroomId.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    Name = json['Name'];
    Email = json['Email'];
    Phone = json['Phone'];
    Address = json['Address'];
    City = json['City'];
    District = json['District'];
    ShowroomName = json['ShowroomName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['Name'] = Name;
    _data['Email'] = Email;
    _data['Phone'] = Phone;
    _data['Address'] = Address;
    _data['City'] = City;
    _data['District'] = District;
    _data['ShowroomName'] = ShowroomName;
    return _data;
  }
}

class CarId {
  CarId({
    required this.id,
    required this.Showroom,
    required this.Carmodel,
    required this.Manufacturer,
    required this.Carspecs,
    required this.Price,
    required this.Milleage,
    required this.Features,
    required this.Colors,
    required this.Availability,
    required this.Warranty,
    required this.Loan,
    required this.CarImage, 
  });
  late final String id;
  late final String Showroom;
  late final String Carmodel;
  late final String Manufacturer;
  late final String Carspecs;
  late final String Price;
  late final String Milleage;
  late final String Features;
  late final String Colors;
  late final String Availability;
  late final String Warranty;
  late final String Loan;
  late final String CarImage;
  late final int _V;
  
  CarId.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    Showroom = json['Showroom'];
    Carmodel = json['Carmodel'];
    Manufacturer = json['Manufacturer'];
    Carspecs = json['Carspecs'];
    Price = json['Price'];
    Milleage = json['Milleage'];
    Features = json['Features'];
    Colors = json['Colors'];
    Availability = json['Availability'];
    Warranty = json['Warranty'];
    Loan = json['Loan'];
    CarImage = json['CarImage'];
    _V = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] =id;
    _data['Showroom'] = Showroom;
    _data['Carmodel'] = Carmodel;
    _data['Manufacturer'] = Manufacturer;
    _data['Carspecs'] = Carspecs;
    _data['Price'] = Price;
    _data['Milleage'] = Milleage;
    _data['Features'] = Features;
    _data['Colors'] = Colors;
    _data['Availability'] = Availability;
    _data['Warranty'] = Warranty;
    _data['Loan'] = Loan;
    _data['CarImage'] = CarImage;
    _data['__v'] = _V;
    return _data;
  }
}