import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/MainScreenProvider.dart';

class _Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 30,
          ),
          Consumer<CartApiProvider>(
            builder: (context, provider, child) {
              return Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(provider.cart.toString()));
            },
          )
        ],
      ),
    );
  }
}
