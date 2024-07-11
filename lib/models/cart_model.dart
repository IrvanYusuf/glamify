class CartModel {
  String? id_user;
  int? id_product;
  String? title;
  num? price; // Bisa menjadi int atau double
  String? url_image;
  int? quantity;
  double? total_price;

  CartModel({
    this.id_user,
    this.id_product,
    this.title,
    this.price,
    this.url_image,
    this.quantity,
  }) : total_price = (price?.toDouble() ?? 0) * (quantity?.toDouble() ?? 0);

  factory CartModel.fromMap(Map<String, dynamic> data) {
    return CartModel(
      id_user: data['id_user'],
      id_product: data['id_product'],
      title: data['title'],
      price: data['price'],
      url_image: data['url_image'],
      quantity: data['quantity'],
    )..total_price = (data['price']?.toDouble() ?? 0) * (data['quantity']?.toDouble() ?? 0);
  }

  Map<String, dynamic> toMap() {
    return {
      'id_user': id_user,
      'id_product': id_product,
      'title': title,
      'price': price,
      'url_image': url_image,
      'quantity': quantity,
      'total_price': total_price,
    };
  }
}
