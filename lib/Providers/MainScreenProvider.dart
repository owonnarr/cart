import 'package:flutter/cupertino.dart';
import '../Models/Api.dart';

class CartApiProvider extends ChangeNotifier {
  final _api = Api();
  var cart = 0;

  void addToCart(int count) {
    var result = _api.sendCartData(count);
    if (result) {
      cart += count;

      notifyListeners();
    } else {
//some code
//notifyListeners();
    }
  }
}
