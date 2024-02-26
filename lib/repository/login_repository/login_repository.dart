import 'package:flutter/foundation.dart';
import 'package:mvvmwithget/data/network/network_api_services.dart';

import '../../res/app_url/app_url.dart';

class LoginRepositroy {
  final _apiService = NetworkApiServices();

  Future<dynamic> login(var data) async {
    try {
      final response = await _apiService.post(AppUrl.loginUrl, data);
      if (kDebugMode) {
        print(response);
      }
      return response;
    } catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}
