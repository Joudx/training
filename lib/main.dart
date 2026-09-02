import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'constants/app_constants.dart';
import 'l10n/app_localizations.dart';
import 'screens/main_screen.dart';
import 'screens/service_screens/breakfast_screen.dart';
import 'screens/service_screens/food_baskets_screen.dart';
import 'screens/service_screens/food_surplus_screen.dart';
import 'screens/service_screens/hot_meals_screen.dart';
import 'screens/service_screens/meat_distribution_screen.dart';
import 'screens/service_screens/water_distribution_screen.dart';
import 'screens/utility_screens/campaigns_screen.dart';
import 'screens/utility_screens/contact_screen.dart';
import 'screens/utility_screens/donation_history_screen.dart';
import 'screens/utility_screens/gallery_screen.dart';
import 'screens/utility_screens/share_app_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const CharityApp());
}

class CharityApp extends StatefulWidget {
  const CharityApp({super.key});

  @override
  State<CharityApp> createState() => CharityAppState();

  static CharityAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<CharityAppState>();
}

class CharityAppState extends State<CharityApp> {
  Locale _locale = const Locale('ar');

  void setLocale(Locale locale) {
    setState(() => _locale = locale);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'جمعية إكرام لحفظ الطعام',
      theme: AppTheme.light(),
      home: const MainScreen(),
      routes: {
        AppRoutes.foodSurplus: (_) => const FoodSurplusScreen(),
        AppRoutes.breakfast: (_) => const BreakfastScreen(),
        AppRoutes.meatDistribution: (_) => const MeatDistributionScreen(),
        AppRoutes.hotMeals: (_) => const HotMealsScreen(),
        AppRoutes.waterDistribution: (_) => const WaterDistributionScreen(),
        AppRoutes.foodBaskets: (_) => const FoodBasketsScreen(),
        AppRoutes.contact: (_) => const ContactScreen(),
        AppRoutes.share: (_) => const ShareAppScreen(),
        AppRoutes.gallery: (_) => const GalleryScreen(),
        AppRoutes.campaigns: (_) => const CampaignsScreen(),
        AppRoutes.donationHistory: (_) => const DonationHistoryScreen(),
      },
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('ar')],
      locale: _locale,
    );
  }
}
