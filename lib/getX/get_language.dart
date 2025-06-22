import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newzler/getX/display_language.dart';
import 'package:newzler/getX/languages.dart';
class LanguageSupport extends StatefulWidget {
  const LanguageSupport({super.key});

  @override
  State<LanguageSupport> createState() => _LanguageSupportState();
}

class _LanguageSupportState extends State<LanguageSupport> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      fallbackLocale: Locale('en', 'US'),
      locale: Locale('en', 'US'),
      // home: DisplayLanguage(),
    );
  }
}
