import 'package:flutter/material.dart';
import 'package:news_app/api_services/api_service.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/views/news_item.dart';

class TopNews extends StatefulWidget {
  const TopNews({super.key});

  @override
  State<TopNews> createState() => _TopNewsState();
}

class _TopNewsState extends State<TopNews> {
  APIservices apiServices = APIservices();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: apiServices.top_news(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<NewsModel> articleList = snapshot.data ??[]; // snapshot.data thakle data jabe otherwiese empty list dhukbe
          return ListView.builder(
            itemBuilder: (context, index) {
              // now for design create a new dart file
              return NewsItem(newsModel: articleList[index]);
            },
            itemCount: articleList.length,
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    ));
  }
}
