import 'package:parshing_/seervic/Employee.dart';

class Empone {
  String? status;
  String? messege;
  Employee? data;

  Empone.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    messege = json['messege'];
    data = Employee.fromJson(json['data']);
  }
  Map<String, dynamic> toJson() =>
      {'status': status, 'messege': messege, 'data': data?.toJson()};
}
