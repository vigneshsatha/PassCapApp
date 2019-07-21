import 'dart:convert';

CredModel credModelFromJson(String str) => CredModel.fromJson(json.decode(str));

String credModelToJson(CredModel data) => json.encode(data.toJson());

class CredModel {
    int id;
    String userName;
    String password;

    CredModel({
        this.id,
        this.userName,
        this.password,
    });

    factory CredModel.fromJson(Map<String, dynamic> json) => new CredModel(
        id: json["id"],
        userName: json["user_name"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "password": password,
    };
}