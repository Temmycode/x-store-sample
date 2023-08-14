// a state notifier to keep track of the like items
// the class is of the type of the products itself
// the mock is only to provider functionality
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LikeNotifier extends StateNotifier<List> {
  // the data should be stored and accessed from shared preferences
  LikeNotifier() : super([]);

  // this function will be modified in the final product
  // the product model should have a product id
  void likeProduct(String productName) {
    if (state.any((element) => element == productName)) {
      state = [
        for (final product in state)
          if (product != productName) product
      ];
    } else {
      state = [...state, productName];
    }
  }
}
