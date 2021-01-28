// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/painting.dart';
import 'dart:math';

import 'package:startup_namer/widgets.dart';
import 'package:flutter/services.dart';
//void main() => runApp(MyApp());

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //[1]
  @override //[2]
  Widget build(BuildContext context) {
    ///[3] "BuildContext context" jest parametrem, co jest tym parametrem, kiedy ten widget jest wywoływany?
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Scaffold(
        backgroundColor: Colors.black,
          appBar: AppBar(
            title: Text('Welcome to Flutter'),
              leading: IconButton(
                icon: Icon(
                  Icons.cancel,
                  color: Colors.white,
                ),
                onPressed: ()=> SystemChannels.platform.invokeMethod('SystemNavigator.pop')
              )
          ),
          body: Stack(
            children: [
              Flexible(
                flex: 1,
                child: Container(
                  //height: 1000,//wysokość kolorkow
                  child: Expanded(child: RandomWords()),
                ),
              ),
              Flexible(
                  flex: 3,
                  child: Row(
                    children: [
                      Spacer(),
                      secondWidget(),
                      Spacer(),
                    ],
                  )),
            ],
          )),
    );
  }
}

// class secondWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Text('hello world'),
//     );
//   }
// }

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  List<String> _suggestions2 = new List<String>();
  final _biggerFont = TextStyle(fontSize: 18.0, color: Colors.black);
//////////////////////////////////////////////////////////////////////////////
  List colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];
  int colorHolder = -1;
  int colorOutput;
  Random random = new Random();
  //////////////////////////////////////////////////////////////
  @override
  int getColorId() {
    if (colorHolder == -1) {
      colorHolder = random.nextInt(6);
      colorOutput = colorHolder;
      return colorOutput;
    }
    while (colorOutput == colorHolder) {
      colorHolder = random.nextInt(6);
    }
    if (colorHolder != colorOutput) {
      colorOutput = colorHolder;
      return colorOutput;
    }
  }

////////////////////////////////////////////////////////////////////
//   ScrollController _scrollController = ScrollController();
//
//   _scrollToBottom() {
//     _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
//   }


  @override
  void initState() {
    super.initState(); //wywołanie klasy rodzica, a po chuj?
    for (int i = 1; i < 20; i++) {
      _suggestions2.add(i.toString());
    }
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        //controller: _scrollController,

        scrollDirection: Axis.vertical, // zmienia przewijanie z góra/dół na lewo/prawo UwU
        itemCount: _suggestions2.length,
        itemBuilder: (context, i)
            {
          return _buildRow(
              //_suggestions2[i], i
          );
        });
  }

  Widget _buildRow(
      //String pair, int index
      ) {
    return Container(
      width: 100,
      height: 100,
      color: colors[getColorId()],
      child: Padding(
          padding: EdgeInsets.all(16),
          child: Center(
              //      child: new Icon(const IconData(0xe800, fontFamily: 'Dupa')), tutaj mogę wstawić ikonki XDDD
              child: RichText(
            text: TextSpan(
                //text: pair, style: _biggerFont
            ),
          ))),
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return _buildSuggestions();
  }
}
