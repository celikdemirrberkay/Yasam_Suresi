import 'dart:ffi' as ffi;
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yasam_suresi/constants.dart';
import 'package:yasam_suresi/result_page.dart';
import 'package:yasam_suresi/user_data.dart';
import 'MyColumn.dart';
import 'MyContainer.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String seciliCinsiyet = "";
  double icilenSigara = 0.0;
  double yapilanSporSayisi = 0.0;
  int boy = 150;
  int kilo = 60;

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
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyContainer(
                    renk: Colors.white,
                    child: buildRowOutlinedButton(boy.toInt(), "Boy"),
                  ),
                ),

                Expanded(
                  child: MyContainer(
                    renk: Colors.white,
                    child: buildRowOutlinedButton(kilo.toInt(), "Kilo"),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Haftada kaç kere spor yapıyorsunuz ?",
                      style: kMetinStyle),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(yapilanSporSayisi.toInt().toString(), style: kSayiStyle),
                  Slider(
                    divisions: 20,
                    value: yapilanSporSayisi,
                    min: 0,
                    max: 20,
                    onChanged: (double newValue) {
                      setState(() {
                        yapilanSporSayisi = newValue;
                      });
                    },
                  ),
                ],
              ),
              renk: Colors.white,
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Günde kaç adet sigara tüketiyorsunuz ?",
                      style: kMetinStyle),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(icilenSigara.toInt().toString(), style: kSayiStyle),
                  Slider(
                    value: icilenSigara,
                    min: 0,
                    max: 80,
                    onChanged: (double newValue) {
                      setState(() {
                        icilenSigara = newValue;
                      });
                    },
                  ),
                ],
              ),
              renk: Colors.white,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MyContainer(
                    onDoublePress: () {
                      setState(() {
                        seciliCinsiyet = "";
                      });
                    },
                    onPress: () {
                      setState(() {
                        seciliCinsiyet = "Erkek";
                      });
                    },
                    renk: seciliCinsiyet == 'Erkek'
                        ? Colors.lightBlueAccent
                        : Colors.white,
                    child:
                        MyColumn(sex: 'Erkek', myIcon: FontAwesomeIcons.mars),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                      onDoublePress: () {
                        setState(() {
                          seciliCinsiyet = "";
                        });
                      },
                      onPress: () {
                        setState(() {
                          seciliCinsiyet = "Kadın";
                        });
                      },
                      renk: seciliCinsiyet == 'Kadın'
                          ? Colors.lightBlueAccent
                          : Colors.white,
                      child: MyColumn(
                          sex: 'Kadın', myIcon: FontAwesomeIcons.venus)),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: TextButton(
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                minimumSize: Size(15, 50),
                backgroundColor: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      userData: UserData(
                        boy: boy,
                        icilenSigara: icilenSigara,
                        kilo: kilo,
                        seciliCinsiyet: seciliCinsiyet,
                        yapilanSporSayisi: yapilanSporSayisi,
                      ),
                    ),
                  ),
                );
              },
              child: Text(
                "Hesapla",
                style: kMetinStyle,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Row buildRowOutlinedButton(int variable, String boyYadaKilo) {
    if (variable < 0) {
      variable = 0;
    }
    return Row(
      children: <Widget>[
        RotatedBox(
          quarterTurns: 3,
          child: Text(boyYadaKilo, style: kMetinStyle),
        ),
        SizedBox(
          width: 5.0,
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(variable.toString(), style: kSayiStyle),
        ),
        SizedBox(
          width: 20.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(10.0, 40.0),
                  side: BorderSide(color: Colors.lightBlueAccent, width: 1),
                ),
                child: Icon(
                  FontAwesomeIcons.plus,
                ),
                onLongPress: () {
                  setState(() {
                    if (variable == boy) {
                      boy = boy + 10;
                    } else if (variable == kilo) {
                      kilo = kilo + 10;
                    }
                  });
                },
                onPressed: () {
                  setState(() {
                    if (variable == boy) {
                      boy++;
                    } else if (variable == kilo) {
                      kilo++;
                    }
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: Size(10.0, 40.0),
                  side: BorderSide(color: Colors.lightBlueAccent),
                ),
                child: Icon(
                  FontAwesomeIcons.minus,
                ),
                onLongPress: () {
                  setState(() {
                    if (variable == boy) {
                      boy = boy - 10;
                    } else if (variable == kilo) {
                      kilo = kilo - 10;
                    }
                  });
                },
                onPressed: () {
                  setState(() {
                    if (variable == boy) {
                      boy--;
                    } else if (variable == kilo) {
                      kilo--;
                    }
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
