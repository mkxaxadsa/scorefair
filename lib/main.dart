import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:forLeader/htwrhtwrcwrgr/domains.dart';
import 'package:forLeader/gtwgwtr.dart';
import 'package:forLeader/hwtrhtwcwe.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? inxSc;
late SharedPreferences prxs;
final configMyMatches = FirebaseRemoteConfig.instance;
late SharedPreferences preferencix;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await showRate();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final teamsMatchesController = feawsfdafdas(preferences)..init();
  runApp(MyApp(teamsMatchesController: teamsMatchesController));
}

late SharedPreferences prefers;
final rateCallView = InAppReview.instance;
Future<void> getRatingFromCache() async {
  prefers = await SharedPreferences.getInstance();
}

Future<void> showRate() async {
  await getRatingFromCache();
  bool rateStated = prefers.getBool('rateOur') ?? false;
  if (!rateStated) {
    if (await rateCallView.isAvailable()) {
      rateCallView.requestReview();
      await prefers.setBool('rateOur', true);
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.teamsMatchesController});
  final feawsfdafdas teamsMatchesController;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: teamsMatchesController,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.theme,
        routerConfig: MyRouter.router,
      ),
    );
  }
}
