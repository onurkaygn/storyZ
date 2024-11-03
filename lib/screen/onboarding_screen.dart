import 'package:flutter/material.dart';
import 'package:flutter_story_application/helper/global.dart';
import 'package:flutter_story_application/model/onboard.dart';
import 'package:flutter_story_application/screen/home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();
    final list = [
      Onboard(
        title: 'This is our title text one',
        subtitle: 'Also this is going to be our subtitle text one',
        pics: 'ob1',
      ),
      Onboard(
        title: 'This is our title text two',
        subtitle: 'Also this is going to be our subtitle text two',
        pics: 'ob2',
      ),
      Onboard(
        title: 'This is our title text three',
        subtitle: 'Also this is going to be our subtitle text three',
        pics: 'ob3',
      ),
    ];

    return Scaffold(
      body: PageView.builder(
          controller: c,
          itemCount: list.length,
          itemBuilder: (ctx, ind) {
            final isLast = ind == list.length - 1;
            return Column(
              children: [
                // Image
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/${list[ind].pics}.png',
                    height: mq.height * .6,
                    width: mq.width * .75, // Boyutun %75'i
                  ),
                ),

                // Title
                Text(
                  list[ind].title,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      letterSpacing: .5),
                ),

                SizedBox(
                  height: mq.height * .01,
                ),

                // Subtitle
                SizedBox(
                  width: mq.width * .7,
                  child: Text(
                    list[ind].subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 13.5,
                        letterSpacing: .5,
                        color: Colors.black54),
                  ),
                ),
                const Spacer(),

                // Dots
                Wrap(
                  spacing: 20,
                  children: List.generate(
                      list.length,
                      (i) => Container(
                            width: i == ind ? 15 : 10,
                            height: 8,
                            decoration: BoxDecoration(
                                color: i == ind
                                    ? const Color.fromRGBO(122, 185, 45, 1)
                                    : Colors.black12,
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(5))),
                          )),
                ),
                const Spacer(),

                // Button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    elevation: 0,
                    textStyle: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.w500),
                    minimumSize: Size(mq.width * .7, 30),
                    backgroundColor: const Color.fromRGBO(122, 185, 45, 1),
                  ),
                  onPressed: () {
                    if (isLast) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => HomeScreen()));
                    } else {
                      c.nextPage(
                          duration: const Duration(milliseconds: 700),
                          curve: Curves.easeInOut);
                    }
                  },
                  child: Text(
                    isLast ? "Let's Go!" : 'Next',
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            );
          }),
    );
  }
}
