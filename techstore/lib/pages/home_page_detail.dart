import 'package:techstore/widgets/home_widget/add_to_cart.dart';
import 'package:flutter/material.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key? key, required this.catalog})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).cardColor,
      bottomNavigationBar: Container(
        color: Theme.of(context).canvasColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding:
              const EdgeInsets.only(left: 0, right: 20, top: 0, bottom: 0),
          children: [
            Text(
              "\$${catalog.price}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
            ),
            SizedBox(
                width: 140,
                height: 50,
                child: AddtoCart(
                  catalog: catalog,
                ))
          ],
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 25)),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Center(
                child: Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(
                      catalog.image,
                      width: 250,
                      height: 250,
                    )),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.elliptical(50, 50)),
                  // MediaQuery.of(context).size.width replace with 50
                ),
                child: Column(
                  children: [
                    const Padding(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 10)),
                    Text(
                      catalog.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                    Text(
                      catalog.desc,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                        padding: const EdgeInsets.only(
                            right: 10, left: 10, top: 10, bottom: 0),
                        child: Text(
                          catalog.detail,
                          style: Theme.of(context).textTheme.caption,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
