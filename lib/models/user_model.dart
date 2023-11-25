class UserModel {
  String? uid;
  String? name;
  String? email;
  String? mobileNumber;
  String? address;

  UserModel({this.uid, this.name, this.email, this.mobileNumber, this.address});

  // data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      mobileNumber: map['mobileNumber'],
      address: map['address'],
    );
  }

  // sending data to server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'mobileNumber': mobileNumber,
      'address': address, 
    };
  }
}
