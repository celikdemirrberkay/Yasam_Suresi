import 'package:flutter/material.dart';
import 'package:yasam_suresi/constants.dart';
import 'package:yasam_suresi/hesap.dart';
import 'package:yasam_suresi/user_data.dart';

class ResultPage extends StatelessWidget {

  final UserData? userData;
  Hesap? hesap ;

  ResultPage({this.userData,this.hesap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.blueAccent,
                  Colors.lightBlueAccent,
                ],
                begin: Alignment.bottomLeft,
                end:Alignment.bottomRight
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "YAŞAM BEKLENTİSİ",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0)
            ),
            margin: EdgeInsets.symmetric(horizontal: 50.0),
            width: 500.0,
            height: 500.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Text(
                      "Boy : ${userData?.boy.toString()}\n\n"
                      "Kilo : ${userData?.kilo.toString()}\n\n"
                      "Yapılan spor sayısı : ${userData?.yapilanSporSayisi?.toInt().toString()}\n\n"
                      "Tüketilen sigara : ${userData?.icilenSigara?.toInt().toString()}\n\n"
                      "Cinsiyet : ${userData?.seciliCinsiyet.toString()}\n\n"
                      "Ortalama Ömür : ${hesap?.hesaplama()}",
                      style: TextStyle(
                        color: Colors.lightBlueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Geri dön",
                      style: kMetinStyle,
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
