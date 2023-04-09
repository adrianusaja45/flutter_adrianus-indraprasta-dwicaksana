import 'dart:io';
import 'dart:ui';

class AddContactList {
  late String id;
  late String nama;
  late int? number;
  late DateTime? date;
  late Color warna;
  late File? file;

  AddContactList(
      {required this.id,
      required this.nama,
      required this.number,
      required this.date,
      required this.warna,
      required this.file});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'number': number.toString(),
      // 'date': date.toString(),
      // 'warna': warna.value.toString(),
      // 'file': file.toString(),
    };
  }

  AddContactList.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    nama = map['nama'];
    number = map['number'].tp;
    // date = map['date'];
    // warna = Color(map['warna']);
    // file = map['file'];
  }
}
