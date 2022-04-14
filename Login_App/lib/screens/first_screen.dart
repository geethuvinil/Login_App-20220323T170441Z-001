import 'package:flutter/material.dart';
import 'package:login_app/fireapi.dart';
import 'package:login_app/screens/second_screen.dart';
class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:SingleChildScrollView(
        child:Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    "Continue with Invite Code",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: TextField(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      keyboardType: TextInputType.text,
                      onChanged: (String textvalue) {
                        print("value entered" + textvalue);
                      },
                      controller: controller,
                      decoration: InputDecoration(
                        fillColor: Colors.black,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: "Add Invite Code",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                FlatButton(
                  onPressed: () async {
                    bool isPresent =
                    await FireApi.tokenCheck(code: controller.text);
                    if (isPresent) {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => HomeScreen()));
                    } else {
                      ScaffoldMessenger.of(context).showMaterialBanner(
                        MaterialBanner(
                          content: Text(
                            "Invalid code,please try again",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          actions: [Container()],
                          backgroundColor: Colors.red,
                        ),
                      );
                      Future.delayed(const Duration(seconds: 2), () {
                        ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                      });
                    }
                  },
                  child: Text(
                    "Continue",
                  ),
                  color: Colors.greenAccent,
                  textColor: Colors.white,
                  highlightColor: Colors.red,
                  splashColor: Colors.green,
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "No invite code?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                Text(
                  " If you want an invite code and get early access,",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'please fill out',
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(color: Colors.white, fontSize: 10),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'this form',
                              style: Theme.of(context).textTheme.caption?.copyWith(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor:Colors.white)),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.open_in_new,
                      color: Colors.white,
                      size: 10,
                    )
                  ],
                )
              ],
            )),));
  }
}
