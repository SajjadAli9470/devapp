import 'package:techstore/models/cart.dart';
import 'package:techstore/models/catalog.dart';
// ignore: depend_on_referenced_packages
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatalogModel catalog = CatalogModel();
  CartModel cart = CartModel();

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
