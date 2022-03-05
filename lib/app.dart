import 'package:f_shrine/backdrop.dart';
import 'package:f_shrine/category_menu_page.dart';
import 'package:f_shrine/colors.dart';
import 'package:f_shrine/home.dart';
import 'package:f_shrine/login.dart';
import 'package:f_shrine/model/product.dart';
import 'package:f_shrine/supplemental/cut_corners_border.dart';
import 'package:flutter/material.dart';

final ThemeData _kShrineTheme = _buildShrineTheme();

class ShrineApp extends StatefulWidget {
  const ShrineApp({Key? key}) : super(key: key);

  @override
  State<ShrineApp> createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      initialRoute: LoginPage.routeName,
      home: Backdrop(
        currentCategory: Category.all,
        frontLayer: HomePage(
          category: _currentCategory,
        ),
        backLayer: CategoryMenuPage(
          currentCategory: _currentCategory,
          onCategoryTap: _onCategoryTap,
        ),
        frontTitle: Text('SHRINE'),
        backTitle: Text('Menu'),
      ),
      onGenerateRoute: _getRoute,
      debugShowCheckedModeBanner: false,
      theme: _kShrineTheme,
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != LoginPage.routeName) {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (_) => const LoginPage(),
      fullscreenDialog: true,
    );
  }
}

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: kShrinePink100,
      onPrimary: kShrineBrown900,
      secondary: kShrineBrown900,
      error: kShrineErrorRed,
    ),
    textTheme: _buildShrineTextTheme(base.textTheme),
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: kShrinePink100,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      border: CutCornersBorder(),
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2,
          color: kShrineBrown900,
        ),
      ),
    ),
  );
}

TextTheme _buildShrineTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5!.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6!.copyWith(fontSize: 18),
        caption:
            base.caption!.copyWith(fontWeight: FontWeight.w400, fontSize: 14),
        bodyText1: base.bodyText1!.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kShrineBrown900,
        bodyColor: kShrineBrown900,
      );
}
