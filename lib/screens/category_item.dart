import 'package:flutter/material.dart';
import 'package:news_c10_str/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel model;
  int index;

  CategoryItem({required this.model, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: model.color,
          borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(28),
              topRight: const Radius.circular(28),
              bottomLeft: index.isOdd ? const Radius.circular(28) : Radius.zero,
              bottomRight: index.isEven ? const Radius.circular(28) : Radius.zero)),
      child: Column(
        children: [
          Expanded(child: Image.asset(model.image)),
          Container(
            margin: const EdgeInsets.only(bottom: 18),
            child: Text(
              model.name,
              style: const TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
        ],
      ),
    );
  }
}
