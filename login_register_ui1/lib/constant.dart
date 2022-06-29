// Uygulamada kullanılan renkler vs. bu sınıftan çekilecek bu sayede sadece buradaki renkleri
// değiştirerek tüm uygulama renkleriyle oynayabileceğiz.
// Eğer tasarımlarda kullandığınız renk burada yoksa ekleyin

import 'package:flutter/material.dart';

//Uygulamada kullanılan renk paleti
Color mainColor = Color(0xff4EC7F0);
Color secondColor = Colors.white;
Color textColor = Color(0xffBDBDBD);

//TextField'larda kullanılan renkler
Color tfInsideColor = Color(0xffF6F6F6);
Color tfBorderColor = Color(0xffE8E8E8);

//Kayıt olurken kullanılan regExler
//Şifre firebaseye uygun --> 1 Büyük Harf,1 Rakam minimum 8 karakter uzunluğunda olmalı
//Email'de @ ve . içermeli
String emailRegEx = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
Pattern passwordRegEx = r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$';
