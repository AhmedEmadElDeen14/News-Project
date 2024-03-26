import 'package:flutter/material.dart';
import 'package:news_c10_str/models/category_model.dart';
import 'package:news_c10_str/screens/category_tab.dart';
import 'package:news_c10_str/screens/data_tab.dart';
import 'package:news_c10_str/screens/news_tab.dart';
import 'package:news_c10_str/screens/side_menu.dart';
import 'package:news_c10_str/shared/network/remote/api_manager.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearch = false;
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: SideMenu(),
        appBar: selectedCategory != null
            ? isSearch
                ? AppBar(
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
                    title: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Search Article",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(57, 165, 82, 200),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          prefixIcon: InkWell(
                            onTap: () {
                              isSearch = false;
                              setState(() {});
                            },
                            child: Icon(
                              Icons.close,
                              color: Color(0xff39A552),
                            ),
                          ),
                          suffixIcon: InkWell(
                            child: Icon(
                              Icons.search,
                              color: Color(0xff39A552),
                            ),
                          ),
                          border:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  )
                : AppBar(
                    iconTheme: IconThemeData(color: Colors.white),
                    backgroundColor: Colors.green,
                    centerTitle: true,
                    shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    title: Text(
                      "News",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    actions: [
                      InkWell(
                        onTap: () {
                          isSearch = true;
                          setState(() {});
                        },
                        child: Container(
                          child: Icon(
                            Icons.search,
                            size: 25,
                          ),
                          padding: EdgeInsets.all(15),
                        ),
                      )
                    ],
                  )
            : AppBar(
                iconTheme: IconThemeData(color: Colors.white),
                backgroundColor: Colors.green,
                centerTitle: true,
                shape: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                title: Text(
                  "News",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
        body: selectedCategory == null
            ? CategoryTab(onClick: onCategoryClicked)
            : DataTab(
                categoryId: selectedCategory!.id,
              ),
      ),
    );
  }

  CategoryModel? selectedCategory;

  onCategoryClicked(category) {
    selectedCategory = category;
    setState(() {});
  }

  late String searchText;

  search(searchController){

    searchText = searchController;


  }

}
