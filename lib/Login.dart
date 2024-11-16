import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'Register.dart';

class Login_page extends StatelessWidget {
  const Login_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'P',
                  style: TextStyle(fontSize: 99, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                child: Text(
                  'Plant your self',
                  style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text(
                  'Organize your time more efficiently',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.amber,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          obscureText: false,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'User',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          check_box(),
                          Text('Remember me'),
                          Expanded(child: SizedBox()),
                          Text('Forgot password')
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don’t have an account?  '),
                          GestureDetector(
                            onTap: () {
                              Get.to(Register_page());
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                          )
                        ],
                      )
                    ],
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

class check_box extends StatefulWidget {
  const check_box({super.key});

  @override
  State<check_box> createState() => _check_boxState();
}

class _check_boxState extends State<check_box> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      activeColor: Colors.red,
      onChanged: (newBool) {
        setState(() {
          isChecked = newBool;
        });
      },
    );
  }
}
