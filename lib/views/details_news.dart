import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsNews extends StatefulWidget {
  final NewsModel newsModel;
  const DetailsNews({super.key, required this.newsModel});

  @override
  State<DetailsNews> createState() => _DetailsNewsState();
}

class _DetailsNewsState extends State<DetailsNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.newsModel.title.toString(),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CachedNetworkImage(
              height: 200,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              imageUrl: widget.newsModel.urlToImage.toString(),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
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
                    widget.newsModel.source!.name.toString(),
                    style: TextStyle(fontSize: 18, color: Colors.amber),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(widget.newsModel.publishedAt.toString()),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.newsModel.author == null
                  ? ""
                  : "Author : " + widget.newsModel.author.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              widget.newsModel.title.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              widget.newsModel.description.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            ElevatedButton(
                onPressed: () async {
                  final Uri uri = Uri.parse(widget.newsModel.url.toString());

                  if (!await launchUrl(uri)) {
                    throw Exception('Could not launch $uri');
                  }
                },
                child: Text("Read More...",style: TextStyle(color: Colors.red),))
          ],
        ),
      ),
    );
  }
}
