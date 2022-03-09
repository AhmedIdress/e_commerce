class UserModel
{
  late String uid, email, name, pic;
  UserModel({ required this.uid, required this.email, required this.name, required this.pic});
  UserModel.fromJson(Map<String,dynamic>map)
  {
    uid=map['uid'];
    email=map['email'];
    name=map['name'];
    pic=map['pic'];
  }
  Map<String,dynamic> toJson()
  {
    return {
    'uid':uid,
    'email':email,
    'name':name,
    'pic':pic,
    };
  }
}