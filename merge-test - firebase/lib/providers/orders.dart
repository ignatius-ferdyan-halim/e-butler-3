import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '/Services/database.dart';

import 'cart.dart';
import '/Model/user.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;
  bool status;

  OrderItem(
      {@required this.id,
      @required this.amount,
      @required this.products,
      @required this.dateTime,
      this.status});
}

class Orders with ChangeNotifier {
  final List<OrderItem> _orders = [];
  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    // final user = User();
    _orders.insert(
      0,
      OrderItem(
          id: DateTime.now().toString(),
          amount: total,
          products: cartProducts,
          dateTime: DateTime.now(),
          status: true),
    );
    // DatabaseService(uid: user.uid).updateUserData(
    //   DateTime.now().toString(),
    //   total,
    //   cartProducts,
    //   DateTime.now(),
    // );
    //kalo taro sini, nanti bakal bikin document baru tiap dia order dengan uid unik khusus order itu
    //jadi bisa bikin kayak history page bwt admin, bikin datany jadi ada data user dkk
    notifyListeners();
  }
}
