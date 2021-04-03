import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../core/extensions/service/service_extension.dart';
import '../model/home_page_model.dart';
import '../service/home_page_service.dart';
import '../view/home_page.dart';

abstract class HomePageViewModel extends State<HomePage> {
  List<HomePageModel> homePageList = [];

  HomePageService? homePageService;
  @override
  void initState() {
    super.initState();
    homePageService = HomePageService(
      fetchService: Dio(BaseOptions(baseUrl: ServiceURLPath.BASEURL.value)),
      postService: Dio(BaseOptions(baseUrl: ServiceURLPath.LOCALURL.value)),
    );
    fetchHomePageData();
  }

  Future<void> fetchHomePageData() async {
    homePageList = await homePageService!.getHomePageModelData();
    setState(() {});
  }

  Future postHomePageData(int index) async {
    return await homePageService!.postHomePageModelData(
      HomePageModel(
        name: homePageList[index].name,
        username: homePageList[index].username,
        address: homePageList[index].address,
        company: homePageList[index].company,
        email: homePageList[index].email,
        phone: homePageList[index].phone,
        website: homePageList[index].website,
      ),
    );
  }
}
