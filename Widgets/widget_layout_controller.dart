import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/Resources/Phrases.dart';
import '/Widgets/quote_widget.dart';
import '/Widgets/title_widget.dart';

/*
 * Class needs to be stateful because there will need to be constant
 * updates in title and quote widgets
 */

class WidgetLayoutController extends StatefulWidget {
  @override
  _WidgetLayoutControllerState createState() => _WidgetLayoutControllerState();
}

/*
 * Extend the class WidgetLayoutController
 */
class _WidgetLayoutControllerState extends State<WidgetLayoutController> {
  // set a physical device size
  static const int deviceSize = 600;
  // Declare an instance to access phrases
  late Phrases _selectedPhrase;
  static int titleIndex = -1;

  // Widget returns content by using titleCallBack which passes a phrase
  // selected by user. Tablet is false, so it returns a layout for mobile phones
  Widget _mobileLayoutBuilder() {
    // Calling titleWidget class which has a call back that receives the phraseSelected in title widget
    // then it sends this phraseSelected to the quotes pages to access its .quotes content
    return TitleWidget(
      titleCallBack: (phraseSelected) {
        setState(() {
          _selectedPhrase = phraseSelected;
        });
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
              return QuoteWidget(
                // Not optimized for tablet, pass phrase and mobile layout to quote class
                  isTablet: false,
                  phrase: _selectedPhrase,
                  mobileLayout: 1);
            }));
      },
      // title widget passes the index too, but here it is not being used for anything else
      indexCallBack: (int value) {
        setState(() {
          titleIndex = value;
        });
      },
    );
  }

  Widget _tabletLayoutBuilder() {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Material(
              elevation: 13.0,
              child: TitleWidget(
                // Call back is passed when TitleWidget class is called:
                // update _selectedPhrase and titleIndex
                titleCallBack: (phraseSelected) {
                  setState(() {
                    _selectedPhrase = phraseSelected;
                  });
                },
                indexCallBack: (int value) {
                  setState(() {
                    titleIndex = value;
                  });
                }, //titleSelected: _selectedPhrase,
              )),
        ),
        // Validate titleIndex and passed received _selectedPhrase to display quote
        if (titleIndex != -1)
          Flexible(
            flex: 2,
            child: QuoteWidget(
              isTablet: true,
              phrase: _selectedPhrase,
              mobileLayout: 3,
            ),
          )
        // titleIndex is not valid, display a blank
        else
          Flexible(
            flex: 2,
            child: QuoteWidget(
              isTablet: true,
              phrase: phraseList.elementAt(5),
              mobileLayout: 3,
            ),
          )
      ],
    );
  }

  // Here, a layout for a mobile phone can be chosen
  @override
  Widget build(BuildContext context) {

    // Getting real size of physical device
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    var orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Text("TITLES and QUOTES WIDGET"),
      ),
      body: _tabletLayoutBuilder(),
    );
  }
}
