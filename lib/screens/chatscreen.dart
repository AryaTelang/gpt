import 'dart:developer';

import 'package:chat_gpt_app/widgets/chatWidget.dart';
import 'package:chat_gpt_app/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants/constants.dart';
import '../services/services.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool isTyping = true;
  late TextEditingController textEditingController;
  @override
  void initState() {
    // TODO: implement initState
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Flexible(
                child: ListView.builder(
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return ChatWidget(
                        msg: chatMessages[index]["msg"].toString(),
                        chatIndex: int.parse(
                            chatMessages[index]["chatIndex"].toString()),
                      );
                    }),
              ),
              if (isTyping) ...[
                SpinKitFoldingCube(
                  color: Color(0xffE1AEFF),
                  size: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                Material(
                  color: cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: textEditingController,
                            style: TextStyle(
                                color: Color(0xffF9F5F6),
                                fontWeight: FontWeight.w700),
                            cursorColor: scaffoldBackgroundColor,
                            onSubmitted: (value) {},
                            decoration: InputDecoration.collapsed(
                                hintText: "How can I help you?",
                                hintStyle: TextStyle(
                                    color: Color(0xffFFECEC),
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.send,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                )
              ]
            ],
          ),
        ),
        appBar: AppBar(
          elevation: 2,
          leading: Image.asset("assets/images/chat_logo.png"),
          title: Text("Chat with me"),
          actions: [
            IconButton(
                onPressed: () async {
                  await Services.showModalSheet(context:context);
                },
                icon: Icon(Icons.more_vert_outlined))
          ],
        ));
  }
}
