// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:flutter_application_2/data/data_recipes.dart' as dataRecipes; // Menggunakan alias 'dataRecipes'
import 'package:flutter_application_2/login_screen.dart';
import 'package:flutter_application_2/data/resep.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dataRecipes.resep> favorites = []; // Menggunakan 'dataRecipes.resep' karena menggunakan alias

  void toggleFavorite(dataRecipes.resep resep) { // Menggunakan 'dataRecipes.resep' karena menggunakan alias
    setState(() {
      if (favorites.contains(resep)) {
        favorites.remove(resep);
      } else {
        favorites.add(resep);
      }
    });
  }

  void _logOut() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Resep Makanan'),
        backgroundColor: Color(0xFFE17965),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Color(0xFFE17965),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Menu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Favorite'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FavoriteScreen(favorites: favorites)));
                  },
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log Out'),
              onTap: () {
                _logOut();
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: dataRecipes.dataResep.length, // Menggunakan 'dataRecipes.dataResep' karena menggunakan alias
        itemBuilder: (context, index) {
          final resep = dataRecipes.dataResep[index]; // Menggunakan 'dataRecipes.dataResep' karena menggunakan alias
          final isFavorite = favorites.contains(resep);

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    reseps: resep,
                  ),
                ),
              );
            },
            child: Card(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        resep.image,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(resep.name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Color(0xFFE17965))),
                      ClipOval(
                        child: Material(
                          color: Color(0xFFE17965),
                          child: InkWell(
                            splashColor: Colors.red,
                            child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Icon(
                                isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: Colors.white,
                              ),
                            ),
                            onTap: () {
                              toggleFavorite(resep);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class FavoriteScreen extends StatelessWidget {
  final List<dataRecipes.resep> favorites; // Menggunakan 'dataRecipes.resep' karena menggunakan alias

  const FavoriteScreen({Key? key, required this.favorites}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
        backgroundColor: Color(0xFFE17965),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final resep = favorites[index];

          return ListTile(
            title: Text(resep.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(reseps: resep),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
