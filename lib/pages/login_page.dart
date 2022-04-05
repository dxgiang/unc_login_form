import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool checkedValue = false;
  bool register = true;
  List textfieldsStrings = [
    "", //email
    "", //password
  ];
  final _emailKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                //app logo
                Container(
                  width: w,
                  height: h * 0.3,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/signup.png"),
                    ),
                  ),
                ),
                //icon
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 40, 0, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.arrow_back_ios,
                            size: 40, color: Colors.black54),
                      ),
                      Container(
                        width: w * 0.3,
                        padding: EdgeInsets.symmetric(vertical: 13),
                        margin: EdgeInsets.only(left: 20, right: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          border: Border.all(
                              color: Colors.lightBlueAccent, width: 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                "assets/images/vn.png",
                              ),
                              radius: 16,
                            ),
                            Text(
                              "VN",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios, color: Colors.blue),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: h * 0.05),
            Form(
              child: buildTextField(
                "Số điện thoại / Email",
                Icons.person,
                false,
                size,
                (valuemail) {
                  if (valuemail.length < 5) {
                    buildSnackError(
                      'Email không hợp lệ',
                      context,
                      size,
                    );
                    return '';
                  }
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
                      .hasMatch(valuemail)) {
                    buildSnackError(
                      'Email không hợp lệ',
                      context,
                      size,
                    );
                    return '';
                  }
                  return null;
                },
                _emailKey,
                1,
              ),
            ),
            //password
            Form(
              child: buildTextField(
                "Mật khẩu",
                Icons.lock_outline,
                true,
                size,
                (valuepassword) {
                  // if (valuepassword.isEmpty()) {
                  //   return "Required";
                  // }
                  // else
                  if (valuepassword.length < 6) {
                    buildSnackError(
                      'Mật khẩu không hợp lệ',
                      context,
                      size,
                    );
                    return '';
                  }
                  return null;
                },
                _passwordKey,
                2,
              ),
            ),
            // Form(
            //   child: AppTextField(
            //     stringToEdit: 2,
            //     validator: (valuepassword) {
            //       if (valuepassword.length < 6) {
            //         buildSnackError(
            //           'Mật khẩu không hợp lệ',
            //           context,
            //           size,
            //         );
            //         return '';
            //       }
            //       return null;
            //     },
            //     icon: Icons.lock_outline,
            //     hintText: 'Mật khẩu',
            //     size: size,
            //     password: true,
            //     key: _passwordKey,
            //
            //   ),
            // ),

            //forgot password
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 10, 10),
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {},
                child: Text(
                  'Quên mật khẩu',
                  style: TextStyle(
                    color: Colors.blue[500],
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            SizedBox(height: h * 0.02),
            GestureDetector(
              onTap: () {
                if (_emailKey.currentState!.validate()) {
                  if (_passwordKey.currentState!.validate()) {
                    print('login');
                  }
                }
              },
              child: Container(
                width: w,
                padding: EdgeInsets.symmetric(vertical: 15),
                margin: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.shade200,
                        offset: Offset(2, 4),
                        blurRadius: 5,
                        spreadRadius: 2)
                  ],
                ),
                child: Text(
                  'Đăng nhập',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: h * 0.025),
            //signup
            Container(
              width: w,
              padding: EdgeInsets.symmetric(vertical: 13),
              margin: EdgeInsets.only(left: 20, right: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(color: Colors.blueAccent, width: 1),
              ),
              child: Text(
                "Đăng ký",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
    String hintText,
    IconData icon,
    bool password,
    size,
    FormFieldValidator validator,
    Key key,
    int stringToEdit,
  ) {
    return Container(
      width: size.width * 0.9,
      height: size.height * 0.09,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Form(
        key: key,
        child: TextFormField(
          validator: validator,
          textInputAction: TextInputAction.next,
          obscureText: password ? !pwVisible : false,
          decoration: InputDecoration(
            errorStyle: const TextStyle(height: 0),
            hintStyle: const TextStyle(
              color: Color(0xffADA4A5),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            hintText: hintText,
            prefixIcon: Icon(
              icon,
              color: const Color(0xff3d90ff),
            ),
            suffixIcon: password
                ? Padding(
                    padding: EdgeInsets.only(
                      top: size.height * 0.005,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          pwVisible = !pwVisible;
                        });
                      },
                      child: pwVisible
                          ? const Icon(
                              Icons.visibility_off_outlined,
                              color: Color(0xff7B6F72),
                            )
                          : const Icon(
                              Icons.visibility_outlined,
                              color: Color(0xff7B6F72),
                            ),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }

  bool pwVisible = false;

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> buildSnackError(
      String error, context, size) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.black,
        content: SizedBox(
          height: size.height * 0.02,
          child: Center(
            child: Text(error),
          ),
        ),
      ),
    );
  }
}
