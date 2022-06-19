

import 'package:final_project/models/Users.dart';
import 'package:final_project/models/userBilgi.dart';

import 'VeriTabaniYardimcisi.dart';

class Userdao{

  Future<List<Cnt>> loginKontrolBir(String usr, String sif) async{
    print("------ user kontrol bir -----");
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    print("-----------------------------------------");

    List<Map<String, dynamic>> maps=await db.rawQuery("SELECT count(*) as cnt FROM uyeler WHERE username='$usr' AND sifre='$sif'");

    return List.generate(maps.length, (i){
      var satir= maps[i];
      return Cnt(satir["cnt"]);
    });
  }
  Future<List<Cnt>> KullaniciAdiKontrol(String usr) async{
    print("------ user kontrol bir -----");
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    print("-----------------------------------------");

    List<Map<String, dynamic>> maps=await db.rawQuery("SELECT count(*) as cnt FROM uyeler WHERE username='$usr'");

    return List.generate(maps.length, (i){
      var satir= maps[i];
      return Cnt(satir["cnt"]);
    });
  }
  Future<List<Users>> loginKontrol(String usr, String sif) async{
    print("------ user kontrol -----");
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    print("-----------------------------------------");
      List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM uyeler WHERE username='$usr' AND sifre='$sif'");
      return List.generate(maps.length, (i){
        var satir= maps[i];
        return Users(satir["uyeid"],satir["uyeadi"],satir["uyesoyadi"], satir["username"],satir["sifre"],satir["mail"],satir["telefon"],satir["yetki"]);
      });
  }


  Future<void> KullaniciEkle(String ad, String soyad, String mail, String tel, String username, String sifre) async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String,dynamic>();
    bilgiler["uyeadi"] = ad;
    bilgiler["uyesoyadi"] = soyad;
    bilgiler["username"] = username;
    bilgiler["sifre"] = sifre;
    bilgiler["mail"] = mail;
    bilgiler["telefon"] = tel;
    bilgiler["yetki"] = "üye";

    await db.insert("uyeler", bilgiler);
  }
  Future<void> OneriEkle(String ad) async {
    print('öneri ekle--------------------------------');
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    print('eriştim');
    var bilgiler = Map<String,dynamic>();
    bilgiler["username"] = 'emirhancimen';
    bilgiler["tarih"] = '05.06.2022';
    bilgiler["sonuc"] = ad.toString();
    print("buraya da girdi");
    await db.insert("oneriler", bilgiler);
    print("insert attı");
  }

}