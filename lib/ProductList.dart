import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/MainScreenProvider.dart';

class _ProductsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Provider.of<CartApiProvider>(context, listen: false)
                .addToCart(1);
          },
          child: Container(
            height: 70,
            margin: EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Text('ITEM $index'),
          ),
        );
      },
    );
  }
}
