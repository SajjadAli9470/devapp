import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../models/message_model.dart';
import '../models/user_model.dart';

class CustomerMessage extends StatefulWidget {
  final User user;
  const CustomerMessage({super.key, required this.user});

  @override
  State<CustomerMessage> createState() => _CustomerMessageState();
}

class _CustomerMessageState extends State<CustomerMessage> {
  @override
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      margin: isMe
          ? const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              left: 80.0,
            )
          : const EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
            ),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        borderRadius: isMe
            ? const BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10))
            : const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
        color:
            isMe ? Colors.blue.withOpacity(0.1) : Colors.blue.withOpacity(0.3),
      ),
      child: Stack(children: [
        Container(
          margin:
              const EdgeInsets.only(top: 10, right: 20, bottom: 15, left: 15),
          child: Text(
            message.text,
          ),
        ),
        Positioned(bottom: 0, right: 7, child: Text(message.time))
      ]),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: [
        msg,
        IconButton(
          onPressed: () {},
          icon: message.isLiked
              ? const Icon(Icons.favorite)
              : const Icon(Icons.favorite_border),
          color: !message.isLiked ? Colors.blueGrey : Colors.red,
          iconSize: 30,
        )
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(5),
      height: 70,
      child: Row(children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.image)),
        Expanded(
            child: TextField(
          textCapitalization: TextCapitalization.sentences,
          onChanged: (value) {},
          decoration:
              const InputDecoration.collapsed(hintText: "Send a message..."),
        )),
        IconButton(onPressed: () {}, icon: Icon(Icons.send))
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
            color: Colors.white,
          ),
        ),
        title: Text(
          widget.user.name,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_horiz,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.only(top: 15),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      final Message message = messages[index];
                      final bool isMe = message.Sender.id == currentUser.id;
                      // return Text("0");
                      return _buildMessage(message, isMe);
                    }),
              ),
            )),
            _buildMessageComposer()
          ],
        ),
      ),
    );
  }
}
