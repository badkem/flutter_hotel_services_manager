import 'dart:convert';

class HotelItem {
  HotelItem({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory HotelItem.fromRawJson(String str) =>
      HotelItem.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HotelItem.fromJson(Map<String, dynamic> json) => HotelItem(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "data": data == null ? null : data.toJson(),
      };
}

class Data {
  Data({
    this.page,
    this.data,
    this.totalPage,
    this.count,
  });

  int page;
  List<Datum> data;
  int totalPage;
  int count;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        page: json["page"] == null ? null : json["page"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        totalPage: json["totalPage"] == null ? null : json["totalPage"],
        count: json["count"] == null ? null : json["count"],
      );

  Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
        "totalPage": totalPage == null ? null : totalPage,
        "count": count == null ? null : count,
      };
}

class Datum {
  Datum({
    this.id,
    this.title,
    this.content,
    this.imagePaths,
    this.dateCreated,
    this.status,
    this.avatar,
  });

  int id;
  String title;
  String content;
  String imagePaths;
  DateTime dateCreated;
  int status;
  String avatar;

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        content: json["content"] == null ? null : json["content"],
        imagePaths: json["imagePaths"] == null ? null : json["imagePaths"],
        dateCreated: json["dateCreated"] == null
            ? null
            : DateTime.parse(json["dateCreated"]),
        status: json["status"] == null ? null : json["status"],
        avatar: json["avatar"] == null ? null : json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "content": content == null ? null : content,
        "imagePaths": imagePaths == null ? null : imagePaths,
        "dateCreated":
            dateCreated == null ? null : dateCreated.toIso8601String(),
        "status": status == null ? null : status,
        "avatar": avatar == null ? null : avatar,
      };
}
