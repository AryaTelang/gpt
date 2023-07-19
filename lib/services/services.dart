
import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/text_widget.dart';

class Services{
  static Future<void> showModalSheet({required BuildContext context}) async{
    await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: cardColor,
            ),
            height: 55,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: TextWidget(
                    label: "Chosen Model:",
                    fontSize: 16,
                  ),
                )
              ],
            ),
          );
        });
  }
}