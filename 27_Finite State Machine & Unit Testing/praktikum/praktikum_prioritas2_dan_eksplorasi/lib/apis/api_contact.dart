import 'dart:convert';

import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

import '../models/contact.dart';

class ApiContact {
  static const String baseUrl = 'https://my-json-server.typicode.com';
  static const String path = '/hadihammurabi/flutter-webservice/contacts';
  static const int id = 2;

  static Future<List<Contact>> getContact() async {
    final response = await Dio().get('$baseUrl$path');
    if (response.statusCode == 200) {
      final List<dynamic> body = response.data;
      final List<Contact> contacts =
          body.map((e) => Contact.fromJson(e)).toList();
      return contacts;
    } else {
      throw ('Gagal mendapatkan data');
    }
  }

  static Future<Contact> postContact(Contact contact) async {
    final response = await Dio().post('$baseUrl$path', data: contact.toJson());
    if (response.statusCode == 200) {
      return Contact.fromJson(response.data);
    } else {
      throw ('Gagal menambahkan data');
    }
  }

  static Future<Contact> getJSONContact() async {
    final response = await http.get(Uri.parse('$baseUrl$path/$id'));

    if (response.statusCode == 200) {
      final dynamic dataMap = jsonDecode(response.body);
      final Contact kontak = Contact.fromJson(dataMap);
      return kontak;
    } else {
      throw ('Gagal mendapatkan data');
    }
  }
}
