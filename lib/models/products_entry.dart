// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    int id;
    String name;
    int price;
    int stock;
    String description;
    String thumbnail;
    int? user;
    bool isFeatured;
    String category;

    ProductEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.stock,
        required this.description,
        required this.thumbnail,
        required this.user,
        required this.isFeatured,
        required this.category,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        stock: json["stock"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        user: json["user"],
        isFeatured: json["is_featured"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "stock": stock,
        "description": description,
        "thumbnail": thumbnail,
        "user": user,
        "is_featured": isFeatured,
        "category": category,
    };
}