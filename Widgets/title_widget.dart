import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Resources/Phrases.dart';

class TitleWidget extends StatefulWidget {
  // Call back that is passed to controller with phrase to display
  final ValueChanged<Phrases> titleCallBack;
  // Call back that is passed to controller with index to use
  final ValueChanged<int> indexCallBack;
  // declare title as null
  final Phrases? titleSelected;

  // Set constructor for this class
  TitleWidget(
      {required this.titleCallBack,
        this.titleSelected,
        required this.indexCallBack});

  @override
  _TitleWidgetState createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  // initialize variable for index
  static int _selectedIndex = -1;

  // Method changes the index that _selectedIndex has
  void _onSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // call method to updated _selectedIndex by using setState()
    _onSelected(_selectedIndex);
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          // margin relative to other list items
          margin: const EdgeInsets.symmetric(vertical: 3),

          // content of each list item (aka a tragedy title)
          child: ListTile(
            // Display the tiles that exist in the Phrases class
            title: Text(
              phraseList.elementAt(index).titles,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            // Set actions when a title is pressed
            onTap: () {
              _onSelected(index);
              // passed the callbacks to widget_layout_controller when this class is called
              widget.titleCallBack(phraseList[index]);
              widget.indexCallBack(index);
            },

            selected: widget.titleSelected == phraseList.elementAt(index),
          ),

          // Set decoration for titles, and change color based on current state
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(7),
              color: _selectedIndex != -1 && _selectedIndex == index
                  ? Colors.blue
                  : Colors.white),
        );
      },
      itemCount: phraseList.length,
    );
  }
}
