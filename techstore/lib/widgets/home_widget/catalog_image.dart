import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizedBox1 =
        SizedBox(width: 80, height: 80, child: Image.network(image));
    var sizedBox2 = SizedBox(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.1,
        child: Image.network(image));

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).cardColor,
      ),
      margin: const EdgeInsets.all(7),
      padding: const EdgeInsets.only(top: 8, left: 8, bottom: 8, right: 8),
      child: context.isMobile ? sizedBox1 : sizedBox2,
    );
  }
}
