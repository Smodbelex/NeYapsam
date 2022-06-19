import 'dart:convert';
import 'package:final_project/Screens/AdminPanel.dart';
import 'package:final_project/Screens/OncekiOneriler.dart';
import 'package:final_project/Screens/SignUp.dart';
import 'package:final_project/ScrrenHelpers/SorularDao.dart';
import 'package:final_project/models/Sorular.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import 'AnketEkran.dart';
import 'LoginScreen.dart';
class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var sorular = <Sorular>[];
  String spKullaniciMail="";
  String spSifre="";
  String spUsername="";
  String spTel="";
  String spYetki="";
  String spCnt="";
  Future<void> oturumBilgisiOku() async {

    var sp= await SharedPreferences.getInstance();

    setState(() {
      spKullaniciMail = sp.getString("kullanicimail") ?? "kullanıcı mail yok";
      spSifre = sp.getString("sifre") ?? "sifre yok";
      spUsername = sp.getString("username") ?? "username yok";
      spTel = sp.getString("ceptel") ?? "ceptel yok";
      spYetki = sp.getString("yetki") ?? "yetki yok";
      spCnt = sp.getString("cnt") ?? "0";

    });
  }
  Future<void> cikisYap() async {
    var sp= await SharedPreferences.getInstance();
    sp.remove("kullanicimail");
    sp.remove("sifre");
    sp.remove("ceptel");
    sp.remove("username");
    sp.remove("yetki");
    sp.remove("cnt");
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    oturumBilgisiOku();
    setState(() {
    });

  }
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    if(spCnt == '0')
      return WillPopScope(onWillPop: () async => true ,child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          //backgroundColor: LightColors.kLightYellow,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Öneri Sistemi', style: TextStyle(color:Colors.black),),
            ],
          ),
        ),
        //   backgroundColor: LightColors.kLightYellow,
        backgroundColor: Colors.white,
        body:SafeArea(
          child: Column(
            children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Center(child: Text("Hoşgeldiniz.", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18, fontStyle: FontStyle.italic),)),
                ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                    child: Text(
                      "Öneri sonuçlarını kaydetmek, daha sonra görüntülemek ve bize mesaj göndermek için üye olabilirsiniz.",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16, fontStyle: FontStyle.italic),)),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => KaydolScreen()));
                  },

                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(5)),
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
                      'ÜYE OL',
                      style: TextStyle(
                          fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                    child: Text(
                      "Ya da sadece anketi doldurabilirsiniz.",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16, fontStyle: FontStyle.italic),)),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: GestureDetector(
                  onTap: () async {
                      sorular = await SorularDao().onerGetir("0","1");
                     // print(sorular[0].ad.toString() + sorular[0].ana_id.toString());
                      // soruYukle();
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => AnketEkran(sorular: sorular)));
                  },

                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(5)),
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
                          Colors.deepOrange,
                          Colors.orange
                        ],
                      ),
                    ),
                    child: Text(
                      'ANKETE BAŞLA',
                      style: TextStyle(
                          fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      );
    if(spCnt == '1')
      return WillPopScope(onWillPop: () async => false ,child: Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //backgroundColor: LightColors.kLightYellow,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Öneri Sistemi', style: TextStyle(color:Colors.black),),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top:18.0, right:8.0),
            child: GestureDetector(
                onTap: (){
                  cikisYap();
                },
                child: Text("Çıkış Yap", style: TextStyle(color: Colors.red),)),
          ),
        ],
      ),
      //   backgroundColor: LightColors.kLightYellow,
      backgroundColor: Colors.white,
      body:SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              if(spYetki == 'admin')
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,  MaterialPageRoute(builder: (context) => AdminPanel()));
                    },
                    child: Card(

                      color: Colors.red,
                      child: SizedBox(
                        height: 70,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Admin Paneline Geçmek İçin Tıklayın", style: TextStyle(color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(child: Text("Hoşgeldiniz, $spUsername .", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 18, fontStyle: FontStyle.italic),)),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                    child: Text(
                      "Geçmiş anket sonuçlarınızı görüntüleyebilirsiniz.",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16, fontStyle: FontStyle.italic),)),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => OncekiOneri()));
                  },

                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(5)),
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
                      'ÖNCEKİ ÖNERİLER',
                      style: TextStyle(
                          fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Center(
                    child: Text(
                      "Ya da sadece anketi doldurabilirsiniz.",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16, fontStyle: FontStyle.italic),)),
              ),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: GestureDetector(
                  onTap: () async {
                    sorular = await SorularDao().onerGetir("0","1");
                    // print(sorular[0].ad.toString() + sorular[0].ana_id.toString());
                    // soruYukle();
                    Navigator.push(context,  MaterialPageRoute(builder: (context) => AnketEkran(sorular: sorular)));
                  },

                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: EdgeInsets.symmetric(vertical: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(5)),
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
                          Colors.deepOrange,
                          Colors.orange
                        ],
                      ),
                    ),
                    child: Text(
                      'ANKETE BAŞLA',
                      style: TextStyle(
                          fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
              ],
          ),
        ),
      ),
    ),
    );
    else
      return Text("git");
  }
  }

