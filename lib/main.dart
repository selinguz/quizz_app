import 'package:flutter/material.dart';
import 'package:quizz_app_clone/soruBankas%C4%B1.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

SoruBankasi soruBankasi = SoruBankasi();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SoruSayfasi(),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  const SoruSayfasi({super.key});

  @override
  State<SoruSayfasi> createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> scoreKeeper = [];
  int soruNumarasi = 1;

  List<bool> dogruCevaplar = [];
  List<bool> yanlisCevaplar = [];

  void kontrolEt(bool seciliCevap) {
    bool dogruCevap = soruBankasi.cevapGetir();
    setState(() {
      if (soruBankasi.testBittiMi() == true) {
        scoreKeeper.clear();
        sonucHesapla();
        soruBankasi.sifirla();
        soruNumarasi = 1;
      } else {
        if (seciliCevap == dogruCevap) {
          scoreKeeper.add(Icon(Icons.check_circle, color: Colors.green));
          dogruCevaplar.add(true);
        } else {
          scoreKeeper.add(Icon(Icons.close_sharp, color: Colors.red));
          yanlisCevaplar.add(false);
        }
        soruBankasi.sonrakiSoru();
        soruNumarasi++;
      }
    });
  }

  void sonucHesapla() {
    if (dogruCevaplar.length > yanlisCevaplar.length) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "Tebrikler",
        desc: 'Doğru Cevap Sayınız: ' + dogruCevaplar.length.toString() +
            '\nYanlış Cevap Sayınız: ' + yanlisCevaplar.length.toString(),
        buttons: [
          DialogButton(
            child: Text(
              'Kapat',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    } else if (dogruCevaplar.length == yanlisCevaplar.length) {
      Alert(
        context: context,
        type: AlertType.info,
        title: "Durum Berabere",
        desc: 'Doğru Cevap Sayınız: ' + dogruCevaplar.length.toString() +
            '\nYanlış Cevap Sayınız: ' + yanlisCevaplar.length.toString(),
        buttons: [
          DialogButton(
            child: Text(
              "Kapat",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Kaybettiniz",
        desc: 'Doğru Cevap Sayınız: ' + dogruCevaplar.length.toString() +
            '\nYanlış Cevap Sayınız: ' + yanlisCevaplar.length.toString(),
        buttons: [
          DialogButton(
            child: Text(
              "Kapat",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
      print('kaybettiniz');
    }
    dogruCevaplar.clear();
    yanlisCevaplar.clear();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Bilgi Yarışması'),
          backgroundColor: Colors.deepPurpleAccent[100],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              soruNumarasi.toString() + '. Soru',
              style: TextStyle(fontSize: 22, color: Colors.deepPurple),
            ),
            Container(
              width: 150,
              child: Divider(
                thickness: 0.8,
                color: Colors.deepPurple,
              ),
            ),
            Image.asset(soruBankasi.resimGetir(),width: 250,
            height: 250,),
            const SizedBox(
              height: 45,
            ),
            Text(
              soruBankasi.soruGetir(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepPurple[800],
                fontSize: 18,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    kontrolEt(true);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(18),
                      textStyle: TextStyle(fontSize: 18, letterSpacing: 2)),
                  child: const Text('Doğru'),
                ),
                SizedBox(
                  width: 12,
                ),
                ElevatedButton(
                  onPressed: () {
                    kontrolEt(false);
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(18),
                      textStyle: TextStyle(fontSize: 18, letterSpacing: 2)),
                  child: const Text('Yanlış'),
                ),
              ],
            ),
            Row(
              children: scoreKeeper,
            )
          ],
        ),
      ),
    );
  }
}
