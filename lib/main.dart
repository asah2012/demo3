import 'package:demo3/screens/add_item.dart';
import 'package:flutter/material.dart';
import 'data/categories_data.dart';
import 'model/grocery.dart';
import 'screens/homepage.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({super.key});


  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo3',
      theme: ThemeData(
       // brightness: Brightness.dark,
      //scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: "Raleway",
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 14,
            fontWeight: FontWeight.normal,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 12,
            fontWeight: FontWeight.normal
          ),
          
        ),
        useMaterial3: true,
      ),
      //home: MyHomePage(title: 'Your Grocery', gcList : gcList , testList: testList,),
      home: MyHomePage(title: 'Your Grocery',),
      routes: {
        AddItem.routeName:(ctx) => AddItem(),
      },
    );
  }
}
