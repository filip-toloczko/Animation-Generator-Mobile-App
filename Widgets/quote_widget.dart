import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/Resources/Phrases.dart';

/*
 * Class will receive the current orientation, phrase and mobile layout to display
 * a quote
 */
class QuoteWidget extends StatelessWidget {
  // declare require fields
  final bool isTablet;
  final Phrases phrase;
  final int mobileLayout;

  // Constructor for calling this class
  QuoteWidget({required this.isTablet, required this.phrase, required this.mobileLayout});

  @override
  Widget build(BuildContext context) {
    //final TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content = Container(
      // Validate and define based on current mobile layout
        margin: mobileLayout == 1 ? EdgeInsets.only(top: 60, left: 10, right: 10)
            : EdgeInsets.only(top: 10, left: 10, right: 10) ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Use the phrase that was passed to get the quote in such phrase and display it
            Text(
                phrase.quotes,
                style: new TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)
            )
          ],
        ));

    // Display if device has dimensions of a tablet
    if (isTablet) {

      return Scaffold(
        //backgroundColor: Colors.green,
        body: Center(
          child: content,
        ),
      );
    }
    // display if device has dimensions of a phone
    return Scaffold(
      //backgroundColor: Colors.blue,
      body: Center(child: content),
    );
  }
}
