// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Success`
  String get success {
    return Intl.message(
      'Success',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `warning`
  String get warning {
    return Intl.message(
      'warning',
      name: 'warning',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `You want to delete this blog?`
  String get deletethisblog {
    return Intl.message(
      'You want to delete this blog?',
      name: 'deletethisblog',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to `
  String get Welcometo {
    return Intl.message(
      'Welcome to ',
      name: 'Welcometo',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Email {
    return Intl.message(
      'Email',
      name: 'Email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `SignIn`
  String get SignIn {
    return Intl.message(
      'SignIn',
      name: 'SignIn',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get Donthaveanaccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'Donthaveanaccount',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get SignUp {
    return Intl.message(
      'SignUp',
      name: 'SignUp',
      desc: '',
      args: [],
    );
  }

  /// `Join to `
  String get Jointo {
    return Intl.message(
      'Join to ',
      name: 'Jointo',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get FullName {
    return Intl.message(
      'Full Name',
      name: 'FullName',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get Alreadyhaveanaccount {
    return Intl.message(
      'Already have an account? ',
      name: 'Alreadyhaveanaccount',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get All {
    return Intl.message(
      'All',
      name: 'All',
      desc: '',
      args: [],
    );
  }

  /// `Gis`
  String get Gis {
    return Intl.message(
      'Gis',
      name: 'Gis',
      desc: '',
      args: [],
    );
  }

  /// `Surveying`
  String get Surveying {
    return Intl.message(
      'Surveying',
      name: 'Surveying',
      desc: '',
      args: [],
    );
  }

  /// `Remote Sensing`
  String get RemoteSensing {
    return Intl.message(
      'Remote Sensing',
      name: 'RemoteSensing',
      desc: '',
      args: [],
    );
  }

  /// `Add new blog`
  String get Addnewblog {
    return Intl.message(
      'Add new blog',
      name: 'Addnewblog',
      desc: '',
      args: [],
    );
  }

  /// `Blog Title`
  String get BlogTitle {
    return Intl.message(
      'Blog Title',
      name: 'BlogTitle',
      desc: '',
      args: [],
    );
  }

  /// `Blog Content`
  String get BlogContent {
    return Intl.message(
      'Blog Content',
      name: 'BlogContent',
      desc: '',
      args: [],
    );
  }

  /// `Other Blogs From `
  String get OtherBlogsFrom {
    return Intl.message(
      'Other Blogs From ',
      name: 'OtherBlogsFrom',
      desc: '',
      args: [],
    );
  }

  /// `Blog updated successfuly`
  String get Blogupdatedsuccessfuly {
    return Intl.message(
      'Blog updated successfuly',
      name: 'Blogupdatedsuccessfuly',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get Update {
    return Intl.message(
      'Update',
      name: 'Update',
      desc: '',
      args: [],
    );
  }

  /// `You don't have change any thing!`
  String get Youdonthavechangeanything {
    return Intl.message(
      'You don\'t have change any thing!',
      name: 'Youdonthavechangeanything',
      desc: '',
      args: [],
    );
  }

  /// `Saved Blogs`
  String get SavedBlogs {
    return Intl.message(
      'Saved Blogs',
      name: 'SavedBlogs',
      desc: '',
      args: [],
    );
  }

  /// `is missing!`
  String get ismissing {
    return Intl.message(
      'is missing!',
      name: 'ismissing',
      desc: '',
      args: [],
    );
  }

  /// `Blog deleted successfully`
  String get Blogdeletedsuccessfully {
    return Intl.message(
      'Blog deleted successfully',
      name: 'Blogdeletedsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please try later!`
  String get Somethingwentwrong {
    return Intl.message(
      'Something went wrong, please try later!',
      name: 'Somethingwentwrong',
      desc: '',
      args: [],
    );
  }

  /// `Select your image`
  String get Selectyourimage {
    return Intl.message(
      'Select your image',
      name: 'Selectyourimage',
      desc: '',
      args: [],
    );
  }

  /// `Join to our unity`
  String get Jointoourunity {
    return Intl.message(
      'Join to our unity',
      name: 'Jointoourunity',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get Skip {
    return Intl.message(
      'Skip',
      name: 'Skip',
      desc: '',
      args: [],
    );
  }

  /// `Discover insightful blogs and stay updated with the latest trends in surveying, remote sensing, and GIS.`
  String get OnBoarding1 {
    return Intl.message(
      'Discover insightful blogs and stay updated with the latest trends in surveying, remote sensing, and GIS.',
      name: 'OnBoarding1',
      desc: '',
      args: [],
    );
  }

  /// `Connect with professionals and enthusiasts, and engage in meaningful discussions on your favorite topics.`
  String get OnBoarding2 {
    return Intl.message(
      'Connect with professionals and enthusiasts, and engage in meaningful discussions on your favorite topics.',
      name: 'OnBoarding2',
      desc: '',
      args: [],
    );
  }

  /// `Easily find, read, and follow blogs that matter to you, all in one place.`
  String get OnBoarding3 {
    return Intl.message(
      'Easily find, read, and follow blogs that matter to you, all in one place.',
      name: 'OnBoarding3',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get Explore {
    return Intl.message(
      'Explore',
      name: 'Explore',
      desc: '',
      args: [],
    );
  }

  /// `what are you looking for`
  String get whatareyoulookingfor {
    return Intl.message(
      'what are you looking for',
      name: 'whatareyoulookingfor',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Saved`
  String get Saved {
    return Intl.message(
      'Saved',
      name: 'Saved',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Edit your profile`
  String get EditYourProfile {
    return Intl.message(
      'Edit your profile',
      name: 'EditYourProfile',
      desc: '',
      args: [],
    );
  }

  /// `min read`
  String get minread {
    return Intl.message(
      'min read',
      name: 'minread',
      desc: '',
      args: [],
    );
  }

  /// `Change theme`
  String get Changetheme {
    return Intl.message(
      'Change theme',
      name: 'Changetheme',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get ChangeLanguage {
    return Intl.message(
      'Change Language',
      name: 'ChangeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `SignOut`
  String get SignOut {
    return Intl.message(
      'SignOut',
      name: 'SignOut',
      desc: '',
      args: [],
    );
  }

  /// `Cahnge your app theme`
  String get Cahngeyourapptheme {
    return Intl.message(
      'Cahnge your app theme',
      name: 'Cahngeyourapptheme',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get Dark {
    return Intl.message(
      'Dark',
      name: 'Dark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get Light {
    return Intl.message(
      'Light',
      name: 'Light',
      desc: '',
      args: [],
    );
  }

  /// `Short Bio`
  String get ShortBio {
    return Intl.message(
      'Short Bio',
      name: 'ShortBio',
      desc: '',
      args: [],
    );
  }

  /// `Your profile updated successfully`
  String get Yourprofileupdatedsuccessfully {
    return Intl.message(
      'Your profile updated successfully',
      name: 'Yourprofileupdatedsuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Followers`
  String get Followers {
    return Intl.message(
      'Followers',
      name: 'Followers',
      desc: '',
      args: [],
    );
  }

  /// `Following`
  String get Following {
    return Intl.message(
      'Following',
      name: 'Following',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your email and SignIn`
  String get PleaseconfirmyouremailandSignIn {
    return Intl.message(
      'Please confirm your email and SignIn',
      name: 'PleaseconfirmyouremailandSignIn',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
