
import '../model/grocery.dart';
import 'categories_data.dart';

final groceryItemList = [
  GroceryItem(
      id: 'a',
      name: 'Milk',
      quantity: 1,
      category: categories_list[Categories.dairy]!),
  GroceryItem(
      id: 'b',
      name: 'Bananas',
      quantity: 5,
      category: categories_list[Categories.fruit]!),
  GroceryItem(
      id: 'c',
      name: 'Beef Steak',
      quantity: 1,
      category: categories_list[Categories.meat]!),
]; 