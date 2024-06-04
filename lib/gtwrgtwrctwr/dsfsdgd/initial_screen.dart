import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:forLeader/htergtwrg.dart';
import 'package:forLeader/gtwgwtr.dart';
import 'package:forLeader/hwtrhtwcwe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class fasdfdasfdascsa extends StatefulWidget {
  const fasdfdasfdascsa({super.key});

  @override
  State<fasdfdasfdascsa> createState() => _fasdfdasfdascsaState();
}

class _fasdfdasfdascsaState extends State<fasdfdasfdascsa> {
  var _waiting = true;

  @override
  void initState() {
    super.initState();
    _startApp();
  }

  Future<void> _startApp() async {
    final prefes = await SharedPreferences.getInstance();
    rr(prefes);
    final firstSesstion = prefes.getBool('firstSession') ?? true;
    if (firstSesstion) {
      setState(() {
        _waiting = false;
      });
      return;
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.go(MyRouter.matches);
    });
  }

  Future<void> rr(SharedPreferences shPre) async {
    final rev = InAppReview.instance;
    bool alreadyRated = shPre.getBool('rate') ?? false;
    if (!alreadyRated) {
      if (await rev.isAvailable()) {
        rev.requestReview();
        await shPre.setBool('rate', true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_waiting) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        ),
      );
    }
    return const csdcdsfas();
  }
}

class csdcdsfas extends StatefulWidget {
  const csdcdsfas({super.key});

  @override
  State<csdcdsfas> createState() => _csdcdsfasState();
}

class _csdcdsfasState extends State<csdcdsfas> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          FirstSessionItem(
            bigText: 'Start Your Journey',
            smallText: 'Access the latest data insights for smarter betting',
            imgPath: 'images/stadium-931975_1280.jpg',
            index: 0,
            onTap: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
          ),
          FirstSessionItem(
            bigText: 'Expert Tips',
            smallText: 'Discover top betting strategies from industry experts',
            imgPath: 'images/football-5180297_1280.jpg',
            index: 1,
            onTap: () {
              _pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
            },
          ),
          FirstSessionItem(
            bigText: 'Monitor Performance',
            smallText:
                'Keep up with the latest match updates and performance metrics',
            imgPath: 'images/ball-488718_640.jpg',
            index: 2,
            onTap: () async {
              final pref = await SharedPreferences.getInstance();
              await pref.setBool('firstSession', false);
              context.go(MyRouter.matches);
            },
          ),
        ],
      ),
    );
  }
}

class FirstSessionItem extends StatelessWidget {
  const FirstSessionItem(
      {super.key,
      required this.imgPath,
      required this.bigText,
      required this.smallText,
      required this.onTap,
      required this.index});
  final String imgPath;
  final String bigText;
  final String smallText;
  final VoidCallback onTap;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imgPath),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Text(
              bigText,
              style: context.textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            Text(
              smallText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color.fromARGB(255, 199, 198, 198),
                fontSize: 16,
              ),
            ),
            const Spacer(flex: 10),
            MyButton(title: 'Next', onTap: onTap),
            const SizedBox(height: 20),
            MyStepper(currentIndex: index),
            const SizedBox(height: 40),
            const Text(
              'Terms of use  |  Privacy Policy',
              style: TextStyle(
                fontSize: 14,
                color: MyTheme.grey,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class MyStepper extends StatelessWidget {
  const MyStepper({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Row(
        children: List.generate(
          3,
          (index) => Expanded(
            flex: index == currentIndex ? 3 : 1,
            child: Container(
              margin: EdgeInsets.only(right: index != 2 ? 8 : 0),
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: index == currentIndex ? Colors.purple : MyTheme.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
