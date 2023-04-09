import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:praktikum_prio2_section_25/models/avatar.dart';

class ApiAvatar {
  static const String baseUrl = 'https://api.dicebear.com/6.x/pixel-art/svg';
  // static String fileName = 'pixelArt.svg';
  // static const String fileType = 'png';

  static Future<Avatar> getAvatar() async {
    final response = await Dio().getUri(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      return Avatar.fromJson(jsonDecode(response.data));
    } else {
      throw Exception('Failed to load avatar');
    }
  }
}
