import 'dart:math';
import 'package:final_project/Screens/HomePage.dart';
import 'package:final_project/ScrrenHelpers/UserDao.dart';
import 'package:final_project/models/Users.dart';
import 'package:final_project/models/userBilgi.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'SignUp.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var user = <Users>[];
  var a = <Cnt>[];
  TextEditingController tfcMail = TextEditingController();
  TextEditingController tfcSifre = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;

        Future<void> girisKontrol(usr, pas) async {
        var sp = await SharedPreferences.getInstance();
        sp.setString("kullanicimail", tfcMail.text);
        sp.setString("sifre", tfcSifre.text);
        print("bilgiler: \n usr: $usr \nsif: $pas");
        a = await Userdao().loginKontrolBir(usr, pas);
        print(a[0].cnt);
        sp.setString("cnt", a[0].cnt.toString());
        if(a[0].cnt == 1){
         user = await Userdao().loginKontrol(usr, pas);
         sp.setString("kullanicimail", user[0].mail);
         sp.setString("sifre", user[0].sifre);
         sp.setString("username", user[0].username);
         sp.setString("yetki", user[0].yetki);
         sp.setString("ceptel", user[0].telefon);
         Navigator.push(context,  MaterialPageRoute(builder: (context) => HomeScreen()));
        }
        else{
          print("yok");
        }
      }

    return new WillPopScope(onWillPop: () async => true,
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
                          SizedBox(height: 60),
                          Column(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                  children: <Widget>[
                                    Text(
                                      "Kullanıcı Adı",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                        controller: tfcMail,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            fillColor: Color(0xfff3f3f4),
                                            filled: true))
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start,
                                  children: <Widget>[
                                    Text(
                                      "Şifre",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                        controller: tfcSifre,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            fillColor: Color(0xfff3f3f4),
                                            filled: true))
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                               girisKontrol(tfcMail.text, tfcSifre.text);
                              /*  print(tfcMail.text + "  " + tfcSifre.text);
                        if(tfcMail.text != "emel")
                          showAlertDialogKullaniciKontrol(context);
                        else
                           Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => HomeScreen()));
                           */

                            },

                            child: Container(
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              padding: EdgeInsets.symmetric(vertical: 15),
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
                                'Giris',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.centerRight,
                            child: GestureDetector(
                              onTap: () {
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => SifremiUnuttumScreen()));
                              },
                              child: Text('Sifremi Unuttum ?',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          SizedBox(height: height * .055),
                          InkWell(
                            onTap: () {
                              /*  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));*/
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              padding: EdgeInsets.all(15),
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  /*Text(
                            'Uye olmadan devam et ! ',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w600),
                          ),*/
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                         Navigator.push(context,MaterialPageRoute(builder: (context) => KaydolScreen()));
                                    },
                                    child: Text(
                                      'Kaydol',
                                      style: TextStyle(
                                          color: Color(0xfff44336),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ],
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
