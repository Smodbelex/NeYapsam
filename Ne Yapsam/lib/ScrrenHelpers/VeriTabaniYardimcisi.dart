import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class VeriTabaniYardimcisi{
  static final String veritabaniAdi = "oneriler.sqlite";

  static Future<Database> veritabaniErisim() async {
    print("vte girdi");
    String veritabaniYolu = join(await getDatabasesPath(),veritabaniAdi);
    if(await databaseExists(veritabaniYolu)){
      print("VeritabanÄ± zaten var. Kopyalamaya gerek yok.");
    }
    else{
      ByteData data = await rootBundle.load("veritabani/$veritabaniAdi");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(veritabaniYolu).writeAsBytes(bytes,flush:true);
      print("VeritabanÄ± kopyalandÄ±.");
    }
    return openDatabase(veritabaniYolu);
  }
}