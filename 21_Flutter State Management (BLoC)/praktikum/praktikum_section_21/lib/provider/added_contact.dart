import 'package:flutter/material.dart';
import 'package:praktikum_section_21/model/add_contact_list.dart';

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

  void update(int index, String nama, int number) {
    _contacts[index].nama = nama;
    _contacts[index].number = number;
    notifyListeners();
  }

  void edit(int indexTerpilih, index) {
    indexTerpilih = index;
    notifyListeners();
  }
}
