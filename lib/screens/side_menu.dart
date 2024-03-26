import 'package:flutter/material.dart';
import 'package:news_c10_str/layout/home.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * .7,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Color(0xff39A552),
            height: MediaQuery
                .of(context)
                .size
                .height * .18,
            child: Center(
              child: Text("News App!", style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w700
              ),),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        HomeScreen.routeName, (route) => false);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.view_list_sharp),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text("Categories", style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w700
                          ),),
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.settings),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text("Settings", style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w700
                          ),),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
