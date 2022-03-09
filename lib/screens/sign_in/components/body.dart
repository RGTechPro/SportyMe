import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/components/no_account_text.dart';
import 'package:shop_app/components/socal_card.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import '../../../custom_text.dart';
import '../../../firebase/auth_services.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/icon.svg',
                  width: 300,
                ),
                // SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Welcome to SportyMe",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.075,
                  width: SizeConfig.screenWidth * 0.8,
                  child: !Provider.of<Auth>(context, listen: false).isLoading
                      ? ElevatedButton(
                          onPressed: () async {
                            try {
                              await Provider.of<Auth>(context, listen: false)
                                  .signInWithGoogle(context);

                              // Provider.of<Auth>(context, listen: false)
                              //     .setUser(googleUserCred.user);
//                            Provider.of<Auth>(context, listen: false).addUser();
                              if (Provider.of<Auth>(context, listen: false)
                                      .getUser() !=
                                  null) {
                                Navigator.of(context)
                                    .popUntil((route) => route.isFirst);

                                Navigator.pushReplacementNamed(
                                    context, HomeScreen.routeName);
                                final snackBar =
                                    const SnackBar(content: Text('Logged In!'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                              setState(() {
                                Provider.of<Auth>(context, listen: false)
                                    .isLoading = false;
                              });
                            } catch (e) {
                              setState(() {
                                Provider.of<Auth>(context, listen: false)
                                    .isLoading = false;
                              });
                              ;
                            }
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                'assets/icons/google-icon.svg',
                                width: 25,
                              ),
                              CustomText(
                                text: 'SignIn with Google',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ],
                          ))
                      : const CircularProgressIndicator(
                          color: Colors.redAccent,
                        ),
                )

                // Text(
                //   "Sign in with your email id and password  \nor continue with social media handles",
                //   textAlign: TextAlign.center,
                // ),
                // SizedBox(height: SizeConfig.screenHeight * 0.08),
                // SignForm(),
                // SizedBox(height: SizeConfig.screenHeight * 0.08),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SocalCard(
                //       icon: "assets/icons/google-icon.svg",
                //       press: () =>
                //           Navigator.pushNamed(context, HomeScreen.routeName),
                //     ),
                //     SocalCard(
                //       icon: "assets/icons/facebook-2.svg",
                //       press: () {},
                //     ),
                //     SocalCard(
                //       icon: "assets/icons/twitter.svg",
                //       press: () {},
                //     ),
                //   ],
                // ),
                //SizedBox(height: getProportionateScreenHeight(20)),
                //    NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
