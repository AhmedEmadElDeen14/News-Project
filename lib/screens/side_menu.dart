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
            color: const Color(0xff39A552),
            height: MediaQuery
                .of(context)
                .size
                .height * .18,
            child: const Center(
              child: Text("News App!", style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w700
              ),),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        HomeScreen.routeName, (route) => false);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.view_list_sharp),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text("Categories", style: TextStyle(
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
                    margin: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.settings),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: const Text("Settings", style: TextStyle(
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
