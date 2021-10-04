import 'package:turkaiassessment/model/auth.dart';

class GetOne {
  GetOne({
    this.status,
    this.data,
  });

  int status;
  List<Auth> data;

  factory GetOne.fromJson(Map<String, dynamic> json) => GetOne(
    status: json["status"],
    data: List<Auth>.from(json["data"].map((x) => Auth.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'GetOne{status: $status, data: $data}';
  }

}
