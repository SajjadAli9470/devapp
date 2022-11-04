import 'package:flutter/material.dart';
import 'package:techstore/widgets/category_Selector.dart';
import '../widgets/pinned_contact.dart';
import '../widgets/recentChats.dart';

class OwnerMessage extends StatefulWidget {
  const OwnerMessage({super.key});

  @override
  State<OwnerMessage> createState() => _OwnerMessageState();
}

class _OwnerMessageState extends State<OwnerMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
          iconSize: 30.0,
          color: Colors.white,
        ),
        title: Text(
          "Chats",
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            onPressed: () => {},
            icon: Icon(Icons.search),
            color: Colors.white,
          )
        ],
      ),
      body: Column(children: <Widget>[
        // category_Selector(),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(children: [
              PinnedContact(),
              RecentChats(),
            ]),
          ),
        )
      ]),
    );
  }
}
