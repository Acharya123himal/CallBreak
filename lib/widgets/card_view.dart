import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  final List<int> list;
  CardView({Key? key, required this.list}) : super(key: key);
  final List<int> tempList = List.generate(13, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.white10,
        shadowColor: Colors.white10.withOpacity(1.0),
      ),
      child: ReorderableList(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        onReorder: (int oldIndex, int newIndex) {
          if (oldIndex != newIndex) {
            if (newIndex > oldIndex) {
              for (int i = oldIndex; i < newIndex - 1; i++) {
                tempList[i] = list[i];
                list[i] = list[i + 1];
                list[i + 1] = tempList[i];
              }
            } else {
              for (int i = oldIndex; i > newIndex; i--) {
                tempList[i] = list[i];
                list[i] = list[i - 1];
                list[i - 1] = tempList[i];
              }
            }
          }
        },
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.up,
            onDismissed: (direction) {},
            child: ReorderableDragStartListener(
              index: index,
              child: SizedOverflowBox(
                alignment: Alignment.bottomLeft,
                size: const Size(50, 10),
                child: Image(
                  image: AssetImage("assets/${list[index]}.png"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
