import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Providers/MainScreenProvider.dart';

void main() {
  runApp(const MaterialApp(home: MainScreen()));
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CartApiProvider(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: EdgeInsets.all(8),
            child: Align(
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    _ProductsList(),
                    Align(
                      alignment: Alignment.topRight,
                      child: _Cart(),
                    )
                  ],
                )
            ),
          )
      ),
    );
  }
}

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

class _Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: const BoxDecoration(
          color: Colors.white54,
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
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
