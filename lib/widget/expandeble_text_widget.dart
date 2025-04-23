import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/dimensions.dart';
import 'package:flutter_application_1/widget/small_text.dart';

class ExpandebleTextWidget extends StatefulWidget {
  final String text;
  const ExpandebleTextWidget({Key? key, required this.text}) : super(key: key); // ✅ Fixed key and added required

  @override
  _ExpandebleTextWidgetState createState() => _ExpandebleTextWidgetState();
}

class _ExpandebleTextWidgetState extends State<ExpandebleTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool hiddenText = true;

  final double textHeight = Dimensions.screenHeight/5.63;

  @override
  void initState() {
    super.initState();

    // Simple heuristic to split text (based on character count instead of height in pixels)
    if (widget.text.length > 100) { // ✅ Adjust this number based on trial/error
      firstHalf = widget.text.substring(0, 100);
      secondHalf = widget.text.substring(100, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? SmallText(color: Colors.black, size: Dimensions.font16, text: firstHalf)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(height: 1.8, color: Colors.black, size: Dimensions.font20, text: hiddenText ? (firstHalf + "...") : (firstHalf + secondHalf)),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      SmallText(
                          text: hiddenText ? "Show more" : "Show less",
                          color: Colors.indigo),
                      Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: Colors.brown,
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
