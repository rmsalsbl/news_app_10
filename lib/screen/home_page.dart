import 'package:flutter/material.dart';
import 'package:news_app_10/model/articles.dart';
import 'package:news_app_10/screen/news_page.dart';
import 'package:news_app_10/service/data_service.dart';
import 'package:news_app_10/utils/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    News news = News();
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: const DecorationImage(
              image:  NetworkImage(
                  'https://cdn.dribbble.com/users/8946727/avatars/normal/data?1629875213'
              )
            )
          ),
          width: 10,
          margin: EdgeInsets.all(5),
        ),
        title: Text('Good Morning dunia tipu2', style: titleArticle.copyWith(
          fontSize: 20
        ),),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.bookmark, color: Colors.blueAccent,)
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: news.getNews(),
        builder: (context, snapshot) => snapshot.data != null
        ? NewsPage(snapshot.data as List<Article>)
                : const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
