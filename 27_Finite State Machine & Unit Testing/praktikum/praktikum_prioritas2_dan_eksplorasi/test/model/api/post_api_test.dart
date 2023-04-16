import 'package:dio/dio.dart';
import 'package:praktikum_prioritas2_dan_eksplorasi/apis/api_post.dart';
import 'package:test/test.dart';

void main() {
  test('update post must return code 200', () async {
    final dio = Dio();

    final data = {'title': 'foo', 'body': 'bar', 'userId': 1};
    final response = await dio.put(
      '${ApiPost.baseUrl}${ApiPost.path}/${ApiPost.id}',
      data: data,
    );
    expect(response.statusCode, 200);
  });
}
