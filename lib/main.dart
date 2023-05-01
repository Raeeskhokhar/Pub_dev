import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';
import 'package:badges/badges.dart' as badges;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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
      home: myhome(),
    );
  }
}

class myhome extends StatefulWidget {
  const myhome({super.key});

  @override
  State<myhome> createState() => _myhomeState();
}

class _myhomeState extends State<myhome> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          title: Text('Pub dev Ch # 7'),
          bottom: TabBar(tabs: [
            Text('Awesome Icons'),
            Text('Pin Field,  Readmore'),
            Text('Badges,   animatedText'),
          ]),
        ),
        body: TabBarView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(FontAwesomeIcons.house),
                Icon(FontAwesomeIcons.angleDown),
                Icon(FontAwesomeIcons.alignCenter),
              ],
            ),
            //2nd Tab
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ReadMoreText(
                    " since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    // trimCollapsedText: 'show more',
                    // trimExpandedText: 'show less',
                    textAlign: TextAlign.justify,
                    moreStyle: TextStyle(color: Colors.red),
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                Container(
                  width: 300,
                  child: Divider(
                    color: Colors.black,
                    thickness: 2,
                  ),
                ),
                Container(
                  width: 300,
                  child: PinCodeTextField(
                    keyboardType: TextInputType.number,
                    appContext: context,
                    length: 5,
                    onChanged: (value) {},
                    // obscureText: true,
                    // obscuringCharacter: '*',
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      selectedColor: Colors.green,
                    ),
                  ),
                )
              ],
            ),
            //3rd Tab
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    badges.Badge(
                      child: Icon(FontAwesomeIcons.cartArrowDown),
                      badgeContent: Text('2'),
                    ),
                    //copy different data and paste here and see results from pub.dev>animated text
                    AnimatedTextKit(
                      animatedTexts: [
                        ScaleAnimatedText('Discipline is the best tool'),
                        TypewriterAnimatedText('Design first, then code'),
                        TypewriterAnimatedText(
                            'Do not patch bugs out, rewrite them'),
                        TypewriterAnimatedText(
                            'Do not test bugs out, design them out'),
                      ],
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
