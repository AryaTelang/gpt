import 'package:chat_gpt_app/constants/constants.dart';
import 'package:chat_gpt_app/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({Key? key, required this.msg, required this.chatIndex})
      : super(key: key);
  final String msg;
  final int chatIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: chatIndex == 0 ? scaffoldBackgroundColor : Color(0xffFFD0D0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          chatIndex == 0
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/userf.png",
                    width: 30,
                    height: 30,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/boto.png",
                    width: 30,
                    height: 30,
                  ),
                ),
          Expanded(
            child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10, right: 10),
                child: TextWidget(label: msg)),
          ),
          chatIndex == 0
              ? const SizedBox.shrink()
              : Padding(
                padding: const EdgeInsets.only(right: 10,top: 5),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.thumb_up_alt_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.thumb_down_alt_outlined,
                        color: Colors.white,
                      )
                    ],
                  ),
              ),
        ],
      ),
    );
  }
}
