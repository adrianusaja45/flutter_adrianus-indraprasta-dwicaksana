import 'package:flutter/material.dart';
import 'package:praktikum_section_23/model/add_contact_list.dart';

class Contact with ChangeNotifier {
  final List<AddContactList> _contacts = [];
  List<AddContactList> get contacts => _contacts;

  void add(AddContactList contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void remove(int index) {
    _contacts.removeAt(index);
    notifyListeners();
  }

  void update(AddContactList contact, String nama, int number) {
    contact.nama = nama;
    contact.number = number;
    notifyListeners();
  }

  void edit(int indexTerpilih, index) {
    indexTerpilih = index;
    notifyListeners();
  }
}
