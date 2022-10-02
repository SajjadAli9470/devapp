import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/message_model.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final Message chat = chats[index];
              return Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: chat.unread
                        ? Colors.blue.withOpacity(0.1)
                        : Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(chat.Sender.imageURL),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chat.Sender.name,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                chat.text,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.blueGrey,
                                    fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          chat.unread
                              ? Icon(
                                  Icons.circle,
                                  color: Colors.green,
                                  size: 16,
                                )
                              : Icon(
                                  Icons.circle,
                                  color: Colors.blue.withOpacity(0.2),
                                  size: 16,
                                ),
                          Text(
                            chat.time,
                            style: TextStyle(fontSize: 13),
                          ),
                        ])
                  ],
                ),
              );
            }),
      ),
    );
  }
}
