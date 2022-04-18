import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  //MaterialApp 이 Route를 가능하게 해준다.
  runApp(const MaterialApp(home: MainPage()));
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('화면바꾸기'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            //화면이동 -> 두번째 페이지로 이동하기
            var result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SecondPage(),
              ),
            );

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('$result'),
              ),
            );
          },
          child: const Text('Main'),
        ),
      ),
    );
  }
}

//두번째 페이지
class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('두번째페이지'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, 'Back 1');
            },
            child: const Text('돌아가기 one'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, 'Back 2');
            },
            child: const Text('돌아가기 two'),
          ),
          // Text(
          //   'Greetings, planet!',
          //   style: TextStyle(
          //       fontFamily: 'Raleway',
          //       fontSize: 40,
          //       foreground: Paint()
          //         ..shader = ui.Gradient.linear(
          //           const Offset(0, 20),
          //           const Offset(150, 20),
          //           <Color>[
          //             Colors.red,
          //             Colors.yellow,
          //           ],
          //         )
          //   ),
          //)
        ],
      ),
    );
  }
}
