


class UserModel{
  int? id;
  String? firstname;
  String? email;
  String? avatar;

  UserModel({this.id,this.firstname,this.email,this.avatar});

 factory UserModel.fromJson(Map<String,dynamic> json){
   return UserModel(
     id: json['id'],
     firstname: json['first_name'],
     email: json['email'],
     avatar: json['avatar'],
   );
 }



}
