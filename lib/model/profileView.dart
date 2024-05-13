class Autogenerated {
  String? success;
  Data? data;

  Autogenerated({this.success, this.data});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Verification? verification;
  String? sId;
  String? role;
  String? name;
  String? email;
  int? phoneno;
  String? password;
  bool? isverified;
  String? dateCreated;
  int? iV;
  String? image;

  Data(
      {this.verification,
      this.sId,
      this.role,
      this.name,
      this.email,
      this.phoneno,
      this.password,
      this.isverified,
      this.dateCreated,
      this.iV,
      this.image});

  Data.fromJson(Map<String, dynamic> json) {
    verification = json['verification'] != null
        ? new Verification.fromJson(json['verification'])
        : null;
    sId = json['_id'];
    role = json['role'];
    name = json['name'];
    email = json['email'];
    phoneno = json['phoneno'];
    password = json['password'];
    isverified = json['isverified'];
    dateCreated = json['dateCreated'];
    iV = json['__v'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.verification != null) {
      data['verification'] = this.verification!.toJson();
    }
    data['_id'] = this.sId;
    data['role'] = this.role;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phoneno'] = this.phoneno;
    data['password'] = this.password;
    data['isverified'] = this.isverified;
    data['dateCreated'] = this.dateCreated;
    data['__v'] = this.iV;
    data['image'] = this.image;
    return data;
  }
}

class Verification {
  String? code;
  String? expiry;

  Verification({this.code, this.expiry});

  Verification.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    expiry = json['expiry'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['expiry'] = this.expiry;
    return data;
  }
}
