import 'dart:convert';
import 'dart:math';
import 'package:final_project/ScrrenHelpers/Alerts.dart';
import 'package:final_project/ScrrenHelpers/UserDao.dart';
import 'package:final_project/models/userBilgi.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'LoginScreen.dart';

class KaydolScreen extends StatefulWidget {
  const KaydolScreen({Key? key}) : super(key: key);

  @override
  State<KaydolScreen> createState() => _KaydolScreenState();
}

class _KaydolScreenState extends State<KaydolScreen> {
  TextEditingController tfcAd = TextEditingController();
  TextEditingController tfcSoyad = TextEditingController();
  TextEditingController tfcMail = TextEditingController();
  TextEditingController tfcTel = TextEditingController();
  TextEditingController tfcUsername = TextEditingController();
  TextEditingController tfcSifre = TextEditingController();
  var alert = '';
  bool uyeVarmi = false;
  var sayi = <Cnt>[];
 /* Future<void> kaydol(mail) async {
    // showAlertDialogSifremiUnuttum(context);
    //  print("şifre sıfırlama işlemi için bağlantı linki,sistemde kayıtlı mail adresinize gönderilmiştir.");
    var sonuc;
    final String apiURL = 'http://195.175.81.238/pls/crm/FLUTTER.KULLANICIKAYIT?EP=$mail';
    print(apiURL);
    var jsonResponse = await http.get(Uri.parse(apiURL));
    if (jsonResponse.statusCode == 200) {
      final jsonItems = json.decode(jsonResponse.body).cast<
          Map<String, dynamic>>();
      List<KayitSonuc> usersList = jsonItems.map<KayitSonuc>((json) {
        return KayitSonuc.fromJson(json);
      }).toList();
      //return usersList;
      sonuc = usersList[0].SONUC;
      print(sonuc);
      setState(() {
        alert = usersList[0].METIN.toString();
      });
      KayitSonuc user = KayitSonuc(SONUC: usersList[0].SONUC, METIN: usersList[0].METIN, MAIL: usersList[0].MAIL, UNVAN: alert, TELEFON1:usersList[0].TELEFON1,HESAPKOD:usersList[0].HESAPKOD);
      if (sonuc == "KAYDOLABILIR") {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => KayitDevamScreen(user:user)));
      }
    }
    else {
      throw Exception( "hata");
    }
  }*/
  Future<void> kaydol(ad,soyad,mail,tel,username,sifre)async {
    await Userdao().KullaniciEkle(ad,soyad,mail,tel,username,sifre);
    Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()));
  }
Future<void> kontrol(text)async {
  sayi = await Userdao().KullaniciAdiKontrol(text);
  print(sayi[0].cnt);
    if(sayi[0].cnt == 1){
      print("var");
      showAlertDialogKullaniciVar(context);
      uyeVarmi = true;
    }
    else{
      uyeVarmi = false;
      kaydol(tfcAd.text,tfcSoyad.text,tfcMail.text,tfcTel.text,tfcUsername.text,tfcSifre.text);
    }
}

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return new WillPopScope(onWillPop: () async => false ,
        child: Scaffold(
            body: Container(
              height: height,
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 80),
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                      Text(
                                      "Ad",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    TextField(
                                        controller: tfcAd,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            fillColor: Color(0xfff3f3f4),
                                            filled: true)),

                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Soyad",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    TextField(
                                        controller: tfcSoyad,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            fillColor: Color(0xfff3f3f4),
                                            filled: true)),

                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "E-Posta",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                        TextField(
                                            controller: tfcMail,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                fillColor: Color(0xfff3f3f4),
                                                filled: true)),

                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Telefon",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    TextField(
                                        controller: tfcTel,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            fillColor: Color(0xfff3f3f4),
                                            filled: true)),

                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Kullanıcı Adı",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                               TextField(
                                          controller: tfcUsername,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              fillColor: Color(0xfff3f3f4),
                                              filled: true)),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Şifre",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold, fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextField(
                                        controller: tfcSifre,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            fillColor: Color(0xfff3f3f4),
                                            filled: true)),

                                  ],
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: (){
                             // kaydol(tfcMail.text);
                              kontrol(tfcUsername.text);

                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(vertical: 15),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.grey.shade200,
                                      offset: Offset(2, 4),
                                      blurRadius: 5,
                                      spreadRadius: 2)
                                ],
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Colors.green,
                                    Colors.blueGrey
                                  ],
                                ),
                              ),
                              child: Text(
                                'Kaydol',
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          Text(
                            '\n\n$alert',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20),
                            padding: EdgeInsets.all(5),
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[

                                GestureDetector(
                                  onTap: (){
                                   Navigator.pop(context);
                                  },
                                  child: Text(
                                    'Geri Dön',
                                    style: TextStyle(
                                        fontSize: 14, fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),

                    ),
                  ),



                ],
              ),
            )
        )
    );
  }
}

