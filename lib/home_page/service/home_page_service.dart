import 'dart:io';

import 'package:dio/dio.dart';

import '../model/home_page_model.dart';

class HomePageService {
  final Dio fetchService;
  final Dio postService;

  HomePageService({
    required this.fetchService,
    required this.postService,
  });

  Future<List<HomePageModel>> getHomePageModelData() async {
    final response = await fetchService.get('/users');

    if (response.statusCode == HttpStatus.ok) {
      final data = response.data;

      if (data is List) {
        return data.map((e) => HomePageModel.fromJson(e)).toList();
      }
    }
    return [];
  }

  Future postHomePageModelData(HomePageModel model) async {
    final response = await postService.post(
      '/dummy_users',
      options: Options(headers: {'Content-type': 'application/json'}),
      data: {
        'name': model.name,
        'username': model.username,
        'email': model.email,
        'address': {
          'street': model.address!.street,
          'suite': model.address!.suite,
          'city': model.address!.city,
          'zipcode': model.address!.zipcode,
          'geo': {
            'lat': model.address!.geo!.lat,
            'lng': model.address!.geo!.lng
          }
        },
        'phone': model.phone,
        'website': model.website,
        'company': {
          'name': model.company!.name,
          'catchPhrase': model.company!.catchPhrase,
          'bs': model.company!.bs
        }
      },
    );

    if (response.statusCode == HttpStatus.created) {
      print(response.toString());
      print(response.data['id']);
      return response;
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }
}
