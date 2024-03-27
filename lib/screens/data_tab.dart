import 'package:flutter/material.dart';
import 'package:news_c10_str/screens/news_tab.dart';
import 'package:news_c10_str/shared/network/remote/api_manager.dart';

class DataTab extends StatefulWidget {
  String categoryId;
  String? searchText;

  DataTab({required this.categoryId,this.searchText, super.key});

  @override
  State<DataTab> createState() => _DataTabState();
}

class _DataTabState extends State<DataTab> {



  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: ApiManager.getSources(widget.categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }

        var sourcesList = snapshot.data?.sources ?? [];
        if (sourcesList.isEmpty) {
          return const Center(child: Text("No Sources"));
        }
        return widget.searchText == null||widget.searchText==""?
          NewsTab(
          sources: sourcesList,
        ):
        NewsTab(sources: sourcesList,searchText: widget.searchText,);
      },
    );
  }
}
