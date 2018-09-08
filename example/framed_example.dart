import 'dart:html';

import 'package:framed/framed.dart';

class HelloBob implements View {
  HtmlEl render() {
    return TextEl('Hello Bob!');
  }
}

class HelloWorld extends Component {
  HelloWorld(): super(null);
  @override
  HtmlEl render() {
    return Tag('div', null, [TextEl('Hello World!'), LoneTag('br'), HelloBob()]);
  }
}

main() {
  var awesome = new Awesome();
  print('awesome: ${awesome.isAwesome}');

  var helloWorld = HelloWorld();
  Dom.render(helloWorld, querySelector("#root"));
  print("working");
}
