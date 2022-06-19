import 'package:final_project/Screens/HomePage.dart';
import 'package:flutter/material.dart';
showAlertDialogKullaniciVar(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("Tamam"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Kullanıcı Kontrolü!"),
    content: Text("Bu kullanıcı adına kayıtlı üye var"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
showAlertDialogSecimYapildi(BuildContext context) {
  // Create button
  Widget okButton = FlatButton(
    child: Text("Tamam"),
    onPressed: () {
      Navigator.of(context).pop();
      Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => HomeScreen()));
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Seçimini Kaydettik!"),
    content: Text("Ne yapacağına karar veremediğinde yine gel!"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}