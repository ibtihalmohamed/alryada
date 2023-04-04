import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:myappecomers/screen/widget/static_widgets/intro_card.dart';
import '../../helpers/consts.dart';
import '../../main.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'clickacble_text_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    List<Widget> listPagesViewModel = [
      IntroCard(
        image: 'assets/onpordingone.png',
        title: AppLocalizations.of(context)!.introne,
      ),
      IntroCard(
        image: 'assets/play.png',
        title: AppLocalizations.of(context)!.introtwo,
      ),
      IntroCard(
        image: 'assets/remot.png',
        title: AppLocalizations.of(context)!.introthree,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("$currentIndex/3"),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ClickableText(
                  text: AppLocalizations.of(context)!.skip,
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     CupertinoPageRoute(
                    //         builder: (context) => const LoginScreen()));
                  }),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
          child: Text(""),
          onPressed: () {
            AppLocalizations.of(context)!.localeName == 'ar'
                ? MyApp.setLocale(context, const Locale('en'))
                : MyApp.setLocale(context, const Locale('ar'));
          }),
      body: Column(
        children: [
          SafeArea(
            child: Image.asset(
              'assets/logo.png',
              height: size.height * 0.2,
              width: size.width * 0.33,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            child: IntroductionScreen(
              rawPages: listPagesViewModel,
              done: Container(
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  child: Text(
                    AppLocalizations.of(context)!.ccontinue,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              next: Container(
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(10)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
                  child: Text(
                    AppLocalizations.of(context)!.ccontinue,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              skip: Text(
                AppLocalizations.of(context)!.skip,
                style: TextStyle(color: mainColor, fontWeight: FontWeight.bold),
              ),
              showSkipButton: true,
              dotsDecorator: DotsDecorator(
                  size: const Size.square(6.0),
                  activeSize: const Size(30.0, 6.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  color: mainColor.withOpacity(0.5),
                  activeColor: mainColor),
              onSkip: () {
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const TabsScreen()));
              },
              onDone: () {
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const LoginScreen()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
