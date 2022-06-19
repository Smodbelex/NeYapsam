
import 'package:final_project/models/Sorular.dart';

import 'VeriTabaniYardimcisi.dart';

class SorularDao{

  Future<List<Sorular>> onerGetir(String bir,String iki) async{
    print("------ öneri getir -----");
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    print("-----------------------------------------");

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM anaparametre WHERE ana_id IN ('$bir','$iki')");
print(maps);
    return List.generate(maps.length, (i){
      var satir= maps[i];
      return Sorular(satir["ana_id"],satir["ad"]);
    });
  }

  Future<List<SorularAltParam>> altParamBul(String anaid) async{
    print("------ altparam bul -----");
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    print("-----------------------------------------");

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM anaparametre, altparametre WHERE anaparametre.ana_id = altparametre.ana_id and altparametre.ana_id = '$anaid'");
    print(maps);
    print("SELECT * FROM anaparametre, altparametre WHERE anaparametre.ana_id = altparametre.ana_id and altparametre.ana_id = '$anaid'");
    return List.generate(maps.length, (i){
      var satir = maps[i];
      var k = Sorular(satir["anaid"], satir["ad"]);
      var y = SorularAltParam(satir["altprmid"],k);
      return y;
    });
  }
  Future<List<Sorular>> sonTahminGetir(String bir) async{
    print("------ öneri getir -----");
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    print("-----------------------------------------");

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM anaparametre WHERE ana_id = '$bir'");
    print(maps);
    return List.generate(maps.length, (i){
      var satir= maps[i];
      return Sorular(satir["ana_id"],satir["ad"]);
    });
  }
  Future<List<Sorular>> onerGetirUclu(String bir,String iki, String uc) async{
    print("------ öneri getir -----");
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    print("-----------------------------------------");

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM anaparametre WHERE ana_id IN ('$bir','$iki', '$uc')");
    print(maps);
    return List.generate(maps.length, (i){
      var satir= maps[i];
      return Sorular(satir["ana_id"],satir["ad"]);
    });
  }

  Future<List<OnerilerOnceki>>TumOneriler() async{
    print("------ öneri getir -----");
    var db = await VeriTabaniYardimcisi.veritabaniErisim();
    print("-----------------------------------------");

    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM oneriler where username = 'emirhancimen'");
    print(maps);
    return List.generate(maps.length, (i){
      var satir= maps[i];
      return OnerilerOnceki(satir["username"],satir["tarih"],satir["sonuc"],);
    });
  }

  Future<void> OncekiOneriSil() async {
    var db = await VeriTabaniYardimcisi.veritabaniErisim();

    await db.delete("oneriler", where: "username=?", whereArgs: ['emirhancimen']);
  }

}