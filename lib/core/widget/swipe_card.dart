import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class SwipeCard extends StatefulWidget {
  final String keyIndex;
  final Widget child;
  Function() onDismissed;
  SwipeCard({
    required this.onDismissed,
    required this.child,
    required this.keyIndex,
    super.key,
  });

  @override
  State<SwipeCard> createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard>
    with SingleTickerProviderStateMixin {
  late final controller = SlidableController(this);
  @override
  Widget build(BuildContext context) {
    return Slidable(
      controller: controller,
      closeOnScroll: true,
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: InkWell(
                onTap: () async {
                  await widget.onDismissed();
                  controller.close();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

      key: Key(widget.keyIndex),
      child: widget.child,
    );
  }
}
