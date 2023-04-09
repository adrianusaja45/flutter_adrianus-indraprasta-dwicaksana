import 'package:flutter/material.dart';
import 'package:praktikum_section_23/helper/database_helper.dart';
import 'package:praktikum_section_23/model/add_contact_list.dart';

class DbManager extends ChangeNotifier {
  List<AddContactList> _contactModel = [];
  late DatabaseHelper _databaseHelper;

  List<AddContactList> get contactModel => _contactModel;

  DbManager() {
    _databaseHelper = DatabaseHelper();
    _getAllContact();
  }

  void _getAllContact() async {
    _contactModel = await _databaseHelper.getContact();
    notifyListeners();
  }

  Future<void> addContact(AddContactList contact) async {
    await _databaseHelper.insertContact(contact);
    _getAllContact();
  }

  Future<AddContactList> getContactById(int id) async {
    return await _databaseHelper.getContactById(id);
  }

  void updateContact(AddContactList contact) async {
    await _databaseHelper.updateContact(contact);
    _getAllContact();
  }

  void deleteContact(int id) async {
    await _databaseHelper.deleteContact(id);
    _getAllContact();
  }
}
