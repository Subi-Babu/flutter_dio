import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
    Users({
        required this.data,
    });

    List<User>? data;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        data: List<User>.from(json["data"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class User {
    User({
        required this.id,
        required this.name,
        required this.email,
        required this.profession,
    });

    int? id;
    String ? name;
    String? email;
    String? profession;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        profession: json["profession"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "profession": profession,
    };
}
