import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class category_Selector extends StatefulWidget {
  const category_Selector({super.key});

  @override
  State<category_Selector> createState() => _category_SelectorState();
}

class _category_SelectorState extends State<category_Selector> {
  int selectIndex = 0;
  final List<String> categories = ['Messages', 'Online', 'Groups', 'Requests'];
  // final List<String> categories = ['Messages', 'Online'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Colors.blue,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectIndex = index;
                });
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Text(
                  categories[index],
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:
                          index == selectIndex ? Colors.white : Colors.white54),
                ),
              ),
            );
          }),
    );
  }
}
