import 'package:flutter/cupertino.dart';

class SearchedInventories extends ChangeNotifier {
  List<Inventory>? _searchedInventories;
  get searchedInventories => this._searchedInventories;

  set searchedInventories(value) =>
      {this._searchedInventories = value, notifyListeners()};
}

class Inventory {
  final String number;
  final int quantity;

  const Inventory({
    Key? key,
    required this.number,
    required this.quantity,
  });
}
