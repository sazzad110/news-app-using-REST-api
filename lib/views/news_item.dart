import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:news_app/views/details_news.dart';

class NewsItem extends StatelessWidget {
  NewsModel newsModel; // to receive data
  NewsItem({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsNews(newsModel: newsModel)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          CachedNetworkImage(
            height: 200,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            imageUrl: newsModel.urlToImage.toString(),
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.deepPurple,
                ),
                child: Text(
                  newsModel.source!.name.toString(),
                  style: TextStyle(fontSize: 18, color: Colors.amber),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(newsModel.publishedAt.toString()),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            newsModel.author == null
                ? ""
                : "Author : " + newsModel.author.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            newsModel.title.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ]),
      ),
    );
  }
}
