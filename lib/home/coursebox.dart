import 'package:flutter/material.dart';
import 'package:quiz/home/courses.dart';
import 'package:quiz/home/dialog.dart';

class CourseBox extends StatelessWidget {
  final Course course;
  final bool horizontal;

  CourseBox(this.course, {this.horizontal = true});

  @override
  Widget build(BuildContext context) {

    final courseCard = new Container(
      child: new Container(
        margin: new EdgeInsets.symmetric(vertical: 16.0),
        alignment: FractionalOffset.center,
        child: new Hero(
          tag: "course-hero-${course.id}",
          child: new Image(
            image: new AssetImage(course.image),
            height: 80.0,
            width: 80.0,
          ),
        ),
      ),
      height: 100.0,
      width: 200.0,
      decoration: new BoxDecoration(
        color: new Color(0xFFFFFFFF),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(10.0),
//        boxShadow: <BoxShadow>[
//          new BoxShadow(
//            color: Colors.black12,
//            blurRadius: 1.0,
//            offset: new Offset(0.0, 1.0),
//          ),
//        ],
      ),
    );

    final courseTitle = new Column(
      children: <Widget>[
        courseCard,
        new Container(
          height: 10.0,
        ),
        new Text(
          course.name,
          style: new TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15.0,
            color: Color(0xFFE08284),
          ),
        ),
      ],
    );

    return new GestureDetector(
      onTap: horizontal
          ? () => Navigator.of(context).push(
                new PageRouteBuilder(
                  pageBuilder: (_, __, ___) => new PopUp(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          new FadeTransition(opacity: animation, child: child),
                ),
              )
          : null,
      child: new Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            courseCard,
            courseTitle,
          ],
        ),
      ),
    );
  }
}
