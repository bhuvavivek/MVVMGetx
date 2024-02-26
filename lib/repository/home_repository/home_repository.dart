import 'package:flutter/foundation.dart';
import 'package:mvvmwithget/data/network/network_api_services.dart';
import 'package:mvvmwithget/models/home/home_model.dart';
import 'package:mvvmwithget/res/app_url/app_url.dart';

class HomeRepository {
  final _apiService = NetworkApiServices();

  Future<HomeModel> getHomeData() async {
    try {
      var response = await _apiService.get(AppUrl.homeurl);
      if (kDebugMode) {
        print(response);
      }
      return HomeModel.fromJson(response);
    } catch (e) {
      // ignore: use_rethrow_when_possible
      throw e;
    }
  }
}
