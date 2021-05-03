import 'dart:convert';

class Tourist {
  Tourist({
    this.success,
    this.data,
  });

  bool success;
  Data data;

  factory Tourist.fromRawJson(String str) => Tourist.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Tourist.fromJson(Map<String, dynamic> json) => Tourist(
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
    this.url,
  });

  String url;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
      };

}
