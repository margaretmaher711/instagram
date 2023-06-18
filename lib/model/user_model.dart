class UserModel {
  String userName;
  String email;
  String password;
  String bio;
  String uid;

  List followers;
  List following;
  UserModel({
    required this.userName,
    required this.email,
    required this.password,
    required this.bio,required this.uid,required this.followers,required this.following
  });

  Map<String, dynamic> toJson() =>
      {'userName': userName, 'email': email, 'password': password, 'bio': bio,};

}