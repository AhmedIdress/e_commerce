import 'package:e_commerce/constant.dart';

class TrackModel{
  late String id,price,image;
  late ProcessEnum orderState;
  late int state;

  TrackModel({required this.id, required this.price,required this.state, required this.orderState,required this.image});
  TrackModel.fromJson(Map<String,dynamic> map)
  {
    id=map['id'];
    price=map['price'];
    orderState=map['orderState'];
    state=map['state'];
    image=map['image'];
  }
  Map<String,dynamic> toJson()
  {
    return {
    'id':id,
    'price':price,
    'orderState':orderState,
    'image':image,
    'state':state,
    };
  }
}