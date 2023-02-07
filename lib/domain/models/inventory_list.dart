// To parse this JSON data, do
//
//     final inventoryList = inventoryListFromJson(jsonString);

import 'dart:convert';

List<InventoryList> inventoryListFromJson(String str) =>
    List<InventoryList>.from(
        json.decode(str).map((x) => InventoryList.fromJson(x)));

String inventoryListToJson(List<InventoryList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InventoryList {
  InventoryList({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required this.categoryName,
    required this.blockName,
    required this.parentName,
    required this.serialNumber,
    required this.customerName,
    required this.ownerName,
    required this.operatorName,
    required this.status,
  });

  int id;
  String? name;
  String? description;
  String? type;
  String? categoryName;
  String? blockName;
  String? parentName;
  String? serialNumber;
  String? customerName;
  String? ownerName;
  String? operatorName;
  String? status;

  factory InventoryList.fromJson(Map<String, dynamic> json) => InventoryList(
        id: json["id"] as int? ?? 0,
        name: json["name"] as String? ?? '',
        description: json["description"] as String? ?? '',
        type: json["type"] as String? ?? '',
        categoryName: json["category_name"] as String? ?? '',
        blockName: json["block_name"] as String? ?? '',
        parentName: json["parent_name"] as String? ?? '',
        serialNumber: json["serial_number"] as String? ?? '',
        customerName: json["customer_name"] as String? ?? '',
        ownerName: json["owner_name"] as String? ?? '',
        operatorName: json["operator_name"] as String? ?? '',
        status: json["status"] as String? ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "type": type,
        "category_name": categoryName,
        "block_name": blockName,
        "parent_name": parentName,
        "serial_number": serialNumber,
        "customer_name": customerName,
        "owner_name": ownerName,
        "operator_name": operatorName,
        "status": status,
      };
}
