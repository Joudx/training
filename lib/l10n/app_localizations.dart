import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Charity Association'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @donate.
  ///
  /// In en, this message translates to:
  /// **'Donate'**
  String get donate;

  /// No description provided for @programs.
  ///
  /// In en, this message translates to:
  /// **'Programs'**
  String get programs;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @mainpage.
  ///
  /// In en, this message translates to:
  /// **'Main Page'**
  String get mainpage;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @dontations.
  ///
  /// In en, this message translates to:
  /// **'Dontations'**
  String get dontations;

  /// No description provided for @currentampaigns.
  ///
  /// In en, this message translates to:
  /// **'Current Campaigns'**
  String get currentampaigns;

  /// No description provided for @mydonationrecord.
  ///
  /// In en, this message translates to:
  /// **'My Donation Record'**
  String get mydonationrecord;

  /// No description provided for @aboutcharity.
  ///
  /// In en, this message translates to:
  /// **'About The Charity'**
  String get aboutcharity;

  /// No description provided for @callus.
  ///
  /// In en, this message translates to:
  /// **'Call Us'**
  String get callus;

  /// No description provided for @shareapp.
  ///
  /// In en, this message translates to:
  /// **'Share App'**
  String get shareapp;

  /// No description provided for @weworkforgoodness.
  ///
  /// In en, this message translates to:
  /// **'We Work For Goodness'**
  String get weworkforgoodness;

  /// No description provided for @surplusfood.
  ///
  /// In en, this message translates to:
  /// **'Surplus Food'**
  String get surplusfood;

  /// No description provided for @iftarforafastingperson.
  ///
  /// In en, this message translates to:
  /// **'Iftar For A Fasting Person'**
  String get iftarforafastingperson;

  /// No description provided for @freshmeat.
  ///
  /// In en, this message translates to:
  /// **'Fresh Meat'**
  String get freshmeat;

  /// No description provided for @hotmeals.
  ///
  /// In en, this message translates to:
  /// **'Hot Meals'**
  String get hotmeals;

  /// No description provided for @waterdistribution.
  ///
  /// In en, this message translates to:
  /// **'Water Distribution'**
  String get waterdistribution;

  /// No description provided for @foodbaskets.
  ///
  /// In en, this message translates to:
  /// **'Food Baskets'**
  String get foodbaskets;

  /// No description provided for @beneficiary.
  ///
  /// In en, this message translates to:
  /// **'Beneficiary'**
  String get beneficiary;

  /// No description provided for @donor.
  ///
  /// In en, this message translates to:
  /// **'Donor'**
  String get donor;

  /// No description provided for @volunteer.
  ///
  /// In en, this message translates to:
  /// **'Volunteer'**
  String get volunteer;

  /// No description provided for @program.
  ///
  /// In en, this message translates to:
  /// **'Program'**
  String get program;

  /// No description provided for @donatenow.
  ///
  /// In en, this message translates to:
  /// **'Donate Now'**
  String get donatenow;

  /// No description provided for @ourservices.
  ///
  /// In en, this message translates to:
  /// **'Our Services'**
  String get ourservices;

  /// No description provided for @showall.
  ///
  /// In en, this message translates to:
  /// **'Show All'**
  String get showall;

  /// No description provided for @appmaindescription.
  ///
  /// In en, this message translates to:
  /// **'Ikram Food Preservation Association'**
  String get appmaindescription;

  /// No description provided for @appsubdescription.
  ///
  /// In en, this message translates to:
  /// **'Hand in hand to make a difference in the lives of those in need'**
  String get appsubdescription;

  /// No description provided for @iftarperson.
  ///
  /// In en, this message translates to:
  /// **'Iftar for a fasting person'**
  String get iftarperson;

  /// No description provided for @providingiftarmeals.
  ///
  /// In en, this message translates to:
  /// **'Providing Iftar meals for 1,000 fasting people'**
  String get providingiftarmeals;

  /// No description provided for @distributebottlesofwater.
  ///
  /// In en, this message translates to:
  /// **'Distribute 5000 Bottles Of Water'**
  String get distributebottlesofwater;

  /// No description provided for @distributingfooddescroption.
  ///
  /// In en, this message translates to:
  /// **'Distributing surplus food to the needy'**
  String get distributingfooddescroption;

  /// No description provided for @providinggrandmosque.
  ///
  /// In en, this message translates to:
  /// **'Providing Iftar meals for fasting people in the Grand Mosque'**
  String get providinggrandmosque;

  /// No description provided for @distributingmeatneedyfamilies.
  ///
  /// In en, this message translates to:
  /// **'Distributing fresh meat to needy families'**
  String get distributingmeatneedyfamilies;

  /// No description provided for @providinghotmealsneed.
  ///
  /// In en, this message translates to:
  /// **'Providing hot meals to those in need'**
  String get providinghotmealsneed;

  /// No description provided for @providinghotmealsneeddescription.
  ///
  /// In en, this message translates to:
  /// **'We provide hot meals daily to the needy and poor families in various areas.'**
  String get providinghotmealsneeddescription;

  /// No description provided for @providingdrinkingwaterneed.
  ///
  /// In en, this message translates to:
  /// **'Providing drinking water to those in need'**
  String get providingdrinkingwaterneed;

  /// No description provided for @distributionbasketsnecessities.
  ///
  /// In en, this message translates to:
  /// **'Distribution of food baskets containing basic necessities'**
  String get distributionbasketsnecessities;

  /// No description provided for @donationpage.
  ///
  /// In en, this message translates to:
  /// **'Donation Page'**
  String get donationpage;

  /// No description provided for @programpage.
  ///
  /// In en, this message translates to:
  /// **'Program Page'**
  String get programpage;

  /// No description provided for @soonpage.
  ///
  /// In en, this message translates to:
  /// **'This page will be activated soon'**
  String get soonpage;

  /// No description provided for @donateforproject.
  ///
  /// In en, this message translates to:
  /// **'Donate For This project'**
  String get donateforproject;

  /// No description provided for @surplusfooddescription.
  ///
  /// In en, this message translates to:
  /// **'We collect surplus food from restaurants, hotels and weddings and distribute it to the needy and destitute families in a healthy and safe manner.'**
  String get surplusfooddescription;

  /// No description provided for @waterdistribituindescription.
  ///
  /// In en, this message translates to:
  /// **'We contribute to providing clean drinking water to those in need in areas suffering from water scarcity.'**
  String get waterdistribituindescription;

  /// No description provided for @freshmeatdescription.
  ///
  /// In en, this message translates to:
  /// **'We slaughter and distribute fresh meat to needy families on special occasions and holidays.'**
  String get freshmeatdescription;

  /// No description provided for @distributionoffoodbaskets.
  ///
  /// In en, this message translates to:
  /// **'Distribution of food baskets'**
  String get distributionoffoodbaskets;

  String get fieldTrips;
  String get fleetVehicles;
  String get aboutIntro;
  String get ourGoal;
  String get aboutGoal;
  String get licenseTitle;
  String get aboutLicense;
  String get achievements;
  String get visitWebsite;
  String get website;
  String get contactSubtitle;
  String get phonePreserveBlessing;
  String get phoneBeneficiaries;
  String get phoneProjects;
  String get emailLabel;
  String get addressLabel;
  String get hoursLabel;
  String get socialMedia;
  String get shareMessage;
  String get linkCopied;
  String get copyLink;
  String get programsIntro;
  String get donationTeaser;
  String get partnerWithUs;
  String get partTwoSoon;
  String get donateOnWebsite;
  String get featureInProgressTitle;
  String get featureInProgressBody;
  String get ok;
  String get loginTitle;
  String get loginSubtitle;
  String get registerTitle;
  String get registerSubtitle;
  String get email;
  String get password;
  String get loginAction;
  String get registerAction;
  String get name;
  String get phoneOptional;
  String get confirmPassword;
  String get loginFailed;
  String get emailRequired;
  String get emailInvalid;
  String get passwordRequired;
  String get passwordMinLength;
  String get nameRequired;
  String get passwordsDoNotMatch;
  String get emailAlreadyUsed;
  String get logout;
  String get logoutConfirm;
  String get cancel;
  String get loginRequired;
  String get demoAccounts;
  String get demoHint;
  String get createAccount;
  String get haveAccount;
  String get welcomeUser;
  String get loggedInAs;
  String get partThreeSoon;
  String get loginDbError;
  String get tapDemoAccount;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
