import 'package:sqflite/sqflite.dart';

// Inisiasi variabel meliputi id, nama, nomor kontak, email, dan perusahaan dengan kondisi null safety.
class Kontak {
  int? id;
  String? name;
  String? mobileNo;
  String? email;
  String? company;

  Kontak({this.id, this.name, this.mobileNo, this.email, this.company});

// Digunakan untuk mengonversi seluruh variabel pada class Kontak menjadi objek Map
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }

    map['name'] = name;
    map['mobileNo'] = mobileNo;
    map['email'] = email;
    map['company'] = company;

    return map;
  }

// Digunakan untuk mengonversi objek Map menjadi data variabel keseluruhan. Digunakan pada saat mengambil data pada SQLite
  Kontak.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.mobileNo = map['mobileNo'];
    this.email = map['email'];
    this.company = map['company'];
  }
}