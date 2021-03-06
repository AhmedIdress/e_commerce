class BestsellingModel {
  late String image, name, describe, color, size,productId,price,catigory;
  BestsellingModel({
    required this.name,
    required this.image,
    required this.describe,
    required this.price,
    required this.color,
    required this.size,
    required this.productId,
    required this.catigory,
  });

  BestsellingModel.fromJson(Map<String, dynamic> map) {
    image = map['image'];
    name = map['name'];
    describe = map['describe'];
    price = map['price'];
    color = map['color'];
    size = map['size'];
    productId = map['productId'];
    catigory = map['catigory'];
  }
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'describe': describe,
      'price': price,
      'color': color,
      'size': size,
      'productId': productId,
      'catigory': catigory,
    };
  }
}
