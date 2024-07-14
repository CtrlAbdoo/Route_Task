class ProductModel {
  final int id;
  final String title;
  final String description;
  final double price;
  final double discountPercentage;
  final double rating;
  final List<String> images;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      rating: json['rating'].toDouble(),
      images: List<String>.from(json['images']),
    );
  }
}

class GetAllProductsModel {
  final List<ProductModel> products;

  GetAllProductsModel({
    required this.products,
  });

  factory GetAllProductsModel.fromJson(Map<String, dynamic> jsonData) {
    return GetAllProductsModel(
      products: List<ProductModel>.from(
        jsonData['products'].map((i) => ProductModel.fromJson(i)),
      ),
    );
  }
}
