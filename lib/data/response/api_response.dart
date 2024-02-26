// ignore_for_file: unnecessary_overrides

import 'package:mvvmwithget/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.Loadig;
  ApiResponse.completed(this.data) : status = Status.Completed;
  ApiResponse.error(this.message) : status = Status.Error;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}
