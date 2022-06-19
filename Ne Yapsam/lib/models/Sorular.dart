class Sorular{
  String? ana_id;
  String? ad;
  Sorular(this.ana_id, this.ad);
}

class SorularAltParam{
  String? altprmid;
  Sorular ana_id;

  SorularAltParam(this.altprmid, this.ana_id);
}
class OnerilerOnceki{
  String username;
  String tarih;
  String sonuc;
  OnerilerOnceki(this.username, this.tarih, this.sonuc);
}