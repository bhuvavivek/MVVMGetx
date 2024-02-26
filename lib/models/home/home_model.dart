// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomeModel {
  int page;
  int perPage;
  int total;
  int totalPages;
  List<Data> data;
  Support support;

  HomeModel(
      {required this.page,
      required this.perPage,
      required this.total,
      required this.totalPages,
      required this.data,
      required this.support});

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      data: (json['data'] as List<dynamic>)
          .map((item) => Data.fromJson(item as Map<String, dynamic>))
          .toList(),
      support: Support.fromJson(json['support'] as Map<String, dynamic>),
    );
  }
}

class Data {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  Data({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'],
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        avatar: json['avatar']);
  }
}

class Support {
  String url;
  String text;
  Support({
    required this.url,
    required this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(url: json['url'], text: json['text']);
  }
}
