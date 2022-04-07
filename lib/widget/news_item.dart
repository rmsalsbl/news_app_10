import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:news_app_10/model/articles.dart';
import 'package:news_app_10/screen/detail_page.dart';
import 'package:news_app_10/utils/utils.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsItem extends StatelessWidget {
  final Article article;
  NewsItem(this.article);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(article)));
      },
      child: Card(
        elevation: 5,
        color: Colors.white,
        margin: EdgeInsets.only(
            bottom: edgeDetail
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(article.urlToImage.toString(),
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
                child: Container(
                  width: 220,
                  child: Column(
                    children: [
                      Text(article.title.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: titleArticle.copyWith(
                            fontSize: 14
                        ),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          //untuk date
                          Row(
                            children: [
                              Icon(Icons.calendar_today_rounded, size: 12,),
                              SizedBox(width: 3,),
                              Container(
                                width: 80,
                                child: Text(timeUntil(DateTime.parse(article.publishedAt.toString())),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: authorDateArticle.copyWith(
                                      fontSize: 12
                                  ),),
                              )
                            ],
                          ),
                          //untuk author
                          Row(
                            children: [
                              Icon(Icons.person_sharp, size: 12,),
                              SizedBox(width: 3,),
                              Container(
                                width: 80,
                                child: Text(article.author.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: authorDateArticle.copyWith(
                                      fontSize: 12
                                  ),),
                              )
                            ],
                          ),

                        ],
                      )
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

    //buat func unutk konversi tanggalnay
String timeUntil(DateTime parse){
    return timeago.format(parse, allowFromNow: true, locale: 'en');
}
}

