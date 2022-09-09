import 'package:flutter/material.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Sajjad Ali",
          style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary),
        ),
        const Text(
          "Trending Products",
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
