import 'package:get/get.dart';
import 'package:mvvmwithget/data/response/status.dart';
import 'package:mvvmwithget/repository/home_repository/home_repository.dart';

import '../../../models/home/home_model.dart';
import '../../../utils/utils.dart';

class HomeController extends GetxController {
  final homeRepo = HomeRepository();
  Rx<HomeModel> homeData = HomeModel(
          page: 0,
          perPage: 0,
          total: 0,
          totalPages: 0,
          data: [],
          support: Support(url: '', text: ''))
      .obs;

  Rx<Status> status = Status.Loadig.obs;

  RxString error = ''.obs;

  setrxhomeData(HomeModel value) => homeData.value = value;
  setrxStatus(Status value) => status.value = value;

  void setError(String value) => error.value = value;

  void getHomeData() async {
    try {
      var data = await homeRepo.getHomeData();
      setrxStatus(Status.Completed);
      setrxhomeData(data);
    } catch (error) {
      setError(error.toString());
      setrxStatus(Status.Error);

      Utils.snackBar('Error', error.toString());
    }
  }
}
