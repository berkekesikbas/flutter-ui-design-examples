import 'package:brainly/ui/widgets/button_widget.dart';
import 'package:brainly/ui/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Dropdown dil seçeneği listesi
  String? dropDownValue = null;
  var items = [
    'Yaşadığın Ülkeyi Seç',
    'Türkiye',
    'İngiltere',
  ];
  bool isPasswordVisible = true;
  bool isPasswordRepeatVisible = true;
  bool isPrivacyChecked = false;

  //Form ve TextField Controller
  final formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pwController = TextEditingController();
  final TextEditingController pwRepeatController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    nameController.dispose();
    surNameController.dispose();
    emailController.dispose();
    pwController.dispose();
    pwRepeatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar(context, size),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Card(
            elevation: 0,
            color: secondColor.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    buildTextFormField(size, controller: userNameController, labelText: "Kullanıcı Adı"),
                    SizedBox(height: size.height * 0.02),
                    buildNameInput(size),
                    SizedBox(height: size.height * 0.02),
                    buildTextFormField(size, controller: emailController, labelText: "Email", isEmail: true),
                    SizedBox(height: size.height * 0.02),
                    buildPwInput(size, controller: pwController, labelText: "Şifre"),
                    SizedBox(height: size.height * 0.02),
                    buildPwRepeatInput(size, controller: pwRepeatController, labelText: "Şifre Tekrar"),
                    SizedBox(height: size.height * 0.02),
                    buildDropDown(size),
                    SizedBox(height: size.height * 0.02),
                    buildPrivacyTerms(size),
                    SizedBox(height: size.height * 0.02),
                    ButtonWidget(
                      size: size,
                      text: "Tamamla",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (dropDownValue != null && dropDownValue != "Yaşadığın Ülkeyi Seç" && isPrivacyChecked == true) {
                            //Firebase kayıt ol işlemleri
                            print("Kayıt Onaylandı");
                          } else {
                            //Showsnackbar işlemi
                            print("Formu eksiksiz doldurduğunuzdan emin olun");
                          }
                        }
                      },
                    ),
                    SizedBox(height: size.height * 0.04),
                    SocialButton(
                        buttonText: "Google",
                        imagePath:
                            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/crypto%2Fsearch%20(2).png?alt=media&token=24a918f7-3564-4290-b7e4-08ff54b3c94c",
                        size: size,
                        onPressed: () {}),
                    SizedBox(height: size.height * 0.01),
                    SocialButton(
                        buttonText: "Apple",
                        imagePath:
                            "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/socials%2Fapple-black-logo.png?alt=media&token=c44581fa-6fd2-4ae2-bd85-18bfbe6386d2",
                        size: size,
                        onPressed: () {}),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row buildNameInput(Size size) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: size.width / 2.4,
          child: buildTextFormField(size, controller: nameController, labelText: "İsim"),
        ),
        SizedBox(width: size.width * 0.04),
        SizedBox(
          width: size.width / 2.4,
          child: buildTextFormField(size, controller: surNameController, labelText: "Soyisim"),
        ),
      ],
    );
  }

  AppBar appBar(BuildContext context, Size size) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Kayıt",
            style: GoogleFonts.inter(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: size.height * 0.032,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: EdgeInsets.only(left: 15, top: 5),
        child: Center(
          child: FaIcon(
            FontAwesomeIcons.xmark,
            color: Color(0xff656565),
            size: size.height * 0.02,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: TextButton(
            onPressed: () {
              //Giriş sayfasına yönlendirme
            },
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              child: Text(
                "Giriş",
                style: GoogleFonts.nunitoSans(
                  color: mainColor,
                  fontSize: size.height * 0.02,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Container buildPrivacyTerms(Size size) {
    double fontSize = size.height * 0.013;
    return Container(
      width: size.width * 1,
      child: CheckboxListTile(
        visualDensity: VisualDensity.compact,
        autofocus: true,
        contentPadding: EdgeInsets.zero,
        title: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
            children: [
              TextSpan(
                text: "Kayıt olduğunuz takdirde, uygulamanın ",
                style: GoogleFonts.nunitoSans(
                  color: const Color(0xffADA4A5),
                  fontSize: fontSize,
                ),
              ),
              WidgetSpan(
                child: InkWell(
                  onTap: () {
                    print('Kullanım Koşulları');
                  },
                  child: Text(
                    "Kullanım Koşulları'nı",
                    style: GoogleFonts.nunitoSans(
                      color: const Color(0xffADA4A5),
                      decoration: TextDecoration.underline,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              TextSpan(
                text: " ve ",
                style: GoogleFonts.nunitoSans(
                  color: const Color(0xffADA4A5),
                  fontSize: fontSize,
                ),
              ),
              WidgetSpan(
                child: InkWell(
                  onTap: () {
                    // ignore: avoid_print
                    print("Gizlilik Sözleşmesi");
                  },
                  child: Text(
                    "Gizlilik Sözleşmesi'ni",
                    style: GoogleFonts.nunitoSans(
                      color: const Color(0xffADA4A5),
                      decoration: TextDecoration.underline,
                      fontSize: fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              TextSpan(
                text: " kabul etmiş sayılırsınız.",
                style: GoogleFonts.nunitoSans(
                  color: const Color(0xffADA4A5),
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ),
        activeColor: mainColor,
        value: isPrivacyChecked,
        checkColor: secondColor,
        onChanged: (newValue) {
          setState(() {
            isPrivacyChecked = newValue!;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  DecoratedBox buildDropDown(Size size) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: tfInsideColor,
        border: Border.all(color: tfBorderColor, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton(
        iconEnabledColor: Colors.black,
        iconSize: size.height * 0.04,
        underline: Container(),
        style: GoogleFonts.nunitoSans(
          color: Color(0xffBDBDBD),
        ),
        elevation: 2,
        isExpanded: true,
        value: dropDownValue,
        items: items.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Padding(
              padding: EdgeInsets.all(size.height * 0.008),
              child: items == "Yaşadığın Ülkeyi Seç"
                  ? Text(
                      items,
                      style: GoogleFonts.nunitoSans(
                        color: Color(0xffBDBDBD),
                      ),
                    )
                  : Text(
                      items,
                      style: GoogleFonts.nunitoSans(
                        color: Colors.black54,
                      ),
                    ),
            ),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropDownValue = newValue!;
          });
        },
      ),
    );
  }

  TextFormField buildTextFormField(Size size,
      {required TextEditingController controller, required String labelText, bool? isEmail}) {
    return TextFormField(
        textInputAction: TextInputAction.next,
        cursorColor: Colors.black45,
        decoration: InputDecoration(
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: tfBorderColor.withOpacity(1),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          errorMaxLines: 2,
          errorStyle: GoogleFonts.nunitoSans(color: mainColor),
          isDense: false,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: tfBorderColor.withOpacity(1),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          errorBorder: OutlineInputBorder(borderSide: BorderSide(color: tfBorderColor), borderRadius: BorderRadius.circular(5)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: tfBorderColor), borderRadius: BorderRadius.circular(5)),
          contentPadding: EdgeInsets.all(size.height * 0.008),
          label: Text(
            labelText,
            style: GoogleFonts.nunitoSans(color: Color(0xffBDBDBD), fontSize: 14),
          ),
          filled: true,
          fillColor: tfInsideColor.withOpacity(1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        controller: controller,
        validator: isEmail == true
            ? (value) {
                if (value!.isEmpty || !RegExp(emailRegEx.toString()).hasMatch(value)) {
                  return "Hatalı girdiniz";
                } else
                  return null;
              }
            : (value) {
                if (value == null || value.isEmpty) {
                  return "Bu alan boş bırakılamaz";
                } else
                  return null;
              });
  }

  TextFormField buildPwInput(Size size, {required TextEditingController controller, required String labelText}) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      cursorColor: Colors.black45,
      decoration: InputDecoration(
        errorStyle: GoogleFonts.nunitoSans(color: mainColor),
        isDense: true,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: tfBorderColor.withOpacity(1),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: tfBorderColor.withOpacity(1),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: tfBorderColor), borderRadius: BorderRadius.circular(5)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: tfBorderColor), borderRadius: BorderRadius.circular(5)),
        contentPadding: EdgeInsets.all(size.height * 0.008),
        label: Text(
          labelText,
          style: GoogleFonts.nunitoSans(color: Color(0xffBDBDBD), fontSize: 14),
        ),
        filled: true,
        fillColor: tfInsideColor.withOpacity(1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: TextButton(
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
          child: isPasswordVisible
              ? Text(
                  "Göster",
                  style: GoogleFonts.nunitoSans(color: mainColor),
                )
              : Text(
                  "Gizle",
                  style: GoogleFonts.nunitoSans(color: mainColor),
                ),
        ),
      ),
      obscureText: isPasswordVisible,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty || !RegExp(passwordRegEx.toString()).hasMatch(value)) {
          return "Şifre en az 8 karakter ve 1 büyük harf ve rakam içermelidir";
        } else
          return null;
      },
    );
  }

  TextFormField buildPwRepeatInput(Size size, {required TextEditingController controller, required String labelText}) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      cursorColor: Colors.black45,
      decoration: InputDecoration(
        errorStyle: GoogleFonts.nunitoSans(color: mainColor),
        isDense: true,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: tfBorderColor.withOpacity(1),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: tfBorderColor.withOpacity(1),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(borderSide: BorderSide(color: tfBorderColor), borderRadius: BorderRadius.circular(5)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: tfBorderColor), borderRadius: BorderRadius.circular(5)),
        contentPadding: EdgeInsets.all(size.height * 0.008),
        label: Text(
          labelText,
          style: GoogleFonts.nunitoSans(color: Color(0xffBDBDBD), fontSize: 14),
        ),
        filled: true,
        fillColor: tfInsideColor.withOpacity(1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        suffixIcon: TextButton(
          onPressed: () {
            setState(() {
              isPasswordRepeatVisible = !isPasswordRepeatVisible;
            });
          },
          child: isPasswordRepeatVisible
              ? Text(
                  "Göster",
                  style: GoogleFonts.nunitoSans(color: mainColor),
                )
              : Text(
                  "Gizle",
                  style: GoogleFonts.nunitoSans(color: mainColor),
                ),
        ),
      ),
      obscureText: isPasswordRepeatVisible,
      controller: controller,
      validator: (value) {
        if (pwController.text != value) {
          return "Şifreler birbiriyle uyuşmuyor";
        } else
          return null;
      },
    );
  }
}
