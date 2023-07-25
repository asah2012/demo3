import 'package:demo3/model/categories.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../data/categories_data.dart';
import '../model/categories.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});
  static String routeName = '/addItem';

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {

  final _formKey = GlobalKey<FormState>();
  void _saveItem(){
    print("Save Item called");
    _formKey.currentState!.validate();
  }
  var _selectedValue;
  String selectedCategoryName = "No Category";
  @override
  Widget build(BuildContext context) {
    //String _selectedValue;

    //List<String> _categoryList = ['veg','dairy','grocery'];

    //List<Map<String,Object>> _ddList = [];
    // for(var category in categories_list.entries){
    //   Map<String,Object> tempMap = {category.value.categoryName :Text(category.value.categoryName)};
    //   _ddList.add(tempMap);
    // }

    List<DropdownMenuItem<Object>> ddList = [];
    for (var category in categories_list.entries) {
      ddList.add(DropdownMenuItem(
        value: category.value,
        child: Container(
          width: 150,
          child: Expanded(
            child: Row(
              children: [
                Container(
                  height: 10,
                  width: 10,
                  color: category.value.categoryColor,
                ),
                const SizedBox(
                  width: 6,
                ),
                SizedBox(
                  width : 100,
                  child: Text(category.value.categoryName)),
              ],
            ),
          ),
        ),
      ));
    }

    return Scaffold(
        appBar: AppBar(title: const Text("Add Item")),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(label: Text("Item Name")),
                  maxLength: 50,
                  validator: (value) {
                    if(value == null || value.isEmpty || value.trim().length <= 1 || value.trim().length>50){
                      return "Enter a text of 2 to 50 characters";
                    }
                    return null;
                  },
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start, 
                children: [
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text("Quantity"),
                      ),
                      keyboardType: TextInputType.number,
                      initialValue: '1',
                      validator: (value){
                        if(value == null || value.isEmpty || int.tryParse(value) == null || int.tryParse(value)! < 1){
                        return "Enter a valid quantity";
                        }
                        return null;

                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  ),
                  SizedBox(
                    width: 200,
                    child: DropdownButtonFormField(items: ddList, 
                          onChanged: (value) {
                                      setState(() {
                                        _selectedValue = value;
                                        selectedCategoryName = (value as Category).categoryName;
                                      });
                                    },
                    ),
                  ),
                ]),
                SizedBox(height: 30,),
                TextFormField(
                  controller: TextEditingController(text: (selectedCategoryName)),
                  readOnly: true,
                  decoration: const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: (){}, child: const Text("Reset")),
                    ElevatedButton(onPressed: (){
                      print("Save button pressed");
                      _saveItem();
                    }, child: const Text("Add")),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
