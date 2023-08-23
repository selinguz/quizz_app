import 'package:flutter/material.dart';
import 'package:quizz_app_clone/soru.dart';

class SoruBankasi {
  int _soruSayisi = 0;

  final List<Soru> _soruBankasi = [
    Soru(
      'Some cats are actually allergic to humans',
      true,
      1,
      'assets/images/cat.jpg',
    ),
    Soru(
      'You can lead a cow down stairs but not up stairs.',
      false,
      2,
      'assets/images/cow.jpg',
    ),
    Soru(
      'Approximately one quarter of human bones are in the feet.',
      true,
      3,
      'assets/images/feet.jpg',
    ),
    Soru(
      'A slug\'s blood is green.',
      true,
      4,
      'assets/images/slug.jpg',
    ),
    Soru(
      'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
      true,
      5,
      'assets/images/moon.jpg',
    ),
    Soru(
      'It is illegal to pee in the Ocean in Portugal.',
      true,
      6,
      'assets/images/ocean.jpg',
    ),
    Soru(
      'No piece of square dry paper can be folded in half more than 7 times.',
      false,
      7,
      'assets/images/paper.jpg',
    ),
    Soru(
      'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
      true,
      8,
      'assets/images/uk.jpg',
    ),
    Soru(
      'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
      false,
      9,
      'assets/images/elephant.jpg',
    ),
    Soru(
      'The total surface area of two human lungs is approximately 70 square metres.',
      true,
      10,
      'assets/images/lungs.jpg',
    )
  ];

  void sonrakiSoru() {
    if (_soruSayisi < _soruBankasi.length - 1) {
      _soruSayisi++;
    }
  }

  String resimGetir() {
    return _soruBankasi[_soruSayisi].resim;
}

  String soruGetir() {
    return _soruBankasi[_soruSayisi].soruMetni;
  }

  bool cevapGetir() {
    return _soruBankasi[_soruSayisi].soruYaniti;
  }

  bool testBittiMi() {
    if (_soruSayisi == _soruBankasi.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  int sifirla() {
    _soruSayisi = 0;
    return _soruSayisi;
  }
}
