import 'package:brainly/ui/pages/register_page.dart';
import 'package:brainly/ui/widgets/button_widget.dart';
import 'package:brainly/ui/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = true;
  bool isRememberMeChecked = false;

  //Form ve TextField Controller
  final formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController pwController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    pwController.dispose();
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
            color: Colors.white.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    buildTextFormField(size, controller: userNameController, labelText: "Email"),
                    SizedBox(height: size.height * 0.02),
                    buildPwInput(size, controller: pwController, labelText: "Şifre"),
                    SizedBox(height: size.height * 0.01),
                    /* Align(
                      alignment: Alignment.topLeft,
                      child: CustomCheckBox(
                        label: "Beni Hatırla",
                        contentPadding: EdgeInsets.zero,
                        value: isRememberMeChecked,
                        onTap: (val) {
                          print(val.toString());
                        },
                        activeColor: mainColor,
                        fontSize: size.height * 0.015,
                        gap: 0,
                      ),
                    ),*/
                    buildRememberMe(size),
                    SizedBox(height: size.height * 0.02),
                    ButtonWidget(
                      size: size,
                      text: "Giriş Yap",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print("Giriş başarılı");
                          loginSuccesful();
                        } else {
                          print("Giriş Başarısız");
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

  void loginSuccesful() {
    //Firebase işlemleri burada login doğruysa
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
            "Giriş Yap",
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
          child: IconButton(
            onPressed: () {},
            icon: FaIcon(
              FontAwesomeIcons.xmark,
              color: Color(0xff656565),
              size: size.height * 0.02,
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 15),
          child: TextButton(
            onPressed: () {
              //Kayıt sayfasına yönlendirme işlemi (GetX)
            },
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
              child: Text(
                "Kayıt",
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

  Container buildRememberMe(Size size) {
    double fontSize = size.height * 0.015;
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
                text: "Beni hatırla",
                style: GoogleFonts.nunitoSans(
                  color: const Color(0xffADA4A5),
                  fontSize: fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        activeColor: mainColor,
        value: isRememberMeChecked,
        checkColor: Colors.white,
        onChanged: (newValue) {
          setState(() {
            isRememberMeChecked = newValue!;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  TextFormField buildTextFormField(Size size, {required TextEditingController controller, required String labelText}) {
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Bu alan boş bırakılamaz";
        } else
          return null;
      },
    );
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
      validator: (value) {},
    );
  }
}
