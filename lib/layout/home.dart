import 'package:flutter/material.dart';
import 'package:news_c10_str/models/category_model.dart';
import 'package:news_c10_str/screens/category_tab.dart';
import 'package:news_c10_str/screens/data_tab.dart';
import 'package:news_c10_str/screens/side_menu.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSearch = false;
  var searchController = TextEditingController();
  String searchText="";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: const SideMenu(),
        appBar: selectedCategory != null
            ? isSearch
                ? AppBar(
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
                    automaticallyImplyLeading: false,
                    title: Container(
                      width: MediaQuery.of(context).size.width*.85,
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Search Article",
                          hintStyle: const TextStyle(
                              color: Color.fromRGBO(57, 165, 82, 200),
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          prefixIcon: InkWell(
                            onTap: () {
                              isSearch = false;
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.close,
                              color: Color(0xff39A552),
                            ),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              isSearch = false;
                              searchText=searchController.text;
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.search,
                              color: Color(0xff39A552),
                            ),
                          ),
                          border:
                              const UnderlineInputBorder(borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  )
                : AppBar(
                    iconTheme: const IconThemeData(color: Colors.white),
                    backgroundColor: Colors.green,
                    centerTitle: true,
                    shape: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    title: const Text(
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
                          padding: const EdgeInsets.all(15),
                          child:  const Icon(
                            Icons.search,
                            size: 25,
                          ),
                        ),
                      )
                    ],
                  )
            : AppBar(
                iconTheme: const IconThemeData(color: Colors.white),
                backgroundColor: Colors.green,
                centerTitle: true,
                shape: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                title: const Text(
                  "News",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),

        body: selectedCategory == null
            ? CategoryTab(onClick: onCategoryClicked)
            : DataTab(
                categoryId: selectedCategory!.id,
                searchText: searchText,
              ),
      ),
    );
  }

  CategoryModel? selectedCategory;

  onCategoryClicked(category) {
    selectedCategory = category;
    setState(() {});
  }



}
