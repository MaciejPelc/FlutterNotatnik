import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startup_namer/mainWindow.dart';

class secondWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      height: 100,
      width: 100,
      margin: EdgeInsets.only(top: 100, bottom: 10),
      color: Colors.pink,
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return mainWindow();
          }));
        },
        child: Icon(
          const IconData(0xe800, fontFamily: 'Dupa'),
        ),
      ), //to działa, wszystko jest git

    //   child: IconButton(
    //     icon: Icon(Icons.bluetooth),
    //     onPressed: (){
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //        return mainWindow();
    //      }));
    //     },
    //   ), //działa ale inna ikonka

    );
  }
}
