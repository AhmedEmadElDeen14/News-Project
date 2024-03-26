import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_c10_str/models/NewsResponse.dart';
import 'package:news_c10_str/screens/side_menu.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleDetails extends StatelessWidget {
  Articles article;

  ArticleDetails({required this.article, super.key});

  @override
  Widget build(BuildContext context) {
    final Uri _url = Uri.parse(article.url.toString());

    Future<void> _launchUrl() async {
      launchUrl(_url);
      if (!await launchUrl(_url)) {
        throw Exception('Could not launch $_url');
      }
    }

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: SideMenu(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.green,
          centerTitle: true,
          shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          leading: SizedBox(),
          title: Text(
            "News Details",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(25),
          child: ListView(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? "",
                  height: 250,
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  article.source!.name ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.w400, color: Color(0xff79828B)),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  article.title ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  article.publishedAt ?? "",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff79828B),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  article.content ?? "",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xff42505C),
                      fontSize: 18),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  launchUrl(_url);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("View Full Article"),
                    Icon(Icons.arrow_right)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
