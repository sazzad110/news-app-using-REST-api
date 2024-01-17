import 'dart:convert';

import 'package:http/http.dart';
import 'package:news_app/models/news_model.dart';

class APIservices{

  final all_news_api_url = 'https://newsapi.org/v2/everything?q=bitcoin&apiKey=7202a30872de4e15aaabc2029c07441f';
  final top_news_api_url = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=7202a30872de4e15aaabc2029c07441f';

  // this func will be future type and return NewsModel type list for all types of news
  Future<List<NewsModel>> all_news() async {
    try{

      Response response = await get(Uri.parse(all_news_api_url));
      if(response.statusCode == 200) {

        Map<String,dynamic> json = jsonDecode(response.body);   // key of map is string and value will be dynamic. and decode json
        List<dynamic> body = json['articles'];                  // we need article key's value

        List<NewsModel> articleList = body.map((news) => NewsModel.fromJson(news)).toList();
        return articleList;

      } else {

        throw ("News not found");
      }

    }
    catch(e) {
      throw e;
    }
  }

  // this func will be future type and return NewsModel type list for top news
  Future<List<NewsModel>> top_news() async {
    try{

      Response response = await get(Uri.parse(top_news_api_url));
      if(response.statusCode == 200) {

        Map<String,dynamic> json = jsonDecode(response.body);   // key of map is string and value will be dynamic. and decode json
        List<dynamic> body = json['articles'];                  // we need article key's value

        List<NewsModel> articleList = body.map((news) => NewsModel.fromJson(news)).toList();
        return articleList;

      } else {

        throw ("News not found");
      }

    }
    catch(e) {
      throw e;
    }
  }



}