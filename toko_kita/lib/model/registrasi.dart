import 'package:flutter/foundation.dart';

class Registrasi {
  int? code;
  bool? status;
  String? data;

  Registrasi(this.code, this.status, this.data);
  factory Registrasi.fromJson(Map<String, dynamic> obj) {
    return Registrasi(
      obj['code'],
      obj['status'],
      obj['data'],
    );
  }
}
