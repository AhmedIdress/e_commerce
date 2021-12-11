class CategoryModel {
 late String image , name;
 CategoryModel({required this.name,required this.image,});

 CategoryModel.fromJson(Map<String,dynamic> map)
{
  image=map['image']!;
  name=map['name']!;
}
 Map<String,dynamic> toJson()
 {
   return {
     'image' : image,
     'name'  : name,
   };
 }
}