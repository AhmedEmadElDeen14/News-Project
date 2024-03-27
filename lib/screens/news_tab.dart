import 'package:flutter/material.dart';
import 'package:news_c10_str/models/source_response.dart';
import 'package:news_c10_str/screens/article_details.dart';
import 'package:news_c10_str/screens/news_item.dart';
import 'package:news_c10_str/screens/source_item.dart';
import 'package:news_c10_str/shared/network/remote/api_manager.dart';

class NewsTab extends StatefulWidget {
  List<Sources> sources;
  Function? onSearch;
  String? searchText;

  NewsTab({super.key, required this.sources, this.onSearch, this.searchText});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sources.length,
            child: TabBar(
              dividerColor: Colors.transparent,
              isScrollable: true,
              onTap: (value) {
                setState(() {});
                selectedIndex = value;
              },
              indicatorColor: Colors.transparent,
              tabs: widget.sources
                  .map((e) => Tab(
                        child: SourceItem(
                          source: e,
                          isSelected:
                              widget.sources.elementAt(selectedIndex) == e,
                        ),
                      ))
                  .toList(),
            )),
        widget.searchText == null || widget.searchText == ""
            ? FutureBuilder(
                future: ApiManager.getNewsData(
                    widget.sources[selectedIndex].id ?? ""),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.green,
                    ));
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Something went wrong"));
                  }

                  var articlesList = snapshot.data?.articles ?? [];

                  if (articlesList.isEmpty) {
                    return Center(child: Text("No Sources"));
                  }
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 12,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ArticleDetails(
                                    article: articlesList[index],
                                  ),
                                ),
                              );
                            },
                            child: NewsItem(
                              article: articlesList[index],
                            ),
                          ),
                        );
                      },
                      itemCount: articlesList.length,
                    ),
                  );
                },
              )
            : FutureBuilder(
                future: ApiManager.getSearchNewsData(
                    widget.sources[selectedIndex].id ?? "",
                    widget.searchText ?? ""),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: Colors.green,
                    ));
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("Something went wrong"));
                  }

                  var articlesList = snapshot.data?.articles ?? [];

                  if (articlesList.isEmpty) {
                    return Center(
                        child: Text(
                      "No Articles about \"${widget.searchText}\"\n in ${widget.sources[selectedIndex].name}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ));
                  }
                  return Expanded(
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        height: 12,
                      ),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ArticleDetails(
                                    article: articlesList[index],
                                  ),
                                ),
                              );
                            },
                            child: NewsItem(
                              article: articlesList[index],
                            ),
                          ),
                        );
                      },
                      itemCount: articlesList.length,
                    ),
                  );
                },
              )
      ],
    );
  }
}
