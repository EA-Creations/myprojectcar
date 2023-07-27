class CarListModel {
  CarListModel({
    required this.msg,
  });
  late final List<Msg> msg;
  
  CarListModel.fromJson(Map<String, dynamic> json){
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
    required this.CarImage
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
  
  Msg.fromJson(Map<String, dynamic> json){
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
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
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
    return _data;
  }
}