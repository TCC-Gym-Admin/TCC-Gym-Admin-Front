import 'package:flutter/material.dart';

class SwipeCard extends StatefulWidget {
  final String keyIndex;
  final Widget child;
  Function(DismissDirection)? onDismissed;
  SwipeCard({
    required this.onDismissed,
    required this.child,
    required this.keyIndex,
    super.key,
  });

  @override
  State<SwipeCard> createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {},
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Align(
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Icon(Icons.delete, color: Colors.white),
              Text(
                "Delete",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(width: 20),
            ],
          ),
        ),
      ),
      key: Key(widget.keyIndex),
      child: widget.child,
    );
  }
}
