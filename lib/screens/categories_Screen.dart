import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widget/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: Dummy_Category.map(
        (catData) => CategoryItem(
          catData.id,
          catData.title,
          catData.color,
        ),
      ).toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3/2,
        crossAxisSpacing: 25,
        mainAxisSpacing: 25,

      ),
    );
  }
}
