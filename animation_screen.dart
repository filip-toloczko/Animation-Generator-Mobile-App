import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  final String animation;
  final String bg;
  final String type;
  Color bgColor;

  AnimationScreen(
    {super.key,
      required this.animation,
      required this.bg,
      required this.type,
      required this.bgColor,
    }
  );

  @override
  _AnimationScreen createState() => _AnimationScreen();
}

class _AnimationScreen extends State<AnimationScreen> with TickerProviderStateMixin {

  bool selected = false;
  bool reverse = false;
  bool pause = false;

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);

  late final AnimationController _controller2 = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  )..repeat();

  late final AnimationController _controller3 = AnimationController(
    duration: const Duration(seconds: 6),
    vsync: this,
  )..repeat();

  late final AnimationController _controller4 = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  late final Animation<Offset> _offsetAnimationRight = Tween(
    begin: Offset(-0.4,0.0),
    end: const Offset(0.4, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));
  late final Animation<Offset> _offsetAnimationLeft = Tween(
    end: Offset(-0.4,0.0),
    begin: const Offset(0.4, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.linear,
  ));

  late final Animation<double> _fadeAnimation = CurvedAnimation(
    parent: _controller4,
    curve: Curves.easeIn,
  );
  late final Animation<double> _fadeAnimationReverse = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
    parent: _controller4,
    curve: Curves.easeIn,
  ));

  final Tween<double> turnLeft = Tween(
    begin: 1,
    end: 0,
  );
  final Tween<double> turnRight = Tween(
    begin: 0,
    end: 1,
  );

  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: widget.bgColor
          ),
        ),
        title: Text(
          widget.animation,
          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: widget.bgColor,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top: 60, left: 10, right: 10) ,
                child: Column(
                  children: [
                    Text(
                      widget.animation,
                      style: new TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)
                    ),
                    if(widget.type == "implicit")
                    ElevatedButton(
                        onPressed: (){
                          setState(() {
                            selected = !selected;
                          });
                        },
                        child: Text("Animate")
                    ),
                    if(widget.type == "explicit")
                    ElevatedButton(
                        onPressed: (){
                          setState(() {
                            pause = !pause;
                          });

                          if(pause == true)
                          _controller.stop();
                          if(pause == true)
                          _controller2.stop();
                          if(pause == true)
                          _controller3.stop();
                          if(pause == true)
                          _controller4.stop();
                          if(pause == false)
                          _controller.repeat(reverse: true);
                          if(pause == false)
                          _controller2.repeat();
                          if(pause == false)
                          _controller4.repeat();


                        },
                        child: pause ? Text("start") : Text("stop")
                    ),
                    if(widget.type == "explicit")
                      ElevatedButton(
                          onPressed: (){
                            setState(() {
                              reverse = !reverse;
                            });
                          },
                          child: Text("Reverse")
                      )
                  ]
                )
              ),
            ),
            if(widget.animation == "Soccer Goal")
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.bg),
                        fit: BoxFit.cover
                    )
                ),
                child: Stack(
                children: [
                  AnimatedPositioned(
                    width: selected ? 50.0 : 50.0,
                    height: selected ? 50.0 : 20.0,
                    top: selected ? 125.0 : 125.0,
                    right: selected ? 260.0 : 0.0,
                    duration: const Duration(seconds: 3),
                    curve: Curves.easeInCubic,
                      child: const Image(
                        image: AssetImage('images/soccerball.png')
                      )
                    ),
                ],
                ),
              )
            ),
            if(widget.animation == "Basketball Shot")
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.bg),
                          fit: BoxFit.cover
                      )
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                          width: selected ? 80.0 : 50.0,
                          height: selected ? 80.0 : 20.0,
                          top: selected ? 200.0 : 130.0,
                          right: selected ? 250.0 : 40.0,
                          duration: const Duration(seconds: 5),
                          curve: Curves.bounceOut,
                          child: const Image(
                              image: AssetImage('images/basketball.png')
                          )
                      ),
                    ],
                  ),
                )
            ),
            if(widget.animation == "Golf Putt")
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.bg),
                          fit: BoxFit.cover
                      )
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                          width: selected ? 50.0 : 20.0,
                          height: selected ? 80.0 : 20.0,
                          top: selected ? 140.0 : 230.0,
                          right: selected ? 400.0 : 180.0,
                          duration: const Duration(seconds: 8),
                          curve: Curves.decelerate,
                          child: const Image(
                              image: AssetImage('images/golfball.png')
                          )
                      ),
                    ],
                  ),
                )
            ),
            if(widget.animation == "Field Goal")
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.bg),
                          fit: BoxFit.cover
                      )
                  ),
                  child: Stack(
                    children: [
                      AnimatedPositioned(
                          width: selected ? 50.0 : 20.0,
                          height: selected ? 30.0 : 50.0,
                          top: selected ? 200.0 : 130.0,
                          right: selected ? 360.0 : 515.0,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeOutQuart,
                          child: const Image(
                              image: AssetImage('images/football.png')
                          )
                      ),
                    ],
                  ),
                )
            ),
            if(widget.animation == "Soccer Ball Pass Back and Forth")
            Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(widget.bg),
                          fit: BoxFit.cover
                      )
                  ),
                  child: Stack(
                    children: [
                      if(reverse == false)
                      PositionedTransition(
                        rect: RelativeRectTween(
                          begin: RelativeRect.fromLTRB(-280, 60, 50, 30,),
                          end: RelativeRect.fromLTRB(325, 30, 50, 60,),
                        ).animate(CurvedAnimation(
                          parent: _controller,
                          curve: Curves.linear,
                        )),
                        child: const Padding(
                          padding: EdgeInsets.all(70),
                          child: Image(
                            image: AssetImage("images/soccerball.png"),
                          ),
                        ),
                      ),
                      if(reverse == true)
                        PositionedTransition(
                          rect: RelativeRectTween(
                            end: RelativeRect.fromLTRB(-280, 60, 50, 30,),
                            begin: RelativeRect.fromLTRB(325, 30, 50, 60,),
                          ).animate(CurvedAnimation(
                            parent: _controller,
                            curve: Curves.linear,
                          )),
                          child: const Padding(
                            padding: EdgeInsets.all(70),
                            child: Image(
                              image: AssetImage("images/soccerball.png"),
                            ),
                          ),
                        ),
                    ],
                  ),
                )
            ),
            if(widget.animation == "Spinning Basketball" && reverse == false)
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.bg),
                        fit: BoxFit.cover
                    )
                ),
                child: RotationTransition(
                  turns: turnRight.animate(_controller2),
                  child: const Padding(
                    padding: EdgeInsets.all(100),
                    child: Image(
                      image: AssetImage("images/basketball.png"),
                    ),
                  ),
                ),
              ),
            ),
            if(widget.animation == "Spinning Basketball" && reverse == true)
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.bg),
                        fit: BoxFit.cover
                    )
                ),
                child: RotationTransition(
                  turns: turnLeft.animate(_controller2),
                  child: const Padding(
                    padding: EdgeInsets.all(100),
                    child: Image(
                      image: AssetImage("images/basketball.png"),
                    ),
                  ),
                ),
              ),
            ),
            if(widget.animation == "Fading Golf Ball" && reverse == false)
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.bg),
                        fit: BoxFit.cover
                    )
                ),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: const Padding(
                    padding: EdgeInsets.all(100),
                    child: Image(
                      image: AssetImage("images/golfball.png"),
                    ),
                  ),
                )
              )
            ),
            if(widget.animation == "Fading Golf Ball" && reverse == true)
            Expanded(
                flex: 2,
                child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(widget.bg),
                            fit: BoxFit.cover
                        )
                    ),
                    child: FadeTransition(
                      opacity: _fadeAnimationReverse,
                      child: const Padding(
                        padding: EdgeInsets.all(100),
                        child: Image(
                          image: AssetImage("images/golfball.png"),
                        ),
                      ),
                    )
                )
            ),
            if(widget.animation == "Alternating Field Goals")
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.bg),
                        fit: BoxFit.cover
                    )
                ),
                child: SlideTransition(
                  position: reverse ? _offsetAnimationRight : _offsetAnimationLeft,
                  child: const Padding(
                    padding: EdgeInsets.all(100),
                    child: Image(
                      image: AssetImage("images/football.png"),
                    ),
                  ),
              ),
            ),
            )
          ],
        ),
      ),
    );
  }
}