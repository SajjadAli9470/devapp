import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:techstore/models/message_model.dart';

class PinnedContact extends StatelessWidget {
  const PinnedContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15, left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Pinned Contact",
                style: TextStyle(fontSize: 15, letterSpacing: 1.0),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz),
              )
            ],
          ),
        ),
        Container(
          height: 100.0,
          // color: Colors.blue.withOpacity(0.5),
          child: ListView.builder(
              padding: EdgeInsets.all(3.0),
              scrollDirection: Axis.horizontal,
              itemCount: pinned.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(pinned[index].imageURL),
                      ),
                      (Text(pinned[index].name)),
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}
