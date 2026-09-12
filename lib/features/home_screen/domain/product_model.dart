import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  Products({
    required this.products,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
    products: List<Product>.from(
      json["products"].map((x) => Product.fromJson(x)),
    ),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Product {
  final int id;
  final String title;
  final String description;
  final String category;
  final double price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final List<String> tags;
  final String brand;
  final String sku;
  final int weight;
  final Dimensions dimensions;
  final String warrantyInformation;
  final String shippingInformation;
  final String availabilityStatus;
  final List<Review> reviews;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final Meta meta;
  final List<String> images;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.tags,
    required this.brand,
    required this.sku,
    required this.weight,
    required this.dimensions,
    required this.warrantyInformation,
    required this.shippingInformation,
    required this.availabilityStatus,
    required this.reviews,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.meta,
    required this.images,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"] ?? 0,
    title: json["title"] ?? "",
    description: json["description"] ?? "",
    category: json["category"] ?? "",
    price: (json["price"] as num?)?.toDouble() ?? 0.0,
    discountPercentage: (json["discountPercentage"] as num?)?.toDouble() ?? 0.0,
    rating: (json["rating"] as num?)?.toDouble() ?? 0.0,
    stock: json["stock"] ?? 0,
    tags: json["tags"] != null
        ? List<String>.from(json["tags"].map((x) => x.toString()))
        : [],
    brand: json["brand"]?.toString() ?? "",
    sku: json["sku"]?.toString() ?? "",
    weight: json["weight"] ?? 0,
    dimensions: json["dimensions"] != null
        ? Dimensions.fromJson(json["dimensions"])
        : Dimensions(width: 0, height: 0, depth: 0),
    warrantyInformation: json["warrantyInformation"]?.toString() ?? "",
    shippingInformation: json["shippingInformation"]?.toString() ?? "",
    availabilityStatus: json["availabilityStatus"]?.toString() ?? "",
    reviews: json["reviews"] != null
        ? List<Review>.from(
            (json["reviews"] as List).map((x) => Review.fromJson(x)),
          )
        : [],
    returnPolicy: json["returnPolicy"]?.toString() ?? "",
    minimumOrderQuantity: json["minimumOrderQuantity"] ?? 1,
    meta: json["meta"] != null
        ? Meta.fromJson(json["meta"])
        : Meta(
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            barcode: "",
            qrCode: "",
          ),
    images: json["images"] != null
        ? List<String>.from(json["images"].map((x) => x.toString()))
        : [],
    thumbnail: json["thumbnail"]?.toString() ?? "",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "category": category,
    "price": price,
    "discountPercentage": discountPercentage,
    "rating": rating,
    "stock": stock,
    "tags": List<dynamic>.from(tags.map((x) => x)),
    "brand": brand,
    "sku": sku,
    "weight": weight,
    "dimensions": dimensions.toJson(),
    "warrantyInformation": warrantyInformation,
    "shippingInformation": shippingInformation,
    "availabilityStatus": availabilityStatus,
    "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
    "returnPolicy": returnPolicy,
    "minimumOrderQuantity": minimumOrderQuantity,
    "meta": meta.toJson(),
    "images": List<dynamic>.from(images.map((x) => x)),
    "thumbnail": thumbnail,
  };
}

class Dimensions {
  final double width;
  final double height;
  final double depth;

  Dimensions({required this.width, required this.height, required this.depth});

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
    width: (json["width"] as num?)?.toDouble() ?? 0.0,
    height: (json["height"] as num?)?.toDouble() ?? 0.0,
    depth: (json["depth"] as num?)?.toDouble() ?? 0.0,
  );

  Map<String, dynamic> toJson() => {
    "width": width,
    "height": height,
    "depth": depth,
  };
}

class Meta {
  final DateTime createdAt;
  final DateTime updatedAt;
  final String barcode;
  final String qrCode;

  Meta({
    required this.createdAt,
    required this.updatedAt,
    required this.barcode,
    required this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    createdAt: json["createdAt"] != null
        ? (DateTime.tryParse(json["createdAt"]) ?? DateTime.now())
        : DateTime.now(),
    updatedAt: json["updatedAt"] != null
        ? (DateTime.tryParse(json["updatedAt"]) ?? DateTime.now())
        : DateTime.now(),
    barcode: json["barcode"]?.toString() ?? "",
    qrCode: json["qrCode"]?.toString() ?? "",
  );

  Map<String, dynamic> toJson() => {
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "barcode": barcode,
    "qrCode": qrCode,
  };
}

class Review {
  final int rating;
  final String comment;
  final DateTime date;
  final String reviewerName;
  final String reviewerEmail;

  Review({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
    required this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    rating: json["rating"] ?? 0,
    comment: json["comment"]?.toString() ?? "",
    date: json["date"] != null
        ? (DateTime.tryParse(json["date"]) ?? DateTime.now())
        : DateTime.now(),
    reviewerName: json["reviewerName"]?.toString() ?? "",
    reviewerEmail: json["reviewerEmail"]?.toString() ?? "",
  );

  Map<String, dynamic> toJson() => {
    "rating": rating,
    "comment": comment,
    "date": date.toIso8601String(),
    "reviewerName": reviewerName,
    "reviewerEmail": reviewerEmail,
  };
}
