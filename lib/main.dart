import 'package:flutter/material.dart';
import 'package:task3/home_page.dart';
import 'package:task3/validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isObscure = true;
  GlobalKey<FormState> key = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Column(
            children: [
              SizedBox(
                  height: 350,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: ClipPath(
                            clipper: MyPainter(),
                            child: Container(
                              height: 100,
                              color: const Color.fromARGB(255, 11, 38, 185),
                            ),
                          )),
                      const Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          bottom: 30,
                          child: Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ))
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, top: 30),
                child: TextFormField(
                  validator: (value) => validatorInputs(
                      value: value,
                      max_length: 50,
                      min_length: 4,
                      type: 'email'),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 11, 38, 185))),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Color.fromARGB(255, 110, 127, 224),
                      ),
                      hintStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 110, 127, 224)),
                      hintText: 'email',
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: TextFormField(
                  validator: (value) => validatorInputs(
                      value: value,
                      max_length: 50,
                      min_length: 4,
                      type: 'password'),
                  obscureText: isObscure,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 11, 38, 185))),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (isObscure == true) {
                                isObscure = false;
                              } else {
                                isObscure = true;
                              }
                              print(isObscure);
                            });
                          },
                          icon: Icon(
                            isObscure == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: const Color.fromARGB(255, 110, 127, 224),
                          )),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Color.fromARGB(255, 110, 127, 224),
                      ),
                      hintStyle: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 110, 127, 224)),
                      hintText: 'password',
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, top: 40),
                child: InkWell(
                  onTap: () {
                    if (key.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePage(),
                          ));
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 11, 38, 185)),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30, top: 10),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: const Color.fromARGB(255, 11, 38, 185)),
                        color: Colors.white),
                    child: const Text(
                      'signup',
                      style: TextStyle(
                          color: Color.fromARGB(255, 11, 38, 185),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();
    path.lineTo(0, size.height);
    var firstStrart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.50, size.height - 50);
    path.quadraticBezierTo(
        firstStrart.dx, firstStrart.dy, firstEnd.dx, firstEnd.dy);
    var lastStrart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    var lastEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(
        lastStrart.dx, lastStrart.dy, lastEnd.dx, lastEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
