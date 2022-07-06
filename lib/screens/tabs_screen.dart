import 'package:flutter/material.dart';
import 'package:funny1/models/meal_data.dart';
import '../widget/main_drawer.dart';
import '../screens/categories_Screen.dart';
import 'favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
   List<Map<String, Object>> _page;
  int _selectedPageIndex=0;
  void _slectedPage(int index){
    setState(() {
      _selectedPageIndex=index;
    });

  }
  initState(){
    _page = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Your Favorites'}
    ];

    super.initState();
  }

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text( _page[_selectedPageIndex]['title'],),

          ),
          drawer: MainDrawer(),
          body: _page[_selectedPageIndex]['page'],
          bottomNavigationBar: BottomNavigationBar(
          onTap: _slectedPage,
        backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).accentColor,
            currentIndex: _selectedPageIndex,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.category),title: Text('Categories'),),
              BottomNavigationBarItem(icon: Icon(Icons.star),title: Text('Favorites'),),
            ],
      ),
      ),
    );
  }
}
