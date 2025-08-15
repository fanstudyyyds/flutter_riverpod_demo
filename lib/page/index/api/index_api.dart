// providers/api_provider.dart
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:untitled3/net/network_provider.dart';
import 'package:untitled3/page/index/modes/Index_mode.dart';

final userApiProvider = Provider<IndexApi>((ref) {
  final dio = ref.watch(dioProvider);
  return IndexApi(dio);
});

class IndexApi {
  final Dio _dio;

  IndexApi(this._dio);

  Future<IndexMode> getUser(int id) async {
    final response = await _dio.get('/m2/6951358-0-default/336424347');
    print(response.data['id']);
    return IndexMode("http://192.168.30.54:8080/assetImg/20250813-215746-62-21-223-22.jpg", "name", "addr", "date");
  }
}
