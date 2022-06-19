import 'dart:convert';
import 'package:flutter/material.dart';

class AdminPanel extends StatefulWidget {

  @override
  _AdminPanelState createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  final TextEditingController tfSSY = TextEditingController();
  final TextEditingController tfSSYGSM = TextEditingController();
  final TextEditingController tfSSYMail = TextEditingController();
  final TextEditingController tfPlasiyer = TextEditingController();
  final TextEditingController tfSiparisEleman = TextEditingController();
  final TextEditingController tfBolgeSorumlusu = TextEditingController();
  final TextEditingController tfBolgeGSM = TextEditingController();
  final TextEditingController tfBolgeMail = TextEditingController();
  final TextEditingController tfDepo = TextEditingController();
  final TextEditingController tfDepoAdres = TextEditingController();
  final TextEditingController tfDepoTel = TextEditingController();
  final TextEditingController tfDepoFaks = TextEditingController();
  final TextEditingController tfOneriDrop = TextEditingController();
  final TextEditingController tfBaslik = TextEditingController();
  final TextEditingController tfAciklama = TextEditingController();
  bool _isButtonDisabled = false;
  String? _selectedColor2;
  List<String> _islem = ["ÖNERİ", "TALEP", "ŞİKAYET"];
  String? unvan;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text('ADMIN PANEL', style: TextStyle(color:Colors.black),),
          ],
        ),
      ),
      // backgroundColor: LightColors.kLightYellow,
      backgroundColor: Colors.white,
      body:SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 45),
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
                                Color(0xfff44336),
                                Colors.black,
                              ],
                            ),
                          ),
                          child: Text(
                            'ÜYE İŞLEMLERİ',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){},
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.symmetric(vertical: 45),
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
                                Colors.black,
                                Color(0xfff44336),
                              ],
                            ),
                          ),
                          child: Text(
                            'ÖNERİ İŞLEMLERİ',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
