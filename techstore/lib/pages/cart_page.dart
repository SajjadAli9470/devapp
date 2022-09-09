import 'package:techstore/models/cart.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:velocity_x/velocity_x.dart';
import '../core/store.dart';

// ignore: camel_case_types
class cartPage extends StatelessWidget {
  const cartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Cart",
          style: TextStyle(
              color: Theme.of(context).colorScheme.secondary, fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _CartList(),
          ),
          const Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;
  // const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: const {},
            mutations: const {RemoveMutation},
            builder: (context, dynamic, _) {
              return Text(
                "\$${_cart.totalPrice()}",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
          SizedBox(
            width: 140,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Buying is not Supported yet.")),
                );
              },
              style: ButtonStyle(
                  backgroundColor:
                      // ignore: deprecated_member_use
                      MaterialStateProperty.all(Theme.of(context).buttonColor),
                  shape: MaterialStateProperty.all(
                    const StadiumBorder(),
                  )),
              child: const Text(
                "Buy",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty
        ? const Center(
            child: Text(
            "Nothing to show",
            style: TextStyle(
              fontSize: 30,
            ),
          ))
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () => {
                  RemoveMutation(_cart.items[index]),
                  // setState(() {})
                },
              ),
              title: Text(
                _cart.items[index].name,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          );
  }
}
