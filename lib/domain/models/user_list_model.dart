import 'dart:convert';

List<UserListModel> userListModelFromJson(String str) =>
    List<UserListModel>.from(
        json.decode(str).map((x) => UserListModel.fromJson(x)));

String userListModelToJson(List<UserListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserListModel {
  int? id;
  String? full_name;
  String? user_name;
  String? role_name;
  String? contact_no;
  int? role_id;
  String? status;
  int? photoId;
  String? photoPath;

  UserListModel(
      {this.id,
      this.contact_no,
      this.full_name,
      this.role_name,
      this.user_name,
      this.photoId,
      this.photoPath,
      this.role_id,
      this.status});

  factory UserListModel.fromJson(Map<String, dynamic> json) => UserListModel(
        id: json['id'],
        full_name: json['full_name'],
        contact_no: json['contact_no'],
        role_name: json['role_name'],
        user_name: json['user_name'],
        photoId: json['photoId'],
        photoPath: json['photoPath'],
        role_id: json['role_id'],
        status: json['status'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": user_name,
        "full_name": full_name,
        "contact_no": contact_no,
        "role_name": role_name,
        "photoId": photoId,
        "photoPath": photoPath != null
            ? "https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"
            : "https://images.pexels.com/photos/2899097/pexels-photo-2899097.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
        "role_id": role_id,
        "status": status,
      };
}
