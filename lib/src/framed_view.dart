import 'dart:html';

abstract class View {
  HtmlEl render();
}

abstract class HtmlEl extends View {
  Element renderEl();
}

class Tag implements HtmlEl {
  String tag;
  Map<String, Object> props;
  List<View> children;
  /// constructor
  Tag(this.tag, this.props, this.children);
  HtmlEl render () {
    return this;
  }
  Element renderEl() {
    var el = Element.tag(tag);
    if (children != null) {
      for (var child in children) {
        el.children.add(child.render().renderEl());
      }
    }
    return el;
  }
}

class LoneTag extends Tag {
  LoneTag(String tag) : super(tag, null, null);
}

class TextEl implements HtmlEl {
  String text;

  TextEl(this.text);
  HtmlEl render () {
    return this;
  }
  Element renderEl () {
    return Element.html('<span>$text</span>');
  }
}

abstract class Component extends View {
  Map<String, Object> state = <String, Object>{};
  Map<String, Object> props = <String, Object>{};
  void setState (Map<String, Object> state) {
    for (var key in state.keys) {
      this.state[key] = state[key];
    }
  }
  Component(this.props);
}
