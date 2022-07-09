import 'package:yasam_suresi/user_data.dart';

class Hesap {


  UserData _userData = UserData();
  Hesap(this._userData);


  double hesaplama() {

    double? kilo = _userData.kilo?.toDouble();
    double boy = _userData.boy! / 100;
    double? icilenSigaraSayisi = _userData.icilenSigara;
    double? sporSayisi = _userData.yapilanSporSayisi;
    double indeks = kilo! / (boy * boy);
    int puanlama=0;

    if(kilo != null && icilenSigaraSayisi != null && sporSayisi != null){

      if(indeks>18.5 && 24.9>indeks){
        puanlama = puanlama + 2;
      }
      if (icilenSigaraSayisi>5 && icilenSigaraSayisi<20){
        puanlama--;
      }
      if(icilenSigaraSayisi>20){
        puanlama = puanlama-2;
      }
      if(sporSayisi>=7){
        puanlama=puanlama+2;
      }


    }
    return puanlama.toDouble();
  }

}
