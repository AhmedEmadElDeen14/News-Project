import 'package:flutter/material.dart';
import 'package:news_c10_str/screens/news_tab.dart';
import 'package:news_c10_str/shared/network/remote/api_manager.dart';

class DataTab extends StatefulWidget {
  String categoryId;
  Function? onSearch;
  String? searchText;

  DataTab({required this.categoryId,this.onSearch,this.searchText, super.key});

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
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text("Something went wrong"));
        }

        var sourcesList = snapshot.data?.sources ?? [];
        if (sourcesList.isEmpty) {
          return Center(child: Text("No SOurces"));
        }
        return widget.onSearch == null?
          NewsTab(
          sources: sourcesList,
        ):
        NewsTab(sources: sourcesList, onSearch: widget.onSearch,searchText: widget.searchText,);
      },
    );
  }
}
