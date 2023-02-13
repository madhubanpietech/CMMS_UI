import 'dart:convert';

List<AddInventoryRequestModel> addInventoryRequestModelFromJson(String str) =>
    List<AddInventoryRequestModel>.from(
        json.decode(str).map((x) => AddInventoryRequestModel.fromJson(x)));

String addInventoryRequestModelToJson(List<AddInventoryRequestModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddInventoryRequestModel {
  AddInventoryRequestModel({
    required this.name,
    required this.description,
    required this.typeId,
    required this.statusId,
    required this.facilityId,
    required this.blockId,
    required this.parentId,
    required this.categoryId,
    required this.acCapacity,
    required this.dcCapacity,
    required this.serialNumber,
    required this.multiplier,
    required this.calibrationFrequency,
    required this.calibrationFrequencyType,
    required this.calibrationReminderDays,
    required this.calibrationFirstDueDate,
    required this.calibrationLastDate,
    required this.customerId,
    required this.ownerId,
    required this.operatorId,
    required this.manufacturerId,
    required this.supplierId,
    required this.model,
    required this.stockCount,
    required this.moduleQuantity,
    required this.cost,
    required this.currency,
    this.attachments,
    required this.lstWarrantyDetail,
  });

  String? name;
  String? description;
  int? typeId;
  int? statusId;
  int? facilityId;
  int? blockId;
  int? parentId;
  int? categoryId;
  int? acCapacity;
  int? dcCapacity;
  String? serialNumber;
  int? multiplier;
  int? calibrationFrequency;
  int? calibrationFrequencyType;
  int? calibrationReminderDays;
  String? calibrationFirstDueDate;
  String? calibrationLastDate;
  int? customerId;
  int? ownerId;
  int? operatorId;
  int? manufacturerId;
  int? supplierId;
  String? model;
  int? stockCount;
  int? moduleQuantity;
  int? cost;
  String? currency;
  dynamic attachments;
  List<LstWarrantyDetail> lstWarrantyDetail;

  factory AddInventoryRequestModel.fromJson(Map<String, dynamic> json) =>
      AddInventoryRequestModel(
        name: json["name"] as String? ?? '',
        description: json["description"] as String? ?? '',
        typeId: json["typeId"] as int? ?? 0,
        statusId: json["statusId"] as int? ?? 0,
        facilityId: json["facilityId"] as int? ?? 0,
        blockId: json["blockId"] as int? ?? 0,
        parentId: json["parentId"] as int? ?? 0,
        categoryId: json["categoryId"] as int? ?? 0,
        acCapacity: json["acCapacity"] as int? ?? 0,
        dcCapacity: json["dcCapacity"] as int? ?? 0,
        serialNumber: json["serialNumber"] as String? ?? '',
        multiplier: json["multiplier"] as int? ?? 0,
        calibrationFrequency: json["calibrationFrequency"] as int? ?? 0,
        calibrationFrequencyType: json["calibrationFrequencyType"] as int? ?? 0,
        calibrationReminderDays: json["calibrationReminderDays"] as int? ?? 0,
        calibrationFirstDueDate:
            json["calibrationFirstDueDate"] as String? ?? '',
        calibrationLastDate: json["calibrationLastDate"] as String? ?? '',
        customerId: json["customerId"] as int? ?? 0,
        ownerId: json["ownerId"] as int? ?? 0,
        operatorId: json["operatorId"] as int? ?? 0,
        manufacturerId: json["manufacturerId"] as int? ?? 0,
        supplierId: json["supplierId"] as int? ?? 0,
        model: json["model"] as String? ?? '',
        stockCount: json["stockCount"] as int? ?? 0,
        moduleQuantity: json["moduleQuantity"] as int? ?? 0,
        cost: json["cost"] as int? ?? 0,
        currency: json["currency"] as String? ?? '',
        attachments: json["attachments"] as int? ?? 0,
        lstWarrantyDetail: List<LstWarrantyDetail>.from(
            json["lstWarrantyDetail"]
                .map((x) => LstWarrantyDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "typeId": typeId,
        "statusId": statusId,
        "facilityId": facilityId,
        "blockId": blockId,
        "parentId": parentId,
        "categoryId": categoryId,
        "acCapacity": acCapacity,
        "dcCapacity": dcCapacity,
        "serialNumber": serialNumber,
        "multiplier": multiplier,
        "calibrationFrequency": calibrationFrequency,
        "calibrationFrequencyType": calibrationFrequencyType,
        "calibrationReminderDays": calibrationReminderDays,
        "calibrationFirstDueDate": calibrationFirstDueDate,
        "calibrationLastDate": calibrationLastDate,
        "customerId": customerId,
        "ownerId": ownerId,
        "operatorId": operatorId,
        "manufacturerId": manufacturerId,
        "supplierId": supplierId,
        "model": model,
        "stockCount": stockCount,
        "moduleQuantity": moduleQuantity,
        "cost": cost,
        "currency": currency,
        "attachments": attachments,
        "lstWarrantyDetail":
            List<dynamic>.from(lstWarrantyDetail.map((x) => x.toJson())),
      };
}

class LstWarrantyDetail {
  LstWarrantyDetail({
    required this.warrantyType,
    this.warrantyDescription,
    required this.warrrantyTermType,
    required this.expiryDate,
    required this.meterLimit,
    required this.meterUnit,
    required this.warrantyProviderId,
    this.certificateNumber,
    required this.warrantyStatus,
  });

  int? warrantyType;
  String? warrantyDescription;
  int? warrrantyTermType;
  DateTime expiryDate;
  int? meterLimit;
  int? meterUnit;
  int? warrantyProviderId;
  dynamic certificateNumber;
  int? warrantyStatus;

  factory LstWarrantyDetail.fromJson(Map<String, dynamic> json) =>
      LstWarrantyDetail(
        warrantyType: json["warranty_type"] as int? ?? 0,
        warrantyDescription: json["warranty_description"] as String? ?? '',
        warrrantyTermType: json["warrranty_term_type"] as int? ?? 0,
        expiryDate: DateTime.parse(json["expiry_date"]),
        meterLimit: json["meter_limit"] as int? ?? 0,
        meterUnit: json["meter_unit"] as int? ?? 0,
        warrantyProviderId: json["warranty_provider_Id"] as int? ?? 0,
        certificateNumber: json["certificate_number"] as int? ?? 0,
        warrantyStatus: json["warranty_status"] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "warranty_type": warrantyType,
        "warranty_description": warrantyDescription,
        "warrranty_term_type": warrrantyTermType,
        "expiry_date":
            "${expiryDate.year.toString().padLeft(4, '0')}-${expiryDate.month.toString().padLeft(2, '0')}-${expiryDate.day.toString().padLeft(2, '0')}",
        "meter_limit": meterLimit,
        "meter_unit": meterUnit,
        "warranty_provider_Id": warrantyProviderId,
        "certificate_number": certificateNumber,
        "warranty_status": warrantyStatus,
      };
}
