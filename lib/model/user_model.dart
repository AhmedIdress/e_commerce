class UserModel
{
  String? uid, email, name, pic;
  UserModel({ this.uid, this.email, this.name, this.pic});
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