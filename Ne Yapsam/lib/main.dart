import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/HomePage.dart';
import 'Screens/LoginScreen.dart';
import 'ScrrenHelpers/clipper.dart';

void main() {
  runApp( OneriMain());
}

class OneriMain extends StatelessWidget {
   OneriMain({Key? key}) : super(key: key);
  var mail ="";
  var ceptel ="";
  var sifre="";
  var yetki="";
  var username = "";
  Future<bool> oturumKontrol() async {
    var sp= await SharedPreferences.getInstance();

    String spKullaniciMail = sp.getString("kullanicimail") ?? "kullanıcı mail yok";
    String spSifre = sp.getString("sifre") ?? "sifre yok";
    String spUsername = sp.getString("username") ?? "username yok";
    String spTel = sp.getString("ceptel") ?? "ceptel yok";
    String spYetki = sp.getString("yetki") ?? "yetki yok";
    String spCnt = sp.getString("cnt") ?? "0";

    if(spCnt == "0"){
      return false;
    }
    else if(spKullaniciMail != null && spSifre != null && spUsername != null){
      mail=spKullaniciMail;
      ceptel=spTel;
      sifre =spSifre;
      yetki =spYetki;
      username =spUsername;
      return true;
    }
    else{
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder<bool>(
          future: oturumKontrol(),
          builder:(context,snapshot){
            if(snapshot.hasData){
             // var bilgi = UserBilgi(EMAIL: mail, CEPTEL: ceptel, SONUC:sonuc, HESAPKODU: hesapkod);
              if (snapshot.data == true){print("if true ya girdi"); return HomeScreen();}
              else{print("if false a girdi"); return MyHomePage();}
            }
            else{
              return Container();
            }
          }
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    TextEditingController tfcMail = TextEditingController();
    TextEditingController tfcSifre = TextEditingController();
    var scaffoldKey = GlobalKey<ScaffoldState>();
    @override
    Widget build(BuildContext context) {
      final height = MediaQuery
          .of(context)
          .size
          .height;
      return new WillPopScope(onWillPop: () async => false,
          child: Scaffold(
              key: scaffoldKey,
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
                            SizedBox(height: height * .2),
                            SizedBox(height: 120),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,  MaterialPageRoute(builder: (context) => LoginScreen()));
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
                                  'ÜYE GİRİŞİ',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(height: 100,),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,  MaterialPageRoute(builder: (context) => HomeScreen()));
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
                                      // Color(0xfff44336),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  'ÜYE OLMADAN DEVAM ET',
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                ),
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
