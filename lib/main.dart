import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
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
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final teamsMatchesController = feawsfdafdas(preferences)..init();
  runApp(MyApp(teamsMatchesController: teamsMatchesController));
}

late SharedPreferences prefers;

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
