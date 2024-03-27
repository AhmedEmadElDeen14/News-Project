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
    final Uri url = Uri.parse(article.url.toString());

    DateTime publishedDate = DateTime.parse(article.publishedAt??"");
    Duration timeDifference = DateTime.now().difference(publishedDate);

    String formattedTime;

    if (timeDifference.inHours < 24) {
      formattedTime = "${timeDifference.inHours} hour${timeDifference.inHours > 1 ? 's' : ''} ago";
    } else {
      formattedTime = publishedDate.toString().split(' ').first;
    }

    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: const SideMenu(),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.green,
          centerTitle: true,
          shape: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          leading: const SizedBox(),
          title: const Text(
            "News Details",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(25),
          child: ListView(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? "",
                  height: 250,
                  fit: BoxFit.fill,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  article.source!.name ?? "",
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, color: Color(0xff79828B)),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  article.title ?? "",
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  formattedTime,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff79828B),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topRight,
                child: Text(
                  article.content ?? "",
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xff42505C),
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  launchUrl(url);
                },
                child: const Row(
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
