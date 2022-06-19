import 'dart:collection';
import 'package:final_project/ScrrenHelpers/Alerts.dart';
import 'package:final_project/ScrrenHelpers/SorularDao.dart';
import 'package:final_project/ScrrenHelpers/UserDao.dart';
import 'package:final_project/models/Sorular.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnketEkran extends StatefulWidget {
  final List<Sorular> sorular;
  AnketEkran({required this.sorular});
  @override
  _AnketEkranState createState() => _AnketEkranState();
}

class _AnketEkranState extends State<AnketEkran> {

  var sorular = <Sorular>[];
  var oneriler = <SorularAltParam>[];
  bool found = true;
  @override
  void initState() {
    super.initState();
    found = widget.sorular[0].ana_id!.contains(new RegExp(r'[0-9]'));
  }
 Future<void> altprmBul(String anaid) async{
    print("alprmbul fonksiyon + $anaid");
    oneriler = await SorularDao().altParamBul(anaid);
    print("uzunlukkkkkkkkkkkkkkkkkkk: "+oneriler.length.toString());
    if(oneriler.length < 2){
      print("ikiden küçükkk");
      for (var i = 0; i < oneriler.length; i++) {
        found = oneriler[i].altprmid!.contains(new RegExp(r'[0-9]'));
        print(oneriler[i].altprmid.toString() + " -> " + found.toString());
      }
      if (found == false){
        String bir = oneriler[0].altprmid.toString();
        sorular = await SorularDao().sonTahminGetir(bir);
        Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => AnketEkran(sorular: sorular)));
      }
      else{
        String bir = oneriler[0].altprmid.toString();
        sorular = await SorularDao().sonTahminGetir(bir);
        Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => AnketEkran(sorular: sorular)));}

    }

    else if(oneriler.length > 2){

      print("İKİDEN büyük");
      String bir = oneriler[0].altprmid.toString();
      String iki = oneriler[1].altprmid.toString();
      String uc = oneriler[2].altprmid.toString();
      for (var i = 0; i < oneriler.length; i++) {
        found = oneriler[i].altprmid!.contains(new RegExp(r'[0-9]'));
        print(oneriler[i].altprmid.toString() + " -> " + found.toString());
      }
      if (found == false){
        sorular = await SorularDao().onerGetirUclu(bir, iki, uc);
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => AnketEkran(sorular: sorular)));
      }
    }

    else{
      print("ikiiiii");
      String bir = oneriler[0].altprmid.toString();
      String iki = oneriler[1].altprmid.toString();
      print("bir: $bir + iki: $iki");


      for (var i = 0; i < oneriler.length; i++) {
        found = oneriler[i].altprmid!.contains(new RegExp(r'[0-9]'));
        print(oneriler[i].altprmid.toString() + " -> " + found.toString());
      }
      if (found == false){
        sorular = await SorularDao().onerGetir(bir, iki);
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) => AnketEkran(sorular: sorular)));
      }
      else{
        sorular = await SorularDao().onerGetir(bir, iki);
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) => AnketEkran(sorular: sorular)));}

    }

 }
void secimYap(String anaid){
    print("$anaid seçimini kaydettik ! Yine gel");
    oneriKaydet(anaid);
    showAlertDialogSecimYapildi(context);
  //  Navigator.pop(context);
}
Future<void> oneriKaydet(String ad) async{
  await Userdao().OneriEkle(ad);
}
  @override
  Widget build(BuildContext context) {
    return found?Scaffold(
      appBar: AppBar(
        title: Text("Anket Ekranı", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
           // soruSayac !=5 ? Text("${soruSayac+1}.Soru", style:TextStyle(fontSize: 30)):
            Text("Hangisini Tercih Edersin?", style:TextStyle(fontSize: 30)),
            SizedBox(width:250, height: 100,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
                ),
                onPressed: (){
                  altprmBul(widget.sorular[0].ana_id.toString());
                },
                child: Text("${widget.sorular[0].ad} "),
              ),
            ),
            if(widget.sorular.length >1)
            SizedBox(width:250, height: 100,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
                ),
                onPressed: (){
                  altprmBul(widget.sorular[1].ana_id.toString());
                },
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text("${widget.sorular[1].ad}"),
                ),
              ),
            ),
            if(widget.sorular.length >2)
              SizedBox(width:250, height: 100,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
                  ),
                  onPressed: (){
                    altprmBul(widget.sorular[2].ana_id.toString());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("${widget.sorular[2].ad}"),
                  ),
                ),
              ),
          ],
        ),
      ),
    ): Scaffold(
      appBar: AppBar(
        title: Text("Anket Ekranı", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // soruSayac !=5 ? Text("${soruSayac+1}.Soru", style:TextStyle(fontSize: 30)):
            Text("İŞTE ÖNERİLER", style:TextStyle(fontSize: 30)),
            SizedBox(width:250, height: 100,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
                ),
                onPressed: (){
                  secimYap(widget.sorular[0].ad.toString());
                },
                child: Text("${widget.sorular[0].ad} "),
              ),
            ),
            if(widget.sorular.length >1)
              SizedBox(width:250, height: 100,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
                  ),
                  onPressed: (){
                    secimYap(widget.sorular[1].ana_id.toString());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("${widget.sorular[1].ad}"),
                  ),
                ),
              ),
            if(widget.sorular.length >2)
              SizedBox(width:250, height: 100,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0)),
                  ),
                  onPressed: (){
                    secimYap(widget.sorular[2].ana_id.toString());
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text("${widget.sorular[2].ad}"),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
