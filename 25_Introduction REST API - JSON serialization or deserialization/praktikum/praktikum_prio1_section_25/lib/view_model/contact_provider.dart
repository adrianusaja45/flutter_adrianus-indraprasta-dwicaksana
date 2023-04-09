import 'package:flutter/material.dart';
import 'package:praktikum_section_25/apis/api_contact.dart';

import '../models/contact.dart';

enum RequestState { empty, loading, loaded, error }

class ContactProvider extends ChangeNotifier {
  RequestState _state = RequestState.empty;
  RequestState get state => _state;

  List<Contact> _contacts = [];
  List<Contact> get contacts => _contacts;

  List<Contact> _newContacts = [];
  List<Contact> get newContacts => _newContacts;

  Contact? _jsonContacts;
  Contact? get jsonContacts => _jsonContacts;

  String _message = '';
  String get message => _message;

  Future<void> fetchContacts() async {
    _state = RequestState.loading;
    notifyListeners();

    try {
      final result = await ApiContact.getContact();
      _contacts = result;
      _state = RequestState.loaded;
      notifyListeners();
    } catch (e) {
      _state = RequestState.error;
      _message = e.toString();
      notifyListeners();
    }
  }

  Future<void> addContact(Contact contact) async {
    try {
      final result = await ApiContact.postContact(contact);
      _newContacts.add(result);

      notifyListeners();
    } catch (e) {
      _message = e.toString();
      notifyListeners();
    }
  }

  Future<void> fetchJSONContact() async {
    _state = RequestState.loading;
    notifyListeners();

    try {
      final result = await ApiContact.getJSONContact();
      _jsonContacts = result;
      _state = RequestState.loaded;
      notifyListeners();
    } catch (e) {
      _state = RequestState.error;
      _message = e.toString();
      notifyListeners();
    }
  }
}
