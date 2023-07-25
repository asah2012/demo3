import 'package:flutter/material.dart';
import 'add_item.dart';

import '../data/dummy_data.dart';
import '../model/categories.dart';
import '../model/grocery.dart';

class MyHomePage extends StatefulWidget {
  final String title;
  static String routeName = '/home_page';
  
  //  MyHomePage ({required this.title , required this.gcList , required this.testList});
    MyHomePage ({required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void navigateToAddItem(){
    print("navigateToAddItem");
    Navigator.pushNamed(
      context, AddItem.routeName);
  }

  @override
  Widget build(BuildContext context) {
    List<GroceryItem> gcList = groceryItemList;
    return Scaffold(
      appBar: AppBar(title: Text(widget.title , style: Theme.of(context).textTheme.titleLarge,),
      actions: [IconButton(onPressed:(){
        print("Button Pressed");
        navigateToAddItem();
        } , icon: const Icon(Icons.add))]),
      body: Container(
         margin: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: gcList.length,
          itemBuilder: (ctx,index){
              GroceryItem? groceryItem = gcList[index];
              //GroceryItem(id: 'X', name: "No Name", quantity: 0, category: new Category('Default', Color.fromARGB(0,0,0,0)))
              Category? categoryObject = groceryItem.category;
              return ListTile(leading: Container(
                height:  25,
                width: 25,
                color: categoryObject?.categoryColor,
              ),title: Text(groceryItem.name??'No Name'), trailing: Text((groceryItem.quantity??0).toString()),);
              //const Padding(padding: EdgeInsets.only(bottom: 10),);
          })
      ),
    );
  }
}