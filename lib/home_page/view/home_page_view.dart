import 'package:flutter/material.dart';

import '../model/home_page_model.dart';
import '../viewmodel/home_page_view_model.dart';

part 'home_page_string.dart';

class HomePageView extends HomePageViewModel with _HomePageStringValues {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,
      body: buildListView,
    );
  }

  ListView get buildListView => ListView.builder(
        itemCount: homePageList.length,
        itemBuilder: (context, index) {
          final data = homePageList[index];
          return buildListTile(index, data);
        },
      );

  AppBar get buildAppBar => AppBar(title: Text(appBarTitle));

  ListTile buildListTile(int index, HomePageModel data) => ListTile(
        leading: Text(data.id.toString()),
        title: Text(data.name ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(data.email ?? ''),
            Text(data.company!.name ?? ''),
          ],
        ),
        trailing: MaterialButton(
          onPressed: () async {
            await postHomePageData(index);
          },
          child: Text(post),
        ),
      );
}
