// ignore_for_file: must_be_immutable, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:techstore/core/store.dart';
import 'package:techstore/models/cart.dart';
import 'package:techstore/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: depend_on_referenced_packages
import 'package:velocity_x/velocity_x.dart';
import '../models/catalog.dart';
import '../widgets/home_widget/catalog_header.dart';
import '../widgets/home_widget/catalog_list.dart';
import 'dart:convert';
// import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "Sajjad Ali";
  // final url = "https://api.jsonbin.io/v3/b/6303215f5c146d63ca79fdf8";
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    // final response = await http.get(Uri.parse(url));
    // print(response.body);
    // final catalogJson = response.body;
    final catalogJson = await rootBundle.loadString('assets/catalog.json');
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
    // print(decodedData);
  }

  @override
  Widget build(BuildContext context) {
    final cart = (VxState.store as MyStore).cart;
    // final dummyList = List.generate(10, (index) => CatalogModel.items[0]);
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, dynamic, _) => FloatingActionButton(
          onPressed: () => {
            Navigator.pushNamed(context, MyRoutes.cartRoute),
          },
          // ignore: deprecated_member_use
          backgroundColor: Theme.of(context).buttonColor,
          child: const Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: Theme.of(context).canvasColor,
            size: 20,
            count: cart.items.length,
            textStyle: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CatalogHeader(),
              if (CatalogModel.items.isNotEmpty)
                const CatalogList()
              else
                const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}






// appBar: AppBar(
//   title: Text("Sajjad Ali"),
// ),
// body: Padding(
//   padding: const EdgeInsets.all(16.0),
//   child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
//       ? GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 16,
//             mainAxisSpacing: 16,
//           ),
//           itemBuilder: (context, index) {
//             final item = CatalogModel.items[index];
//             return Card(
//               clipBehavior: Clip.antiAlias,
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)),
//               child: GridTile(
//                 header: Container(
//                   child: Text(
//                     item.name,
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Colors.deepPurple,
//                   ),
//                 ),
//                 child: Image.network(item.image),
//                 footer: Container(
//                   child: Text(
//                     item.price.toString(),
//                     style: TextStyle(color: Colors.white),
//                   ),
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Colors.deepPurple,
//                   ),
//                 ),
//               ),
//             );
//           },
//           itemCount: CatalogModel.items.length,
//         )
//       // ? ListView.builder(
//       //     itemCount: CatalogModel.items.length,
//       //     itemBuilder: (context, index) {
//       //       return ItemWidget(
//       //         item: CatalogModel.items[index],
//       //       );
//       //     },
//       //   )
//       : Center(
//           child: CircularProgressIndicator(),
//         ),
// ),
// drawer: MyDrawer(),
