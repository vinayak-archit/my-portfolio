import 'package:flutter/material.dart';

class RouteTransition extends PageRouteBuilder {
  final Widget? widget;
  final bool fade;

  RouteTransition({this.widget, this.fade = true})
      : super(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return widget!;
      },
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (BuildContext context,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
          Widget child) {
        if (fade) {
          return FadeTransition(opacity: animation, child: child);
        }
        {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        }
      });
}

void navigationPush(BuildContext context, StatefulWidget route,
    {Function? function}) {
  Navigator.push(context, RouteTransition(widget: route))
      .then((value) => function!(value));
}

void navigationPushReplacement(BuildContext context, Widget route) {
  Navigator.pushReplacement(context, RouteTransition(widget: route));
}

void navigationPushAndRemoveUntil(BuildContext context, Widget route) {
  Navigator.pushAndRemoveUntil(
      context, RouteTransition(widget: route), (Route route) => false);
}

void navigationPushReplacementNamed(
    BuildContext context, String name, Widget route) {
  Navigator.pushReplacementNamed(context, name);
}

void navigationPop(BuildContext context, StatefulWidget route) {
  Navigator.pop(context, RouteTransition(widget: route));
}

void navigationStateLessPush(BuildContext context, StatelessWidget route) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}

void navigationStateLessPop(BuildContext context, StatelessWidget route) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}

void delay(BuildContext context, int duration, StatefulWidget route) {
  Future.delayed(const Duration(seconds: 3), () {
    navigationPush(context, route);
  });
}
