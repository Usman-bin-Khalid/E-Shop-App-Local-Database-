import 'dart:convert';
import 'package:newzler/model/user_profile_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model_class_product.dart';

class CartManager {
  static final CartManager _instance = CartManager._internal();

  factory CartManager() => _instance;

  CartManager._internal();

  final List<ProductModelClass> _cartItems = [];
  final Map<ProductModelClass, int> _itemQuantities = {};

  List<ProductModelClass> get cartItems => _cartItems;

  Map<ProductModelClass, int> get itemQuantities => _itemQuantities;

  void addItem(ProductModelClass product) {
    if (!_cartItems.contains(product)) {
      _cartItems.add(product);
      _itemQuantities[product] = 1; // Default quantity is 1 when added
      saveCartToLocalStorage(); // Save changes
    } else {
      print('Item already in the cart');
    }
  }

  void removeItem(ProductModelClass product) {
    _cartItems.remove(product);
    _itemQuantities.remove(product);
    saveCartToLocalStorage();
  }

  void updateQuantity(ProductModelClass product, int quantity) {
    if (_cartItems.contains(product)) {
      _itemQuantities[product] = quantity;
      saveCartToLocalStorage();
    }
  }

  int getQuantity(ProductModelClass product) {
    return _itemQuantities[product] ?? 1;
  }

  // Future<void> saveCartToLocalStorage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   // Save cart items
  //   List<String> cartItemsJson =
  //   _cartItems.map((item) => jsonEncode(item.toJson())).toList();
  //   prefs.setStringList('cart_items', cartItemsJson);
  //   // Save quantities
  //   Map<String, int> quantitiesJson = _itemQuantities.map((key, value) =>
  //       MapEntry(jsonEncode(key.toJson()), value));
  //   prefs.setString('item_quantities', jsonEncode(quantitiesJson));
  // }


  Future<void> saveCartToLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // Save cart items and quantities together
    List<Map<String, dynamic>> cartData = _cartItems.map((product) {
      return {
        'product': product.toJson(),
        'quantity': _itemQuantities[product] ?? 1,
      };
    }).toList();

    prefs.setString('cart_data', jsonEncode(cartData));
  }

  // Future<void> loadCartFromLocalStorage() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   // Load cart items
  //   List<String>? cartItemsJson = prefs.getStringList('cart_items');
  //   if (cartItemsJson != null) {
  //     _cartItems.clear();
  //     _cartItems.addAll(cartItemsJson
  //         .map((item) => ProductModelClass.fromJson(jsonDecode(item))));
  //   }
  //
  //   // Load quantities
  //   String? quantitiesJson = prefs.getString('item_quantities');
  //   if (quantitiesJson != null) {
  //     Map<String, dynamic> quantitiesMap = jsonDecode(quantitiesJson);
  //     _itemQuantities.clear();
  //     quantitiesMap.forEach((key, value) {
  //       ProductModelClass product =
  //       ProductModelClass.fromJson(jsonDecode(key));
  //       _itemQuantities[product] = value;
  //     });
  //   }
  // }

  Future<void> loadCartFromLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? cartDataJson = prefs.getString('cart_data');
    if (cartDataJson != null) {
      List<dynamic> cartData = jsonDecode(cartDataJson);

      _cartItems.clear();
      _itemQuantities.clear();

      for (var item in cartData) {
        ProductModelClass product =
        ProductModelClass.fromJson(item['product']);
        int quantity = item['quantity'];
        _cartItems.add(product);
        _itemQuantities[product] = quantity;
      }
    }
  }

  Future<void> clearCart() async {
    // Clear data in memory
    _cartItems.clear();
    _itemQuantities.clear();

    // Clear data in local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('cart_items');
    await prefs.remove('item_quantities');
  }

  Future<bool> isEmailUnique(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? emails = prefs.getStringList('registered_emails') ?? [];
    return !emails.contains(email);
  }

  Future<void> registerEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? emails = prefs.getStringList('registered_emails') ?? [];
    emails.add(email); // Add new email
    await prefs.setStringList('registered_emails', emails);
  }


}



