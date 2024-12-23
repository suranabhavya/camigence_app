import 'package:flutter/material.dart';

class BottomIcon extends StatefulWidget {
  final Function()? onPressed;
  final bool bottomIcons;
  final String text;
  final IconData icons;

  const BottomIcon(
      {Key? key,
      required this.onPressed,
      required this.bottomIcons,
      required this.text,
      required this.icons})
      : super(key: key);

  @override
  _BottomIconState createState() => _BottomIconState();
}

class _BottomIconState extends State<BottomIcon> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: widget.onPressed,
      child: widget.bottomIcons == true ? Column(
        children: [
          Container(
            width: size.height * 0.15,
            height: size.height * 0.07,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.teal, width: 4),
              color: Colors.white,
            ),
            child: Icon(
              widget.icons,
              color: Colors.teal.shade800,
              size: 30.0,
            ),
          ),
          SizedBox(
            height: size.height * 0.015,
          ),
          Text(
            widget.text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(
            height: size.height * 0.025,
          )
        ],
      ) 
      : Column(
          children: [
            Container(
              width: size.height * 0.15,
              height: size.height * 0.07,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.teal.shade800,
              ),
              child: Icon(
                widget.icons,
                color: Colors.white,
                size: 30.0,
              ),
            ),
            SizedBox(
              height: size.height * 0.015,
            ),
            Text(
              widget.text,
              style: TextStyle(
                color: Colors.white.withOpacity(0.75),
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: size.height * 0.025,
            )
          ],
        ) 
    );
  }
}
