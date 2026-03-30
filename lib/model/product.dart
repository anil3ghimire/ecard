class Product {
  String? name;
  String? productDescriptions;
  String? productURl;
  String? price;

  Product({this.name, this.productDescriptions, this.productURl, this.price});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json['name'] as String?,
    productDescriptions: json['productDescriptions'] as String?,
    productURl: json['productURl'] as String?,
    price: json['price'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'productDescriptions': productDescriptions,
    'productURl': productURl,
    'price': price,
  };
}
