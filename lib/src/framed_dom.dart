import 'package:framed/src/framed_view.dart';
import 'dart:html';

class Dom {
  static void render (View v, Element el) {
    el.children.add(v.render().renderEl());
  }
}