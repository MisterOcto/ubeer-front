import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['fr', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? frText = '',
    String? enText = '',
  }) =>
      [frText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'ejohfw74': {
      'fr': 'Les bières du moments',
      'en': '',
    },
    '0bpdn1z7': {
      'fr': 'Beers',
      'en': '',
    },
  },
  // StartPage
  {
    'zkce9nfu': {
      'fr': 'U',
      'en': '',
    },
    'k0cctbwo': {
      'fr': 'Beer',
      'en': '',
    },
    '2jathfyw': {
      'fr': 'Commencer',
      'en': 'Get Started',
    },
    'zc34xk4y': {
      'fr': 'Déjà membre ? ',
      'en': 'Already a member?  ',
    },
    'yr3gb7aq': {
      'fr': 'Connexion',
      'en': 'Sign In',
    },
    '6r8wtd0e': {
      'fr': 'Home',
      'en': 'Home',
    },
  },
  // beerDetails
  {
    'lyurocf1': {
      'fr': ' €',
      'en': '',
    },
    'ahyfr596': {
      'fr': 'Caractéristiques',
      'en': '',
    },
    'eyprb5ae': {
      'fr': 'Format : ',
      'en': '',
    },
    'by6a4jt1': {
      'fr': ' ',
      'en': '',
    },
    '9wfl04oh': {
      'fr': 'Abv : ',
      'en': '',
    },
    'q8psx7i8': {
      'fr': 'Ibu : ',
      'en': '',
    },
    'jupkn19o': {
      'fr': 'Brasserie : ',
      'en': '',
    },
    'arca7qcb': {
      'fr': 'Home',
      'en': '',
    },
  },
  // profile
  {
    'muvpxmp7': {
      'fr': 'Bonjour,',
      'en': '',
    },
    '03bh1hio': {
      'fr': 'Merci de nous soutenir !',
      'en': '',
    },
    'fab902xx': {
      'fr':
          'En tant qu\'entreprise locale, nous vous remercions de votre soutien.',
      'en': '',
    },
    'uoeu9vfo': {
      'fr': 'Modifier le profil',
      'en': '',
    },
    'xgfnihbh': {
      'fr': 'Déconnexion',
      'en': '',
    },
    'q0ztbgc9': {
      'fr': 'Profil',
      'en': '',
    },
  },
  // SignIn
  {
    'nufz083q': {
      'fr': 'Connexion',
      'en': '',
    },
    'y9hcdpoq': {
      'fr': 'Email',
      'en': '',
    },
    '0iz7r17n': {
      'fr': 'Mot de passe',
      'en': '',
    },
    '229b58o8': {
      'fr': 'Email is required.',
      'en': '',
    },
    'd75dgtzr': {
      'fr': 'Please choose an option from the dropdown',
      'en': '',
    },
    '65uua14x': {
      'fr': 'Passsword is required.',
      'en': '',
    },
    'o60kqjsy': {
      'fr': 'Please choose an option from the dropdown',
      'en': '',
    },
    'qcmaa7w0': {
      'fr': 'Sign In',
      'en': '',
    },
    's7zenzuw': {
      'fr': 'I don\'t remember my password',
      'en': '',
    },
    'k8pmtjm2': {
      'fr': 'Home',
      'en': '',
    },
  },
  // SignUp
  {
    'nuqij0b2': {
      'fr': 'Créer un compte',
      'en': '',
    },
    'lmqjz07k': {
      'fr': 'Nom',
      'en': '',
    },
    'a80u6hbe': {
      'fr': 'Email',
      'en': '',
    },
    '8vojszfh': {
      'fr': 'Mot de passe',
      'en': '',
    },
    'pd5lixlj': {
      'fr': 'Full name is required.',
      'en': '',
    },
    '0vostjcp': {
      'fr': 'Please choose an option from the dropdown',
      'en': '',
    },
    'f418ca1i': {
      'fr': 'Email is required.',
      'en': '',
    },
    'cz2q5j31': {
      'fr': 'Please choose an option from the dropdown',
      'en': '',
    },
    '8iwfq9of': {
      'fr': 'Password is required.',
      'en': '',
    },
    'z5zb1l3h': {
      'fr': 'Please choose an option from the dropdown',
      'en': '',
    },
    'd4om2hme': {
      'fr': 'Créer un compte',
      'en': '',
    },
    '765v87xl': {
      'fr': 'En cliquant sur « Créer un compte », vous acceptez les ',
      'en': '',
    },
    'gn699w4c': {
      'fr': 'conditions d\'utilisation',
      'en': '',
    },
    '775tvt8e': {
      'fr': ' d\'Ubeer.',
      'en': '',
    },
    'q8ubtjii': {
      'fr': 'Home',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'romkusz1': {
      'fr': '',
      'en': '',
    },
    'vb16nmrd': {
      'fr': '',
      'en': '',
    },
    'j5w92amo': {
      'fr': '',
      'en': '',
    },
    'fzftfljc': {
      'fr': '',
      'en': '',
    },
    '8q9tsjd7': {
      'fr': '',
      'en': '',
    },
    '90wbsrms': {
      'fr': '',
      'en': '',
    },
    'g9srczvb': {
      'fr': '',
      'en': '',
    },
    'k01vylp3': {
      'fr': '',
      'en': '',
    },
    'tq1v6xrb': {
      'fr': '',
      'en': '',
    },
    '6scie3lw': {
      'fr': '',
      'en': '',
    },
    '1vr8v1ag': {
      'fr': '',
      'en': '',
    },
    'lofycjb8': {
      'fr': '',
      'en': '',
    },
    '9xl71ti5': {
      'fr': '',
      'en': '',
    },
    'w6tiqu4m': {
      'fr': '',
      'en': '',
    },
    '8finpikl': {
      'fr': '',
      'en': '',
    },
    '824mtk36': {
      'fr': '',
      'en': '',
    },
    'mwqhdx8j': {
      'fr': '',
      'en': '',
    },
    '6v8g6pkv': {
      'fr': '',
      'en': '',
    },
    '2tefdfhx': {
      'fr': '',
      'en': '',
    },
    'vf6hds8y': {
      'fr': '',
      'en': '',
    },
    'enk3ilwp': {
      'fr': '',
      'en': '',
    },
    'pmxthtgd': {
      'fr': '',
      'en': '',
    },
    'vz2emc3i': {
      'fr': '',
      'en': '',
    },
    '2hsj6xh9': {
      'fr': '',
      'en': '',
    },
    'noi1lrhn': {
      'fr': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
