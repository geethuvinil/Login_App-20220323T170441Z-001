import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar:AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: Navigator.canPop(context)
            ? IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.greenAccent,
            size: 30,
          ),
          onPressed: () => Navigator.of(context).pop(),
        )
            : null,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child:Text("Please provide your number",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            IntlPhoneField(
              dropdownIcon: Icon(Icons.arrow_drop_down,color: Colors.white,),

              dropdownTextStyle: TextStyle(
                color: Colors.white,
              ),
              initialCountryCode: "+91",
              showCountryFlag: false,
              showCursor: true,
              showDropdownIcon: true,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
              decoration: InputDecoration(
                iconColor: Colors.red,

                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.green,
                    width:1,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                hintText: "9553976683",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight:FontWeight.w100,
                ),
              ),
              onChanged: (phone) {
                print(phone.completeNumber);

              },
              onCountryChanged: (country) {
                print('Country changed to: ' + country.name);
              },
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text("We will send an OTP to verify this \n number",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
              onPressed: (){
                Navigator.of(context).pushNamed('continue');
              },
              child:Text("Continue"),
              color:Colors.greenAccent,
              textColor: Colors.white,
              highlightColor: Colors.red,
              splashColor: Colors.green,
            ),

            SizedBox(
              height: 10,
            ),
            Row(
                children: <Widget>[
                  Expanded(
                      child: Divider(color: Colors.white,thickness: 0.5,)
                  ),

                  Text("Or",
                    style:TextStyle(
                      color: Colors.white,
                    ),),

                  Expanded(
                      child: Divider(color: Colors.white,thickness: 0.5,)
                  ),
                ]
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  const BorderSide(
                    color: Colors.green,
                    width:1,
                  ),
                ),
                shape: MaterialStateProperty.all(
                  const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),

                  ),

                ),
              ),
              onPressed: (){
                print("Outline button");
              },

              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30.0,
                    width: 30.0,
                    decoration: BoxDecoration(

                      image: DecorationImage(
                          image:
                          AssetImage('assets/google.png'),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                    ),

                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("Continue with Google",
                    style:TextStyle(
                      color: Colors.white,
                    ),

                  ),
                ],
              ),

            ),

          ],),),
    );
  }
}