import 'dart:math' as math;
import 'package:final_project/ScrrenHelpers/SorularDao.dart';
import 'package:final_project/models/Sorular.dart';
import 'package:flutter/material.dart';

class OncekiOneri extends StatefulWidget {

  @override
  _OncekiOneriState createState() => _OncekiOneriState();
}

class _OncekiOneriState extends State<OncekiOneri> {
  var tfBasTarih = TextEditingController();
  var tfBitTarih  = TextEditingController();
  bool tarihSecildiMi = false;
  String tar1 = "";

  Future<List<OnerilerOnceki>> tumNotlarGoster() async{
    var notlarListesi= await SorularDao().TumOneriler();
    return notlarListesi;
  }

  Future<void> sil() async{
    await SorularDao().OncekiOneriSil();
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => OncekiOneri()));
  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red, //change your color here
        ),
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text('Önceki Öneriler', style: TextStyle(color:Colors.black),),
          ],
        ),
      ),
      //  backgroundColor: LightColors.kLightYellow,
      backgroundColor: Colors.white,
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: ekranYuksekligi/1.5,
                  width: ekranGenisligi,
                  child: TumSipWid(context),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget TumSipWid(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: ekranGenisligi,
          height: ekranYuksekligi/2,
          child: FutureBuilder<List<OnerilerOnceki>>(
            future: tumNotlarGoster(),
            builder:(context, snapshot){
              if(snapshot.hasData){
                var notlarListesi = snapshot.data;
                return ListView.builder(
                  itemCount: notlarListesi!.length,
                  itemBuilder: (context, indeks){
                    var not = notlarListesi[indeks];
                    return GestureDetector(
                      onTap: (){
                      },
                      child: Card(
                        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                        child: SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(not.tarih.toString() + "-" + not.sonuc.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                              // Text(notlarListesi.length.toString()),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              else{
                return Center();
              }
            },
          ),
        ),
     /*     GestureDetector(
                      onTap: (){
                        sil();
                      },
                      child: Text("HEPSİNİ SİL", style: TextStyle(fontWeight: FontWeight.bold),),
                              // Text(notlarListesi.length.toString()),

                    ), */

      ],
    );
  }

}
/*

return GestureDetector(
                      onTap: (){
                      },
                      child: Card(
                        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),
                        child: SizedBox(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(not.tarih.toString() + "-" + not.sonuc.toString(), style: TextStyle(fontWeight: FontWeight.bold),),
                              // Text(notlarListesi.length.toString()),
                            ],
                          ),
                        ),
                      ),
                    );


 */