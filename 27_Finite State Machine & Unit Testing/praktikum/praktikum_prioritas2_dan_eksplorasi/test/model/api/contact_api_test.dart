import 'package:dio/dio.dart';
import 'package:praktikum_prioritas2_dan_eksplorasi/apis/api_contact.dart';
import 'package:test/test.dart';

void main() {
  test('get all contact must return data', () async {
    var contact = await ApiContact.getContact();
    expect(contact.isNotEmpty, true);
  });

  test('post contact must return code 201', () async {
    final dio = Dio();

    final data = {'name': 'Handi', 'phone': '08123456789'};
    final response = await dio.post(
      ApiContact.baseUrl + ApiContact.path,
      data: data,
    );
    expect(response.statusCode, 201);
  });
}
