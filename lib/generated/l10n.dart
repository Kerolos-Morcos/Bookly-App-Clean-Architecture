// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: depend_on_referenced_packages

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

  /// `Bookly`
  String get title {
    return Intl.message(
      'Bookly',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Newest Books`
  String get newest_books {
    return Intl.message(
      'Newest Books',
      name: 'newest_books',
      desc: '',
      args: [],
    );
  }

  /// `Read Free Books`
  String get read_free_books {
    return Intl.message(
      'Read Free Books',
      name: 'read_free_books',
      desc: '',
      args: [],
    );
  }

  /// `Search for books...`
  String get search_for_books {
    return Intl.message(
      'Search for books...',
      name: 'search_for_books',
      desc: '',
      args: [],
    );
  }

  /// `Search results`
  String get search_results {
    return Intl.message(
      'Search results',
      name: 'search_results',
      desc: '',
      args: [],
    );
  }

  /// `No Results Found`
  String get no_results_found {
    return Intl.message(
      'No Results Found',
      name: 'no_results_found',
      desc: '',
      args: [],
    );
  }

  /// `Free`
  String get free {
    return Intl.message(
      'Free',
      name: 'free',
      desc: '',
      args: [],
    );
  }

  /// `You also can like`
  String get you_can_also_like {
    return Intl.message(
      'You also can like',
      name: 'you_can_also_like',
      desc: '',
      args: [],
    );
  }

  /// `Free preview`
  String get free_preview {
    return Intl.message(
      'Free preview',
      name: 'free_preview',
      desc: '',
      args: [],
    );
  }

  /// `Not Available`
  String get not_available {
    return Intl.message(
      'Not Available',
      name: 'not_available',
      desc: '',
      args: [],
    );
  }

  /// `NOT_FOR_SALE`
  String get not_for_sale {
    return Intl.message(
      'NOT_FOR_SALE',
      name: 'not_for_sale',
      desc: '',
      args: [],
    );
  }

  /// `FOR_SALE`
  String get for_sale {
    return Intl.message(
      'FOR_SALE',
      name: 'for_sale',
      desc: '',
      args: [],
    );
  }

  /// `UNKNOWN_SALEability`
  String get unknown_saleability {
    return Intl.message(
      'UNKNOWN_SALEability',
      name: 'unknown_saleability',
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
