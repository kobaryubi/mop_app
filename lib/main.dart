import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('First Page')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          SecondPageButton(false),
          SecondPageButton(true),
          TimerPageButton(),
          FlutterDemoPageButton(),
        ],
      ),
    );
  }
}

@immutable
class TimerPageButton extends StatelessWidget {
  const TimerPageButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const TimerPage();
              },
            ),
          );
        },
        child: const Text('Timer Page'),
      ),
    );
  }
}

@immutable
class FlutterDemoPageButton extends StatelessWidget {
  const FlutterDemoPageButton({Key? key}) : super(key: key);

  @override
  Widget build (BuildContext context) {
    return const Center(
      child: NextPageButton(FlutterDemoPage(), "Flutter Demo Page"),
    );
  }
}

class FlutterDemoPage extends StatelessWidget {
  const FlutterDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo Page')),
      body: const Center(
        child: BackButton(),
      ),
    );
  }
}

class BackButton extends StatelessWidget {
  const BackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        if (!Navigator.canPop(context)) {
          // TODO: 警告表示
        } else {
          Navigator.pop(context);
        }
      },
      child: const Text('back'),
    );
  }
}

@immutable
class NextPageButton extends StatelessWidget {
  final String text;
  final Widget widget;
  // ignore: use_key_in_widget_constructors
  const NextPageButton(this.widget, this.text);

  @override Widget build (BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return widget;
            }
          ),
        );
      },
      child: Text(text),
    );
  }
}

class SecondPageButton extends StatelessWidget {
  final bool dialog;
  const SecondPageButton(this.dialog, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () async {
          var message = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const SecondPage('route from first page');
              },
              // TODO: 引数でダイアログにするかどうか
              // fullscreenDialog: true,
            ),
          );

          // ignore: avoid_print
          print(message);
        },
        child: const Text('Second Page'),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final String message;
  // ignore: use_key_in_widget_constructors
  const SecondPage(this.message);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Page')),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            if (!Navigator.canPop(context)) {
              // TODO: 警告表示
            } else {
              Navigator.pop(context, 'Go back from SecondPage');
            }
          },
          child: const Text('Go back'),
        ),
      ),
    );
  }
}

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Timer Page')),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            if (!Navigator.canPop(context)) {
              // TODO: 警告表示
            } else {
              Navigator.pop(context);
            }
          },
          child: const Text('Go back'),
        ),
      ),
    );
  }
}


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Flutter Demo'),
//         ),
//         body: Center(
//           child: Text('Hello World'),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {},
//           child: Icon(Icons.add),
//         ),
//       ),
//     );
//   }
// }