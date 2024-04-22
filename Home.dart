import 'package:flutter/material.dart';
import 'package:ftolo2_project_3/animation_screen.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List animationNames = ["Soccer Goal", "Basketball Shot", "Golf Putt", "Field Goal", "Soccer Ball Pass Back and Forth", "Spinning Basketball", "Fading Golf Ball", "Alternating Field Goals",];
  List backgrounds = ["images/soccerbackground.jpg", "images/basketballbackground.png", "images/golfbackground.png", "images/footballbackground.png", "images/soccerbackground.jpg", "images/basketballbackground.png", "images/golfbackground.png", "images/footballbackground.png",];
  List types = ["implicit", "implicit", "implicit", "implicit", "explicit", "explicit", "explicit", "explicit",];
  List bgColor = [Colors.green.shade900,Colors.grey.shade800,Colors.blue.shade300,Colors.green.shade900,Colors.green.shade900,Colors.grey.shade800,Colors.blue.shade300,Colors.green.shade900,];
  List transDuration = [Duration(milliseconds: 3000), Duration(milliseconds: 3000), Duration(milliseconds: 2000), Duration(milliseconds: 4000), Duration(milliseconds: 4000), Duration(milliseconds: 3000), Duration(milliseconds: 3000), Duration(milliseconds: 4000)];
  List transitions = [
    // Soccer Goal Animation
    (context, animation, anotherAnimation, child) {
    animation =
      CurvedAnimation(curve: Curves.elasticInOut, parent: animation);
      return SlideTransition(
        position:
          Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)).animate(animation),
        child: child,
      );
    },

    // Basketball shot animation
    (context, animation, anotherAnimation, child) {
    animation =
      CurvedAnimation(curve: Curves.easeInOutQuad, parent: animation);
      return ScaleTransition(
        scale:
          Tween<double>(begin: 0, end: 1).animate(animation),
        child: child,
      );
    },

    // golf put animation
    (context, animation, anotherAnimation, child) {
    animation =
      CurvedAnimation(curve: Curves.bounceOut, parent: animation);
      return SlideTransition(
        position:
          Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)).animate(animation),
        child: child,
      );
    },

    // field goal animation
    (context, animation, anotherAnimation, child) {
    animation =
      CurvedAnimation(curve: Curves.easeOut, parent: animation);
      return FadeTransition(
        opacity:
          Tween<double>(begin: 0, end: 1).animate(animation),
        child: child,
      );
    },

    // soccer ball pass animation
    (context, animation, anotherAnimation, child) {
    animation =
      CurvedAnimation(curve: Curves.easeInOutBack, parent: animation);
      return SlideTransition(
        position:
        Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)).animate(animation),
        child: child,
      );
    },

    // spinning basketball animation
    (context, animation, anotherAnimation, child) {
    animation =
      CurvedAnimation(curve: Curves.easeOut, parent: animation);
      return SlideTransition(
        position:
          Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)).animate(animation),
        child: child,
      );
    },

    // fading golf ball animation
    (context, animation, anotherAnimation, child) {
    animation =
      CurvedAnimation(curve: Curves.easeOut, parent: animation);
      return SlideTransition(
        position:
          Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)).animate(animation),
        child: child,
      );
    },

    // alternating field goals animation
    (context, animation, anotherAnimation, child) {
    animation =
      CurvedAnimation(curve: Curves.easeOut, parent: animation);
      return SlideTransition(
        position:
          Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)).animate(animation),
        child: child,
      );
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/grass.jpg"),
              fit: BoxFit.cover
            )
          ),
        ),
        title: Text(
          "Animation Nation",
          style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold ),
        ),
        centerTitle: true,
      ),
    body: ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/grass.jpg"),
                  fit: BoxFit.cover
              )
          ),
          // margin relative to other list items
          margin: const EdgeInsets.symmetric(vertical: 3),

          // content of each list item (aka a tragedy title)
          child: ListTile(
            // Display the tiles that exist in the Phrases class
            title: Text(
              animationNames[index],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            // Set actions when a title is pressed
            onTap: () {
              // passed the callbacks to widget_layout_controller when this class is called
              Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, anotherAnimation) {
                    return AnimationScreen(animation: animationNames[index], bg: backgrounds[index], type: types[index], bgColor: bgColor[index],);
                  },
                  barrierColor: bgColor[index],
                  transitionDuration: Duration(milliseconds: 3000),
                  transitionsBuilder: transitions[index],
                      ));
            },


          ),
        );
      },
      itemCount: 8
    )
    );
  }
}