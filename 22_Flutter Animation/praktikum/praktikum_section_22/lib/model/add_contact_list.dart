import 'dart:io';
import 'dart:ui';

class AddContactList {
  String id;
  String nama;
  int? number;
  DateTime? date;
  Color warna;
  File? file;
  AddContactList(
      {required this.id,
      required this.nama,
      required this.number,
      required this.date,
      required this.warna,
      required this.file});
}
