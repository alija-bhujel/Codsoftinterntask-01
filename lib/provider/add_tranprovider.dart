import 'package:flutter/foundation.dart';

class TransactionProvider with ChangeNotifier {
  String? selectedItem;

  void updateSelectedItem(String newItem) {
    selectedItem = newItem;
    notifyListeners();
  }
}
