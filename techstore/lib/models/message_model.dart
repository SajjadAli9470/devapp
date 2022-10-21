import 'package:techstore/models/user_model.dart';

class Message {
  final User Sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;

  Message(
      {required this.Sender,
      required this.time,
      required this.text,
      required this.isLiked,
      required this.unread});
}

final User currentUser =
    User(id: 0, name: "Current User", imageURL: "assets/images/profile.png");

final User ejaz =
    User(id: 1, name: "Ejaz", imageURL: "assets/images/profile.png");

final User saif =
    User(id: 2, name: "Saif", imageURL: "assets/images/profile2.JPG");

final User shahbaz =
    User(id: 3, name: "Shahbaz", imageURL: "assets/images/profile.png");

final User habib =
    User(id: 4, name: "Habib", imageURL: "assets/images/profile.png");

List<User> pinned = [ejaz, saif, saif, ejaz, saif, ejaz, saif, shahbaz];

List<Message> chats = [
  Message(
      Sender: ejaz,
      time: "5:30 ",
      text: "helloo",
      isLiked: false,
      unread: true),
  Message(
      Sender: saif, time: "5:30 ", text: "yes", isLiked: false, unread: false),
  Message(
      Sender: habib,
      time: "5:30 ",
      text: "helloo",
      isLiked: false,
      unread: true),
  Message(
      Sender: shahbaz,
      time: "5:30 ",
      text: "OK",
      isLiked: false,
      unread: false),
];

List<Message> messages = [
  Message(
      Sender: currentUser,
      time: "5:30 ",
      text: "What do you want sir",
      isLiked: false,
      unread: true),
  Message(
      Sender: currentUser,
      time: "5:30 ",
      text: "What do you want sir",
      isLiked: false,
      unread: true),
  Message(
      Sender: shahbaz,
      time: "5:31",
      text:
          "Nothog fsdfsdjkhnjgdjk dfgdfgdfgdfg dfgdfgdfg dfgdfgdfgdfg dfgfsfsfsfsfsfsdfsdsdfsdfsfsdfsfsfsfsfssdfsdfsdfsdfsdfsdfsdfegedfgdfgdfgdfdfgdfgdf dfgdfgdfg dfgdfgdfgdf dfgdfgdfg dfgdfgdfgd dfg",
      isLiked: true,
      unread: false),
  Message(
      Sender: shahbaz,
      time: "5:30 ",
      text: "Nothog",
      isLiked: false,
      unread: false),
  Message(
      Sender: currentUser,
      time: "5:30 ",
      text: "What do you want sir",
      isLiked: false,
      unread: true),
  Message(
      Sender: shahbaz,
      time: "5:30 ",
      text: "Nothog",
      isLiked: false,
      unread: false),
];
