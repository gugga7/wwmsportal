import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr'];

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
    String? enText = '',
    String? frText = '',
  }) =>
      [enText, frText][languageIndex] ?? '';

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
  // auth_Login
  {
    '5cu9a1r2': {
      'en': 'Welcome Back!',
      'fr': '',
    },
    'egywwhia': {
      'en': 'Use the form below to access your account.',
      'fr': '',
    },
    'ogcix91t': {
      'en': 'Email Address',
      'fr': '',
    },
    's72j97zt': {
      'en': 'Enter your email here...',
      'fr': '',
    },
    '8t70ikqn': {
      'en': 'Password',
      'fr': '',
    },
    'dxqryvbp': {
      'en': 'Enter your password here...',
      'fr': '',
    },
    'nl22pkzm': {
      'en': 'Forgot Password?',
      'fr': '',
    },
    'p9ewu29h': {
      'en': 'Login',
      'fr': '',
    },
    'nzd7m0ds': {
      'en': 'Use a social platform to continue',
      'fr': '',
    },
    '9majnim1': {
      'en': 'Don\'t have an account?',
      'fr': '',
    },
    '85s20waz': {
      'en': 'Create Account',
      'fr': '',
    },
    'lr2bna2o': {
      'en': 'Field is required',
      'fr': '',
    },
    '7qc4shg7': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    '6hr7yqqq': {
      'en': 'Field is required',
      'fr': '',
    },
    'wcelp30q': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'myc5ssyj': {
      'en': 'Home',
      'fr': '',
    },
  },
  // forgotPassword
  {
    'gjn1cd9e': {
      'en': 'Forgot Password',
      'fr': '',
    },
    'kaagv0nc': {
      'en':
          'Don\'t remember your password? Enter the email associated with your account below and we will send you a new link.',
      'fr': '',
    },
    '7be8bra2': {
      'en': 'Email Address',
      'fr': '',
    },
    'urxs74ml': {
      'en': 'Please enter a valid email...',
      'fr': '',
    },
    '78m96y1k': {
      'en': 'Send Reset Link',
      'fr': '',
    },
    's08jkf45': {
      'en': 'Home',
      'fr': '',
    },
  },
  // auth_Create
  {
    'udh41k2n': {
      'en': 'Get Started',
      'fr': '',
    },
    '2vw14nbl': {
      'en': 'Use the form below to get started.',
      'fr': '',
    },
    'eviqvf45': {
      'en': 'Email Address',
      'fr': '',
    },
    '1s2lc5fx': {
      'en': 'Enter your email here...',
      'fr': '',
    },
    'd22y4r33': {
      'en': 'Password',
      'fr': '',
    },
    'qe8xorrn': {
      'en': 'Create your password...',
      'fr': '',
    },
    '1j2rn4he': {
      'en': 'Confirm Password',
      'fr': '',
    },
    'rqfxj8hf': {
      'en': 'Create your password...',
      'fr': '',
    },
    'q1rs01nt': {
      'en': 'Create Account',
      'fr': '',
    },
    '5ho8l35w': {
      'en': 'Use a social platform to continue',
      'fr': '',
    },
    '35xip7ss': {
      'en': 'Already have an account?',
      'fr': '',
    },
    'lwic9q4y': {
      'en': 'Log In',
      'fr': '',
    },
    'ly9f6t75': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Main_Home
  {
    'v0m41xur': {
      'en': 'Dashboard',
      'fr': '',
    },
    'g5j053cp': {
      'en': 'Below is a summary of your teams activity.',
      'fr': '',
    },
    '9ao7n6ch': {
      'en': 'New Customers',
      'fr': '',
    },
    'irm0wdbg': {
      'en': '24',
      'fr': '',
    },
    'cuzuqfgg': {
      'en': 'New Contracts',
      'fr': '',
    },
    '7fz7fm1p': {
      'en': '3,200',
      'fr': '',
    },
    '561n4zej': {
      'en': 'Expired Contracts',
      'fr': '',
    },
    '65uttb3f': {
      'en': '4300',
      'fr': '',
    },
    'e628qvmj': {
      'en': 'Projects',
      'fr': '',
    },
    's7s08h4q': {
      'en': 'UI Design Team',
      'fr': '',
    },
    'smhstdpq': {
      'en': '4 Members',
      'fr': '',
    },
    't97i5q7w': {
      'en': 'Contract Activity',
      'fr': '',
    },
    'zqkdqoui': {
      'en': 'Below is an a summary of activity.',
      'fr': '',
    },
    '4hushuw7': {
      'en': 'Customer Activity',
      'fr': '',
    },
    'bmcnpg99': {
      'en': 'Below is an a summary of activity.',
      'fr': '',
    },
    'kvxdbj32': {
      'en': 'Contract Activity',
      'fr': '',
    },
    '9grd0ed8': {
      'en': 'Below is an a summary of activity.',
      'fr': '',
    },
    '6wqq8oks': {
      'en': 'Customer Activity',
      'fr': '',
    },
    'rbe04eqx': {
      'en': 'Below is an a summary of activity.',
      'fr': '',
    },
    'r2fefvli': {
      'en': 'Dashboard',
      'fr': '',
    },
    'kw2zxffg': {
      'en': '__',
      'fr': '',
    },
  },
  // Main_customerList
  {
    '7fjpqofe': {
      'en': 'Customers',
      'fr': '',
    },
    '4iak7afi': {
      'en': 'Invite Users',
      'fr': '',
    },
    'g2rrilyd': {
      'en': 'All',
      'fr': '',
    },
    'b7qw0b6a': {
      'en': 'Name',
      'fr': '',
    },
    '4683wjq7': {
      'en': 'Title',
      'fr': '',
    },
    'dq17eys6': {
      'en': 'Company',
      'fr': '',
    },
    'l75cdu3m': {
      'en': 'Company',
      'fr': '',
    },
    '65axw51p': {
      'en': 'Status',
      'fr': '',
    },
    'vokvx46v': {
      'en': 'Randy Alcorn',
      'fr': '',
    },
    'oh5xmoxb': {
      'en': 'Head of Procurement',
      'fr': '',
    },
    'm145mufo': {
      'en': 'ACME Co.',
      'fr': '',
    },
    'ynidxiz4': {
      'en': 'ACME Co.',
      'fr': '',
    },
    'n0w4dzhp': {
      'en': 'New',
      'fr': '',
    },
    'ebp1d85j': {
      'en': 'James Wiseman',
      'fr': '',
    },
    'jz58ss11': {
      'en': 'Account Manager',
      'fr': '',
    },
    'g3uuq9ke': {
      'en': 'ACME Co.',
      'fr': '',
    },
    'rl6jd9ob': {
      'en': 'ACME Co.',
      'fr': '',
    },
    '22evmoiz': {
      'en': 'Contacted',
      'fr': '',
    },
    'atcc5iwz': {
      'en': 'Ignacious Rodriguez',
      'fr': '',
    },
    '0w63ymrf': {
      'en': 'Sales Manager',
      'fr': '',
    },
    'zvpcvqsn': {
      'en': 'Robin HQ',
      'fr': '',
    },
    '1pk2amba': {
      'en': 'Robin HQ',
      'fr': '',
    },
    'y9t5qnrk': {
      'en': 'New',
      'fr': '',
    },
    'lonhe0ke': {
      'en': 'Elena Williams',
      'fr': '',
    },
    'jgl4tqa4': {
      'en': 'Head of Product & Innovation',
      'fr': '',
    },
    'w1bj1c33': {
      'en': 'Robin HQ',
      'fr': '',
    },
    'bp6cbunx': {
      'en': 'Robin HQ',
      'fr': '',
    },
    '8ykfc9bg': {
      'en': 'Contacted',
      'fr': '',
    },
    '15kxbly7': {
      'en': 'Greg Brown',
      'fr': '',
    },
    '4trm24aw': {
      'en': 'Account Manager',
      'fr': '',
    },
    '71e32zbl': {
      'en': 'Robin HQ',
      'fr': '',
    },
    'sff9bbdt': {
      'en': 'Robin HQ',
      'fr': '',
    },
    '21m3klpe': {
      'en': 'Contacted',
      'fr': '',
    },
    'u5o0f9km': {
      'en': 'June Williamson',
      'fr': '',
    },
    'zvduaa80': {
      'en': 'Sr. Account Manager',
      'fr': '',
    },
    'aa37vnzc': {
      'en': 'HealthAi',
      'fr': '',
    },
    '9njmw1fp': {
      'en': 'HealthAi',
      'fr': '',
    },
    '19f6lfis': {
      'en': 'Contacted',
      'fr': '',
    },
    'df4ogcdc': {
      'en': 'June Williamson',
      'fr': '',
    },
    'v3yc7oq3': {
      'en': 'Sr. Account Manager',
      'fr': '',
    },
    'jkjf8cpo': {
      'en': 'HealthAi',
      'fr': '',
    },
    's1eheopj': {
      'en': 'HealthAi',
      'fr': '',
    },
    'i7qdejd7': {
      'en': 'Contacted',
      'fr': '',
    },
    '75h9395h': {
      'en': 'New Calls',
      'fr': '',
    },
    'jcyqfvku': {
      'en': 'Name',
      'fr': '',
    },
    '5c86m6fk': {
      'en': 'Title',
      'fr': '',
    },
    'rupin9h1': {
      'en': 'Company',
      'fr': '',
    },
    'nakabijy': {
      'en': 'Company',
      'fr': '',
    },
    'r1peyz5k': {
      'en': 'Status',
      'fr': '',
    },
    'n5zd3f19': {
      'en': 'Randy Alcorn',
      'fr': '',
    },
    'vfwd0q79': {
      'en': 'Head of Procurement',
      'fr': '',
    },
    '408ggdr7': {
      'en': 'ACME Co.',
      'fr': '',
    },
    '847ectjn': {
      'en': 'ACME Co.',
      'fr': '',
    },
    'fsuzfmiy': {
      'en': 'New',
      'fr': '',
    },
    'z3zjb7dv': {
      'en': 'Ignacious Rodriguez',
      'fr': '',
    },
    '68srudhc': {
      'en': 'Sales Manager',
      'fr': '',
    },
    '59tw3sad': {
      'en': 'Robin HQ',
      'fr': '',
    },
    '9pk6cw5u': {
      'en': 'Robin HQ',
      'fr': '',
    },
    'je93dczj': {
      'en': 'New',
      'fr': '',
    },
    '4j28271k': {
      'en': 'Contacted',
      'fr': '',
    },
    '4nvc04f3': {
      'en': 'Name',
      'fr': '',
    },
    'eyay71dy': {
      'en': 'Title',
      'fr': '',
    },
    'y3zvoyrq': {
      'en': 'Company',
      'fr': '',
    },
    'iwbrst8b': {
      'en': 'Company',
      'fr': '',
    },
    'a0kgtott': {
      'en': 'Status',
      'fr': '',
    },
    'rvyxf29d': {
      'en': 'James Wiseman',
      'fr': '',
    },
    'zzccda1c': {
      'en': 'Account Manager',
      'fr': '',
    },
    '8lzedi6h': {
      'en': 'ACME Co.',
      'fr': '',
    },
    '9q5v0mnc': {
      'en': 'ACME Co.',
      'fr': '',
    },
    'xkihdcut': {
      'en': 'Contacted',
      'fr': '',
    },
    'a6mar9sc': {
      'en': 'Elena Williams',
      'fr': '',
    },
    'sp2rlc62': {
      'en': 'Head of Product & Innovation',
      'fr': '',
    },
    'hp24979g': {
      'en': 'Robin HQ',
      'fr': '',
    },
    'jo8dgk1g': {
      'en': 'Robin HQ',
      'fr': '',
    },
    'as0gvzxs': {
      'en': 'Contacted',
      'fr': '',
    },
    'p6gq9jza': {
      'en': 'Greg Brown',
      'fr': '',
    },
    'esaekxz2': {
      'en': 'Account Manager',
      'fr': '',
    },
    'dqz2n8ku': {
      'en': 'Robin HQ',
      'fr': '',
    },
    'sdmtn1ei': {
      'en': 'Robin HQ',
      'fr': '',
    },
    'ff3qvc90': {
      'en': 'Contacted',
      'fr': '',
    },
    'z5xu81ir': {
      'en': 'June Williamson',
      'fr': '',
    },
    'ynn5agxe': {
      'en': 'Sr. Account Manager',
      'fr': '',
    },
    'kyw6tlsx': {
      'en': 'HealthAi',
      'fr': '',
    },
    '6pc74xl7': {
      'en': 'HealthAi',
      'fr': '',
    },
    'it11ofdb': {
      'en': 'Contacted',
      'fr': '',
    },
    'q8g869gx': {
      'en': 'June Williamson',
      'fr': '',
    },
    'xavh2fij': {
      'en': 'Sr. Account Manager',
      'fr': '',
    },
    'ce80ju5q': {
      'en': 'HealthAi',
      'fr': '',
    },
    '3lymfpr6': {
      'en': 'HealthAi',
      'fr': '',
    },
    '0ct033x6': {
      'en': 'Contacted',
      'fr': '',
    },
    '01fsozmb': {
      'en': 'Customers',
      'fr': '',
    },
    'jnhl082b': {
      'en': '__',
      'fr': '',
    },
  },
  // Main_Events
  {
    'tyn7f46i': {
      'en': 'Contracts',
      'fr': '',
    },
    'n2lcndaa': {
      'en': 'Multi Day Bookings (Active)',
      'fr': '',
    },
    'ozje0p65': {
      'en': 'Create Event',
      'fr': '',
    },
    '7dz1f0w8': {
      'en': 'View Draft Events',
      'fr': '',
    },
    '6xtr4b1b': {
      'en': 'Upcoming Events',
      'fr': '',
    },
    '5zg4u6vi': {
      'en': 'Active',
      'fr': '',
    },
    'ew8576g1': {
      'en': 'Company Event \nDEC 11-13, 2023',
      'fr': '',
    },
    '6vwexkjb': {
      'en': 'Active',
      'fr': '',
    },
    'gd36zxwy': {
      'en': 'Company Event \nDEC 11-13, 2023',
      'fr': '',
    },
    '2bb1ty4o': {
      'en': 'Results',
      'fr': '',
    },
    'th2duv2e': {
      'en': 'DEC',
      'fr': '',
    },
    'q6dofpnj': {
      'en': '11',
      'fr': '',
    },
    'mmf0428k': {
      'en': '3 Passengers',
      'fr': '',
    },
    'xtodl6yr': {
      'en': 'Contracts for New Opportunities',
      'fr': '',
    },
    'i1h44ix9': {
      'en': '1 Sedan + 1 Van + 1 SUV',
      'fr': '',
    },
    'yviiwsci': {
      'en': 'In Progress',
      'fr': '',
    },
    'vmebdec8': {
      'en': 'Contracts for New Opportunities',
      'fr': '',
    },
    'v04s7ltn': {
      'en': 'Completed',
      'fr': '',
    },
    'fzx9ne2a': {
      'en': 'Contracts for New Opportunities',
      'fr': '',
    },
    'x4oovyyl': {
      'en': '2 of 5',
      'fr': '',
    },
    'd26q6g9w': {
      'en': 'Latest Completed Trip',
      'fr': '',
    },
    'w0ia76zh': {
      'en': 'John Smith, Tuesday, 10:00am',
      'fr': '',
    },
    '2wiux8dd': {
      'en': 'Completed',
      'fr': '',
    },
    'a80z1o6a': {
      'en': 'Missing information',
      'fr': '',
    },
    'ripgfu35': {
      'en': 'Next Scheduled Trip',
      'fr': '',
    },
    'l0yk1s0r': {
      'en': 'John Smith, Tuesday, 10:00am',
      'fr': '',
    },
    'sur2n9m7': {
      'en': 'On the Way',
      'fr': '',
    },
    'vbuqr5al': {
      'en': 'DEC',
      'fr': '',
    },
    'ii9jogfg': {
      'en': '12',
      'fr': '',
    },
    'huiakvxb': {
      'en': '3 Passengers',
      'fr': '',
    },
    'r9mc4381': {
      'en': 'Contracts for New Opportunities',
      'fr': '',
    },
    'dv0seg0i': {
      'en': '1 Sedan + 1 Van + 1 SUV',
      'fr': '',
    },
    'ev8uop9x': {
      'en': 'Scheduled',
      'fr': '',
    },
    'adkiozf3': {
      'en': 'Contracts for New Opportunities',
      'fr': '',
    },
    'cdgl1z37': {
      'en': 'Completed',
      'fr': '',
    },
    '6l5dve7c': {
      'en': 'Contracts for New Opportunities',
      'fr': '',
    },
    'jdfsik2f': {
      'en': '2 of 5',
      'fr': '',
    },
    'lj7j45aj': {
      'en': 'Next Scheduled Trip',
      'fr': '',
    },
    'qmomcoxq': {
      'en': 'John Smith, Tuesday, 10:00am',
      'fr': '',
    },
    'so1cslk5': {
      'en': 'On the Way',
      'fr': '',
    },
    '9eh8kqti': {
      'en': 'DEC',
      'fr': '',
    },
    '9jnkxvha': {
      'en': '13',
      'fr': '',
    },
    '41vzm219': {
      'en': '3 Passengers',
      'fr': '',
    },
    'wj4p41hz': {
      'en': 'Contracts for New Opportunities',
      'fr': '',
    },
    '37kq4r8m': {
      'en': '1 Sedan + 1 Van + 1 SUV',
      'fr': '',
    },
    'iyrjypn9': {
      'en': 'Scheduled',
      'fr': '',
    },
    'rhu4y0p2': {
      'en': 'Contracts for New Opportunities',
      'fr': '',
    },
    'ljkyzhaw': {
      'en': 'Completed',
      'fr': '',
    },
    'yfuwqhxv': {
      'en': 'Contracts for New Opportunities',
      'fr': '',
    },
    'cbk5mp0p': {
      'en': '2 of 5',
      'fr': '',
    },
    'u3ct6dzu': {
      'en': 'Next Scheduled Trip',
      'fr': '',
    },
    'ydb55r80': {
      'en': 'John Smith, Tuesday, 10:00am',
      'fr': '',
    },
    'v5qsvcer': {
      'en': 'On the Way',
      'fr': '',
    },
    'yqa6iget': {
      'en': '__',
      'fr': '',
    },
  },
  // Main_messages
  {
    'cdeq81i1': {
      'en': 'Messages',
      'fr': '',
    },
    'fou09zvk': {
      'en': 'Search messages here...',
      'fr': '',
    },
    't0ax7ndc': {
      'en': 'Randy Mcdonald',
      'fr': '',
    },
    'zu5qnv8v': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'fr': '',
    },
    'mr2ma3kv': {
      'en': 'Mon. July 3rd - 4:12pm',
      'fr': '',
    },
    '3sluupr4': {
      'en': 'Randy Mcdonald',
      'fr': '',
    },
    'fozvd90t': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'fr': '',
    },
    '6itjutzv': {
      'en': 'Mon. July 3rd - 4:12pm',
      'fr': '',
    },
    '16c6tf7d': {
      'en': 'Randy Mcdonald',
      'fr': '',
    },
    'lynmux3o': {
      'en':
          'This was really great, i\'m so glad that we could  catchup this weekend.',
      'fr': '',
    },
    'x3dznx9m': {
      'en': 'Mon. July 3rd - 4:12pm',
      'fr': '',
    },
    'yqlrv7i6': {
      'en':
          'I am a freelancer and I need help writing content for a proposal for a project. Can I give you some context for the projecct I need to write a proposal for?',
      'fr': '',
    },
    '3qv8bblt': {
      'en': 'Just Now',
      'fr': '',
    },
    'cget76an': {
      'en': 'Hey really love what you are doing!',
      'fr': '',
    },
    '2phcp0uf': {
      'en': 'a few moments ago',
      'fr': '',
    },
    'pfk5z9uo': {
      'en': 'This is my intro video',
      'fr': '',
    },
    'fspmr3qc': {
      'en': 'Just Now',
      'fr': '',
    },
    '98c2hfqv': {
      'en': 'Hey really love what you are doing!',
      'fr': '',
    },
    's0wntdgw': {
      'en': 'Just Now',
      'fr': '',
    },
    'ya22i1xz': {
      'en': 'Hey really love what you are doing!',
      'fr': '',
    },
    'rigzgqpo': {
      'en': 'Just Now',
      'fr': '',
    },
    'yd4mruza': {
      'en': 'Start typing here...',
      'fr': '',
    },
    'v1uqcr02': {
      'en': 'Dashboard',
      'fr': '',
    },
    'uv74o9pn': {
      'en': '__',
      'fr': '',
    },
  },
  // Main_profilePage
  {
    'b7chgewo': {
      'en': 'My Profile',
      'fr': '',
    },
    'ph83uqay': {
      'en': 'Account Settings',
      'fr': '',
    },
    'ifghfwx8': {
      'en': 'Change Password',
      'fr': '',
    },
    '4xn54omp': {
      'en': 'Edit Profile',
      'fr': '',
    },
    'f8krb31n': {
      'en': 'Update Theme',
      'fr': '',
    },
    'uw77kefb': {
      'en':
          'Update the theme of your application from seleccting one of the options below.',
      'fr': '',
    },
    'd9zmsebu': {
      'en': 'Dark Mode',
      'fr': '',
    },
    '2flfpvko': {
      'en': 'Light Mode',
      'fr': '',
    },
    'n6uplr91': {
      'en': 'Log Out',
      'fr': '',
    },
    '0lsmrewx': {
      'en': '__',
      'fr': '',
    },
  },
  // userDetails
  {
    'tc70rd2g': {
      'en': 'Home',
      'fr': '',
    },
  },
  // editProfile
  {
    'b6lu99cv': {
      'en': 'Change Photo',
      'fr': '',
    },
    'x1ou3mo7': {
      'en': 'Your Name',
      'fr': '',
    },
    'ptn6taah': {
      'en': 'The email associated with this account is:',
      'fr': '',
    },
    'b93ui5f1': {
      'en': 'Save Changes',
      'fr': '',
    },
    '4y0lhmj2': {
      'en': 'Edit Profile',
      'fr': '',
    },
  },
  // projectDetailsHealthAi
  {
    'ucf5eidy': {
      'en': 'Company Meeting Event',
      'fr': '',
    },
    'f0p4owq2': {
      'en': 'Client Acquisition for Q3',
      'fr': '',
    },
    'xm5ili4p': {
      'en': 'Next Action',
      'fr': '',
    },
    '6kpadqle': {
      'en': 'Tuesday, 10:00am',
      'fr': '',
    },
    'g0mu97k7': {
      'en': 'In Progress',
      'fr': '',
    },
    'vm3agr8r': {
      'en': 'Contract Details',
      'fr': '',
    },
    '22birx81': {
      'en': '\$125,000',
      'fr': '',
    },
    'zozeew25': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'fr': '',
    },
    '1zvy51rc': {
      'en': 'Mark as Complete',
      'fr': '',
    },
    'sxgnhor0': {
      'en': 'Contract Details',
      'fr': '',
    },
    'yi900dtl': {
      'en': '\$67,000',
      'fr': '',
    },
    'v6e1ossz': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'fr': '',
    },
    'ignipdf8': {
      'en': 'Mark as Complete',
      'fr': '',
    },
    'bx11ier7': {
      'en': 'Home',
      'fr': '',
    },
  },
  // projectDetails
  {
    '14czlta0': {
      'en': 'Home',
      'fr': '',
    },
  },
  // searchPage
  {
    'j847bc3u': {
      'en': 'Add Members',
      'fr': '',
    },
    '2i8faq59': {
      'en': 'Search members...',
      'fr': '',
    },
    '9gih48o1': {
      'en': 'Option 1',
      'fr': '',
    },
    '5z55nswo': {
      'en': 'All Members',
      'fr': '',
    },
    '6yv1vh87': {
      'en': 'View',
      'fr': '',
    },
    '2ys3mm5k': {
      'en': 'Home',
      'fr': '',
    },
  },
  // messagesDetails
  {
    '1no7pwi3': {
      'en':
          'I am a freelancer and I need help writing content for a proposal for a project. Can I give you some context for the projecct I need to write a proposal for?',
      'fr': '',
    },
    'j3xk2x25': {
      'en': 'Just Now',
      'fr': '',
    },
    '42fa4kt3': {
      'en': 'Hey really love what you are doing!',
      'fr': '',
    },
    'npwj0xn2': {
      'en': 'a few moments ago',
      'fr': '',
    },
    'rat90763': {
      'en': 'This is my intro video',
      'fr': '',
    },
    '8gij5fsr': {
      'en': 'Just Now',
      'fr': '',
    },
    'tmxo4715': {
      'en': 'Hey really love what you are doing!',
      'fr': '',
    },
    '7zgytxi1': {
      'en': 'Just Now',
      'fr': '',
    },
    '5hmsxnsh': {
      'en': 'Hey really love what you are doing!',
      'fr': '',
    },
    'ifncjqcf': {
      'en': 'Just Now',
      'fr': '',
    },
    'wdi08hs5': {
      'en': 'Start typing here...',
      'fr': '',
    },
    'axl3axxq': {
      'en': 'Chat Details',
      'fr': '',
    },
    '29hgn6tf': {
      'en': 'Home',
      'fr': '',
    },
  },
  // Main_EventsDrafts
  {
    'gdhptoak': {
      'en': 'Contracts',
      'fr': '',
    },
    'sylssg61': {
      'en': 'Multi Day Bookings (Drafts)',
      'fr': '',
    },
    '3vzcshs3': {
      'en': 'Add Event',
      'fr': '',
    },
    'j1vx5ddm': {
      'en': 'View Active Events',
      'fr': '',
    },
    '2b1txtce': {
      'en': 'Upcoming Events',
      'fr': '',
    },
    'ch298a25': {
      'en': 'Draft',
      'fr': '',
    },
    'r2kaxxsy': {
      'en': 'CES Las Vegas 2024',
      'fr': '',
    },
    't9mm73gx': {
      'en': 'Draft',
      'fr': '',
    },
    'mov3wexy': {
      'en': 'CES Las Vegas 2024',
      'fr': '',
    },
    'ftq344we': {
      'en': 'Draft',
      'fr': '',
    },
    'gyjzir8q': {
      'en': 'CES Las Vegas 2024',
      'fr': '',
    },
    'q88z039e': {
      'en': 'Results',
      'fr': '',
    },
    'oyrjgayn': {
      'en': 'Mar',
      'fr': '',
    },
    'cg0urb32': {
      'en': '03',
      'fr': '',
    },
    'fk4zrig8': {
      'en': '+ Add Passengers',
      'fr': '',
    },
    'poffomiv': {
      'en': 'Contracts for New Opportunities',
      'fr': '',
    },
    'ezruo20h': {
      'en': '+ Add Vehicle Types',
      'fr': '',
    },
    'fspmmb9c': {
      'en': 'Add Required Info',
      'fr': '',
    },
    'k7lunj0w': {
      'en': 'Contracts for New Opportunities',
      'fr': '',
    },
    'knvdi8cj': {
      'en': 'Ready to be Quoted',
      'fr': '',
    },
    'xrvgdneb': {
      'en': 'Contracts for New Opportunities',
      'fr': '',
    },
    '48iov5ru': {
      'en': '4 of 5',
      'fr': '',
    },
    '5ethv580': {
      'en': 'Last completed Trip',
      'fr': '',
    },
    'w43zzp95': {
      'en': 'John Smith, Tuesday, 10:00am',
      'fr': '',
    },
    'k9wfg5ne': {
      'en': 'Completed',
      'fr': '',
    },
    '2mxf0lim': {
      'en':
          'Required information:\n- PU Time, PU location for M. X, Y, Z\n- Flight number for M. B',
      'fr': '',
    },
    'o7dixvs9': {
      'en': 'Next Scheduled Trip',
      'fr': '',
    },
    'kox37o4d': {
      'en': 'John Smith, Tuesday, 10:00am',
      'fr': '',
    },
    '0hanqaqm': {
      'en': 'On the Way',
      'fr': '',
    },
    '0bmy4thq': {
      'en': 'Mar',
      'fr': '',
    },
    'm0av51me': {
      'en': '04',
      'fr': '',
    },
    '47l6fe8h': {
      'en': '+ Add Passengers',
      'fr': '',
    },
    'uf4ra6r3': {
      'en': 'Contracts for New Opportunities',
      'fr': '',
    },
    '71rc8vmm': {
      'en': '+ Add Vehicle Types',
      'fr': '',
    },
    '14gzzl3m': {
      'en': 'Add Details',
      'fr': '',
    },
    'htiq9wvx': {
      'en': 'Contracts for New Opportunities',
      'fr': '',
    },
    '7jxnig83': {
      'en': 'Ready to be Quoted',
      'fr': '',
    },
    'ychne3if': {
      'en': 'Contracts for New Opportunities',
      'fr': '',
    },
    '4akwp5x2': {
      'en': '0 of 3',
      'fr': '',
    },
    '2u1u3pym': {
      'en': 'Last completed Trip',
      'fr': '',
    },
    'ohg4k8ay': {
      'en': 'John Smith, Tuesday, 10:00am',
      'fr': '',
    },
    '6u26j4cy': {
      'en': 'Completed',
      'fr': '',
    },
    'ucxjqpr6': {
      'en':
          'Missing information:\n- PU Time, PU location for M. X, Y, Z\n- Flight number for M. B',
      'fr': '',
    },
    'vamr3snp': {
      'en': 'Next Scheduled Trip',
      'fr': '',
    },
    'j6mwwmfc': {
      'en': 'John Smith, Tuesday, 10:00am',
      'fr': '',
    },
    'jj38ur9l': {
      'en': 'On the Way',
      'fr': '',
    },
    'xnu7qemn': {
      'en': '__',
      'fr': '',
    },
  },
  // Main_customerListCopy
  {
    'pyvh83bs': {
      'en': 'Customers',
      'fr': '',
    },
    'zjwnyvml': {
      'en': 'Invite Users',
      'fr': '',
    },
    '5nwtthmd': {
      'en': 'All',
      'fr': '',
    },
    'acfiw9xb': {
      'en': 'Name',
      'fr': '',
    },
    '5l3xx92h': {
      'en': 'Title',
      'fr': '',
    },
    'qujcvmvl': {
      'en': 'Company',
      'fr': '',
    },
    '8eccmz7f': {
      'en': 'Company',
      'fr': '',
    },
    '114yu8ht': {
      'en': 'Status',
      'fr': '',
    },
    'wmmv59i5': {
      'en': 'Randy Alcorn',
      'fr': '',
    },
    '8g6ckl3s': {
      'en': 'Head of Procurement',
      'fr': '',
    },
    'goa8sitn': {
      'en': 'ACME Co.',
      'fr': '',
    },
    'dyfxr9aw': {
      'en': 'ACME Co.',
      'fr': '',
    },
    '6shrjmht': {
      'en': 'New',
      'fr': '',
    },
    'kxun4qql': {
      'en': 'James Wiseman',
      'fr': '',
    },
    'wl80upwx': {
      'en': 'Account Manager',
      'fr': '',
    },
    'l2886q3z': {
      'en': 'ACME Co.',
      'fr': '',
    },
    'pn7l3yee': {
      'en': 'ACME Co.',
      'fr': '',
    },
    '7nt1yoqt': {
      'en': 'Contacted',
      'fr': '',
    },
    'ndx31e9c': {
      'en': 'Ignacious Rodriguez',
      'fr': '',
    },
    'oddncyjt': {
      'en': 'Sales Manager',
      'fr': '',
    },
    'f1a92sw6': {
      'en': 'Robin HQ',
      'fr': '',
    },
    'ldku7vky': {
      'en': 'Robin HQ',
      'fr': '',
    },
    'ohbpje4z': {
      'en': 'New',
      'fr': '',
    },
    '3o3mhb90': {
      'en': 'Elena Williams',
      'fr': '',
    },
    'hkrq7h1l': {
      'en': 'Head of Product & Innovation',
      'fr': '',
    },
    '00ahb6ag': {
      'en': 'Robin HQ',
      'fr': '',
    },
    'ezg5ozql': {
      'en': 'Robin HQ',
      'fr': '',
    },
    'iqdoqf97': {
      'en': 'Contacted',
      'fr': '',
    },
    'h2661bsi': {
      'en': 'Greg Brown',
      'fr': '',
    },
    '6nju1oz7': {
      'en': 'Account Manager',
      'fr': '',
    },
    've0qv7sa': {
      'en': 'Robin HQ',
      'fr': '',
    },
    'j0dl3007': {
      'en': 'Robin HQ',
      'fr': '',
    },
    'hxggb5s5': {
      'en': 'Contacted',
      'fr': '',
    },
    'o2hi70yl': {
      'en': 'June Williamson',
      'fr': '',
    },
    'z9la3b72': {
      'en': 'Sr. Account Manager',
      'fr': '',
    },
    'taco4c2k': {
      'en': 'HealthAi',
      'fr': '',
    },
    'bvo74py6': {
      'en': 'HealthAi',
      'fr': '',
    },
    'mpejmx29': {
      'en': 'Contacted',
      'fr': '',
    },
    'he0cl0o6': {
      'en': 'June Williamson',
      'fr': '',
    },
    '2fp6xvca': {
      'en': 'Sr. Account Manager',
      'fr': '',
    },
    'qbkv409g': {
      'en': 'HealthAi',
      'fr': '',
    },
    '65n9qnox': {
      'en': 'HealthAi',
      'fr': '',
    },
    'rqdaos7d': {
      'en': 'Contacted',
      'fr': '',
    },
    'rf5nn5ve': {
      'en': 'New Calls',
      'fr': '',
    },
    '38lqr7on': {
      'en': 'Name',
      'fr': '',
    },
    'ulku5w1i': {
      'en': 'Title',
      'fr': '',
    },
    '0at81vgp': {
      'en': 'Company',
      'fr': '',
    },
    '83l0zbzh': {
      'en': 'Company',
      'fr': '',
    },
    '6fdrgjni': {
      'en': 'Status',
      'fr': '',
    },
    'ra08mcdo': {
      'en': 'Randy Alcorn',
      'fr': '',
    },
    '189ea0h5': {
      'en': 'Head of Procurement',
      'fr': '',
    },
    'ijngqlum': {
      'en': 'ACME Co.',
      'fr': '',
    },
    'ueir2iwp': {
      'en': 'ACME Co.',
      'fr': '',
    },
    'v9bblt05': {
      'en': 'New',
      'fr': '',
    },
    'x3f3u126': {
      'en': 'Ignacious Rodriguez',
      'fr': '',
    },
    'ozoe4e01': {
      'en': 'Sales Manager',
      'fr': '',
    },
    'kep8z15g': {
      'en': 'Robin HQ',
      'fr': '',
    },
    'nx2bhnhn': {
      'en': 'Robin HQ',
      'fr': '',
    },
    'qlis8rrf': {
      'en': 'New',
      'fr': '',
    },
    'bcrpqa9b': {
      'en': 'Contacted',
      'fr': '',
    },
    'kavtfp4d': {
      'en': 'Name',
      'fr': '',
    },
    'jc841amr': {
      'en': 'Title',
      'fr': '',
    },
    'x4zlqggi': {
      'en': 'Company',
      'fr': '',
    },
    '16sxo7qh': {
      'en': 'Company',
      'fr': '',
    },
    'i9szmbp9': {
      'en': 'Status',
      'fr': '',
    },
    '6vls6bbc': {
      'en': 'James Wiseman',
      'fr': '',
    },
    'vznkt21h': {
      'en': 'Account Manager',
      'fr': '',
    },
    'p3bwx4pu': {
      'en': 'ACME Co.',
      'fr': '',
    },
    'e1fcin6d': {
      'en': 'ACME Co.',
      'fr': '',
    },
    'wrkg046z': {
      'en': 'Contacted',
      'fr': '',
    },
    'a0dzs0xw': {
      'en': 'Elena Williams',
      'fr': '',
    },
    'w3rxq9io': {
      'en': 'Head of Product & Innovation',
      'fr': '',
    },
    'dj7gns1z': {
      'en': 'Robin HQ',
      'fr': '',
    },
    'an4lbj5a': {
      'en': 'Robin HQ',
      'fr': '',
    },
    '46ue06r1': {
      'en': 'Contacted',
      'fr': '',
    },
    'koa07p3q': {
      'en': 'Greg Brown',
      'fr': '',
    },
    'la905nbm': {
      'en': 'Account Manager',
      'fr': '',
    },
    'ou2jd3n8': {
      'en': 'Robin HQ',
      'fr': '',
    },
    '8qpfyeny': {
      'en': 'Robin HQ',
      'fr': '',
    },
    'y54gdme1': {
      'en': 'Contacted',
      'fr': '',
    },
    'fiotcgs9': {
      'en': 'June Williamson',
      'fr': '',
    },
    'rng6js19': {
      'en': 'Sr. Account Manager',
      'fr': '',
    },
    's03j7583': {
      'en': 'HealthAi',
      'fr': '',
    },
    'ddairnw9': {
      'en': 'HealthAi',
      'fr': '',
    },
    '822emhlb': {
      'en': 'Contacted',
      'fr': '',
    },
    'qq40p6zq': {
      'en': 'June Williamson',
      'fr': '',
    },
    'abg4vjnu': {
      'en': 'Sr. Account Manager',
      'fr': '',
    },
    'f0beelsc': {
      'en': 'HealthAi',
      'fr': '',
    },
    'r28flxe4': {
      'en': 'HealthAi',
      'fr': '',
    },
    'rrj7omwl': {
      'en': 'Contacted',
      'fr': '',
    },
    'ymkjl9iq': {
      'en': 'Customers',
      'fr': '',
    },
    'k0wyce3a': {
      'en': '__',
      'fr': '',
    },
  },
  // projectDetailsCopy
  {
    'qc4d17wm': {
      'en': 'Home',
      'fr': '',
    },
  },
  // projectDetailsHealthAiCopy
  {
    'sllramc9': {
      'en': 'Company Meeting Event',
      'fr': '',
    },
    'd3xraolk': {
      'en': 'Client Acquisition for Q3',
      'fr': '',
    },
    'y2cx85c6': {
      'en': 'Next Action',
      'fr': '',
    },
    'zz9nlsdb': {
      'en': 'Tuesday, 10:00am',
      'fr': '',
    },
    '4yqh0t30': {
      'en': 'In Progress',
      'fr': '',
    },
    'fyizef3h': {
      'en': 'Contract Details',
      'fr': '',
    },
    'scxjxy3a': {
      'en': '\$125,000',
      'fr': '',
    },
    '1vws3d3g': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'fr': '',
    },
    '362i3oa6': {
      'en': 'Mark as Complete',
      'fr': '',
    },
    'tc1dhrle': {
      'en': 'Contract Details',
      'fr': '',
    },
    'baznaxkk': {
      'en': '\$67,000',
      'fr': '',
    },
    'wv27a5f4': {
      'en':
          'Additional Details around this contract and who is working on it in this card!',
      'fr': '',
    },
    '15be9md0': {
      'en': 'Mark as Complete',
      'fr': '',
    },
    'cqyd07r7': {
      'en': 'Home',
      'fr': '',
    },
  },
  // userDetailsCopy
  {
    'zj9l8xqv': {
      'en': 'Home',
      'fr': '',
    },
  },
  // modal_success
  {
    'n5eogzq9': {
      'en': 'Send Contract Confirmation',
      'fr': '',
    },
    '762sp34p': {
      'en': 'A new contract has been generated for:',
      'fr': '',
    },
    'vnxbonn6': {
      'en': 'Randy Alcorn',
      'fr': '',
    },
    'm3m0ziwl': {
      'en': 'Head of Procurement',
      'fr': '',
    },
    'gkn4lna8': {
      'en': 'ACME Co.',
      'fr': '',
    },
    'w2qufve9': {
      'en': 'Next Steps',
      'fr': '',
    },
    '9iai2t1y': {
      'en':
          'Send the information below. And we will send an email with details to the customer and allow you to manage it in your dashboard.',
      'fr': '',
    },
    '5oh58d5g': {
      'en': 'Send Information',
      'fr': '',
    },
    '0tg7yvto': {
      'en': 'Never Mind',
      'fr': '',
    },
  },
  // modal_Message
  {
    'urq4auc7': {
      'en': 'Congratulations!',
      'fr': '',
    },
    'yij98cos': {
      'en':
          'Now that a contract has been generated for this customer please contact them with the date you will send the signed agreement.',
      'fr': '',
    },
    '4kb5j3l4': {
      'en': 'Okay',
      'fr': '',
    },
    '0ntr8kjc': {
      'en': 'Continue',
      'fr': '',
    },
  },
  // modal_Welcome
  {
    'ukmvaxgu': {
      'en': 'Congratulations!',
      'fr': '',
    },
    'yunzocxi': {
      'en': 'A new contract has been generated for:',
      'fr': '',
    },
    'rpuyg5ph': {
      'en': 'Continue',
      'fr': '',
    },
  },
  // createComment
  {
    '94639n3x': {
      'en': 'Create Note',
      'fr': '',
    },
    '02s727j0': {
      'en': 'Find members by searching below',
      'fr': '',
    },
    'pphi55ks': {
      'en': 'Ricky Rodriguez',
      'fr': '',
    },
    'frvrizr6': {
      'en': 'Enter your note here...',
      'fr': '',
    },
    'mbee2rer': {
      'en': 'Create Note',
      'fr': '',
    },
  },
  // mobileNav
  {
    'pyaihjeu': {
      'en': 'Dashboard',
      'fr': '',
    },
    'w7luk9ip': {
      'en': 'My Team',
      'fr': '',
    },
    '74hagbrg': {
      'en': 'Customers',
      'fr': '',
    },
    'njfu7mz7': {
      'en': 'Contracts',
      'fr': '',
    },
    'yvhmllii': {
      'en': 'Profile',
      'fr': '',
    },
  },
  // webNav
  {
    'no6keotq': {
      'en': 'Search',
      'fr': '',
    },
    '1zypjzwx': {
      'en': 'Dashboard',
      'fr': '',
    },
    '21kidwus': {
      'en': 'Passengers',
      'fr': '',
    },
    '3czw0vdg': {
      'en': 'Multi Day Bookings',
      'fr': '',
    },
    '7kxtaa0j': {
      'en': 'Drafts',
      'fr': '',
    },
    'ooqbmro1': {
      'en': 'Bookings',
      'fr': '',
    },
    'wtz42y2a': {
      'en': 'Drafts',
      'fr': '',
    },
    '4u8prxsc': {
      'en': 'Active Trips',
      'fr': '',
    },
    '0ul3erjn': {
      'en': 'Profile',
      'fr': '',
    },
  },
  // commandPalette
  {
    '31ev0wcm': {
      'en': 'Search platform...',
      'fr': '',
    },
    'bmo5x10g': {
      'en': 'Search',
      'fr': '',
    },
    'jvfd76d1': {
      'en': 'Quick Links',
      'fr': '',
    },
    '3gguvhdl': {
      'en': 'Add Quiz',
      'fr': '',
    },
    'oecs8ta2': {
      'en': 'Find Customer',
      'fr': '',
    },
    'hlb1myi8': {
      'en': 'New Project',
      'fr': '',
    },
    'uzd1c29o': {
      'en': 'New Customer',
      'fr': '',
    },
  },
  // editProfilePhoto
  {
    'larmydk3': {
      'en': 'Change Photo',
      'fr': '',
    },
    'y78bcv6e': {
      'en':
          'Upload a new photo below in order to change your avatar seen by others.',
      'fr': '',
    },
    'tjt2mxus': {
      'en': 'Upload Image',
      'fr': '',
    },
    '7l9svoxu': {
      'en': 'Save Changes',
      'fr': '',
    },
  },
  // user_Details_main
  {
    'c7zlbw77': {
      'en': 'Customer Name',
      'fr': '',
    },
    'royhzp4m': {
      'en': 'Randy Alcorn',
      'fr': '',
    },
    'wlvqs65b': {
      'en': 'VVIP',
      'fr': '',
    },
    'supjafsx': {
      'en': 'Title',
      'fr': '',
    },
    '4p6tz7ib': {
      'en': 'Head of Procurement',
      'fr': '',
    },
    'eymlpuz6': {
      'en': 'Company',
      'fr': '',
    },
    'sm55bydk': {
      'en': 'ACME Co.',
      'fr': '',
    },
    'u1eo4woa': {
      'en': 'Past Trips',
      'fr': '',
    },
    'exz76r7n': {
      'en': 'Alexandria Smith',
      'fr': '',
    },
    'a16wnkgf': {
      'en': '1m ago',
      'fr': '',
    },
    's2a72umq': {
      'en':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      'fr': '',
    },
    'l2hskroi': {
      'en': '8',
      'fr': '',
    },
    'p9wuyb0l': {
      'en': 'Notes',
      'fr': '',
    },
    'nuziz6ta': {
      'en': 'Randy Alcorn',
      'fr': '',
    },
    'p9vf48jg': {
      'en':
          'I\'m not really sure about this section here aI think you should do soemthing cool!',
      'fr': '',
    },
    'hfoeowaa': {
      'en': 'a min ago',
      'fr': '',
    },
    '4z0ryi37': {
      'en': 'Request Quote',
      'fr': '',
    },
    'hrft1euw': {
      'en': 'View Full Profile',
      'fr': '',
    },
  },
  // dropdown_UserEdit
  {
    '8eja9slh': {
      'en': 'Options',
      'fr': '',
    },
    'r5b1wwvo': {
      'en': 'Edit',
      'fr': '',
    },
    'dh31z2f4': {
      'en': 'Assign',
      'fr': '',
    },
    'ki85yazq': {
      'en': 'Share',
      'fr': '',
    },
    '6uoh6f3j': {
      'en': 'Delete',
      'fr': '',
    },
  },
  // modal_CreateProject
  {
    'amuvop54': {
      'en': 'Create Project',
      'fr': '',
    },
    'fjaa3ald': {
      'en': 'Please enter the information below to add a project.',
      'fr': '',
    },
    'zgnr0s1o': {
      'en': 'Add Photo',
      'fr': '',
    },
    '35ggb4r7': {
      'en': 'Project Name',
      'fr': '',
    },
    'dxsezhur': {
      'en': 'Description here...',
      'fr': '',
    },
    '38t6yuot': {
      'en': 'Create Project',
      'fr': '',
    },
    '7vyk12kx': {
      'en': 'Please enter a project name...',
      'fr': '',
    },
    'tt9fe2eo': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
    'qe13hfbi': {
      'en': 'Please enter a short description...',
      'fr': '',
    },
    'mu3w6lmt': {
      'en': 'Please choose an option from the dropdown',
      'fr': '',
    },
  },
  // projectDetails_alt
  {
    'p7toxskv': {
      'en': '11 Dec. 2023 - Day 1',
      'fr': '',
    },
    'q3zd1qw0': {
      'en': 'Company Meeting Event',
      'fr': '',
    },
    '7c8ul71j': {
      'en': 'WWLIMO Coordinator',
      'fr': '',
    },
    'c5h9yg08': {
      'en': 'Randy Rudolph',
      'fr': '',
    },
    'gilw34tm': {
      'en': '+1512859632',
      'fr': '',
    },
    'b53mdzok': {
      'en': 'Next Trip',
      'fr': '',
    },
    'j1wjlyda': {
      'en': 'John Smith @ 15:30, Pick up: JFK Airport BA123',
      'fr': '',
    },
    '4yxwokbg': {
      'en': 'In Progress',
      'fr': '',
    },
    'u07olewy': {
      'en': 'Passengers',
      'fr': '',
    },
    'o8kihyv3': {
      'en': 'FlutterFlow CRM App:',
      'fr': '',
    },
    'uq6lwdzx': {
      'en': ' Begin Work',
      'fr': '',
    },
    'bn4m638r': {
      'en': 'SOW Change Order',
      'fr': '',
    },
    'o1x6u7fc': {
      'en': 'FlutterFlow CRM App',
      'fr': '',
    },
    'tcmsqyvi': {
      'en': 'Jul 8, at 4:31pm',
      'fr': '',
    },
    '3amhye6l': {
      'en': 'Jeremiah Goldsten ',
      'fr': '',
    },
    'cp5zax46': {
      'en': 'accepted a request',
      'fr': '',
    },
    '78sgyj68': {
      'en': 'SOW Change Order',
      'fr': '',
    },
    'da90lyit': {
      'en': 'FlutterFlow CRM App',
      'fr': '',
    },
    'mwvr489f': {
      'en':
          '\"Notifications and reminders informing users about upcoming classes and training schedules will be sent to them via email, SMS or notifications within the application.\"',
      'fr': '',
    },
    'v36jbls2': {
      'en': 'Jul 8, at 4:30pm',
      'fr': '',
    },
    'csju2dgs': {
      'en': 'Randy Rudolph ',
      'fr': '',
    },
    '1beeoh0t': {
      'en': 'sent a SOW Change Order for ',
      'fr': '',
    },
    'slzys1v7': {
      'en': 'FlutterFlow CRM APP',
      'fr': '',
    },
    'cc9n9b85': {
      'en': 'SOW Change Order',
      'fr': '',
    },
    '1zh5frru': {
      'en': 'FlutterFlow CRM App',
      'fr': '',
    },
    '9h3pl7o4': {
      'en':
          '\"Please review the updates to this document and get back with me.\"',
      'fr': '',
    },
    '8st8qr4u': {
      'en': 'Jul 8, at 2:20pm',
      'fr': '',
    },
    'ju84kfdj': {
      'en': 'Scheduled Trips',
      'fr': '',
    },
    'uhhlegeq': {
      'en': 'Other',
      'fr': '',
    },
  },
  // modal_create_Company
  {
    'gua4nkw7': {
      'en': 'Create Company Profile',
      'fr': '',
    },
    'zm88vw80': {
      'en':
          'Upload images about your company and fill out the information below.',
      'fr': '',
    },
    'hkdx9qx4': {
      'en': 'Company Name',
      'fr': '',
    },
    'nsfn8w0f': {
      'en': 'Company City',
      'fr': '',
    },
    'w20hl82m': {
      'en': 'Website',
      'fr': '',
    },
    'nlg88t3b': {
      'en': 'Enter in your website without \"https://\"...',
      'fr': '',
    },
    '8v71r6q6': {
      'en': 'Cancel',
      'fr': '',
    },
    '4k5os33i': {
      'en': 'Create Company',
      'fr': '',
    },
  },
  // modal_inviteUser
  {
    '87p7ac3g': {
      'en': 'Edit User Details',
      'fr': '',
    },
    '4643lzty': {
      'en': 'Edit the details of the user below.',
      'fr': '',
    },
    '8yian4y7': {
      'en': 'Randy Peterson',
      'fr': '',
    },
    '2nn3hw5o': {
      'en': 'name@domainname.com',
      'fr': '',
    },
    'gvdc19s2': {
      'en': 'User Name',
      'fr': '',
    },
    '6xtike9y': {
      'en': 'Bio',
      'fr': '',
    },
    'xrk1t1kb': {
      'en': 'Admin',
      'fr': '',
    },
    '9dzg35l3': {
      'en': 'Manager',
      'fr': '',
    },
    '1bkf6g49': {
      'en': 'Editor',
      'fr': '',
    },
    'yzyo28f9': {
      'en': 'Viewer',
      'fr': '',
    },
    '64oouh1x': {
      'en': 'Please select...',
      'fr': '',
    },
    'qpspkw2g': {
      'en': 'Search for an item...',
      'fr': '',
    },
    'x542ndc8': {
      'en': 'Cancel',
      'fr': '',
    },
    's6fgwt0r': {
      'en': 'Send Invites',
      'fr': '',
    },
  },
  // modal_enterPin
  {
    'o07rwbaf': {
      'en': 'Enter your PIN below',
      'fr': '',
    },
    '5xxiigyw': {
      'en': 'Your project has been created, now invite your team to continue.',
      'fr': '',
    },
    'c3ynhzg0': {
      'en': 'Cancel',
      'fr': '',
    },
    '0pgzhjek': {
      'en': 'Verify Code',
      'fr': '',
    },
  },
  // modal_shareProject
  {
    'cc664p8u': {
      'en': 'Share your project',
      'fr': '',
    },
    'qs0jnd2y': {
      'en': 'Your project has been created, now invite your team to continue.',
      'fr': '',
    },
    'thptbii2': {
      'en': 'Randy Peterson',
      'fr': '',
    },
    'dwfitkod': {
      'en': 'name@domainname.com',
      'fr': '',
    },
    'pw87pac8': {
      'en': 'Randy Peterson',
      'fr': '',
    },
    '30giu79x': {
      'en': 'name@domainname.com',
      'fr': '',
    },
    'ramw8kjy': {
      'en': 'Randy Peterson',
      'fr': '',
    },
    'sdgbmlt3': {
      'en': 'name@domainname.com',
      'fr': '',
    },
    'kaxqkomz': {
      'en': 'Add User',
      'fr': '',
    },
    'z86u0sux': {
      'en': 'Project Link',
      'fr': '',
    },
    '7y3s0w9n': {
      'en': 'https://project.flutterflow.io/?quizRef=T7c8mXvkYFFCWjqyhxKe',
      'fr': '',
    },
    '1npzfc1b': {
      'en': 'Cancel',
      'fr': '',
    },
    '07o12uds': {
      'en': 'Send Invites',
      'fr': '',
    },
  },
  // Modal_Add_usersList
  {
    '7yu6b33n': {
      'en': 'Invite your Team',
      'fr': '',
    },
    'gmeis3w2': {
      'en': 'Your project has been created, now invite your team to continue.',
      'fr': '',
    },
    '7j916y6w': {
      'en': 'Email address...',
      'fr': '',
    },
    'hlq9sdnb': {
      'en': 'email@domainname.com',
      'fr': '',
    },
    'xr55lx30': {
      'en': 'email@domainname.com',
      'fr': '',
    },
    'py27lp9v': {
      'en': 'Cancel',
      'fr': '',
    },
    'laz2f823': {
      'en': 'Send Invites',
      'fr': '',
    },
  },
  // modal_profile_Details
  {
    'lbrp7zd6': {
      'en': 'Profile Details',
      'fr': '',
    },
    'b7e10gbe': {
      'en': 'Below are your profile details',
      'fr': '',
    },
    '5g5rmu3f': {
      'en': 'Randy Peterson',
      'fr': '',
    },
    '5doc6z5s': {
      'en': 'name@domainname.com',
      'fr': '',
    },
    'jyg1ja56': {
      'en': 'Manage your account',
      'fr': '',
    },
    'fav5img7': {
      'en': 'Edit Profile',
      'fr': '',
    },
    '1rw02ym7': {
      'en': 'Reset Password',
      'fr': '',
    },
    'zeqhk94o': {
      'en': 'Light Mode',
      'fr': '',
    },
    'n88a2sqi': {
      'en': 'Dark Mode',
      'fr': '',
    },
    'dox2iq52': {
      'en': 'Get in Touch',
      'fr': '',
    },
    '1dha5c02': {
      'en': 'Help & Support',
      'fr': '',
    },
    'pb56q1pn': {
      'en': 'Share [App Name]',
      'fr': '',
    },
    'yeggo8pw': {
      'en': 'Close',
      'fr': '',
    },
  },
  // modal_profile_Edit
  {
    'ko68vs3q': {
      'en': 'Edit Profile',
      'fr': '',
    },
    'j6ljc21o': {
      'en': 'Below are your profile details',
      'fr': '',
    },
    '4sqnvi6a': {
      'en': 'Change Photo',
      'fr': '',
    },
    '62dmf8ms': {
      'en': 'Your Name',
      'fr': '',
    },
    'vozej56k': {
      'en': 'Short Description',
      'fr': '',
    },
    'b7upamia': {
      'en': 'Admin',
      'fr': '',
    },
    'iydf4sp7': {
      'en': 'Admin',
      'fr': '',
    },
    'q9bvkoge': {
      'en': 'Manager',
      'fr': '',
    },
    'n8y2yhms': {
      'en': 'Editor',
      'fr': '',
    },
    'godbixjj': {
      'en': 'Viewer',
      'fr': '',
    },
    '26hpkce1': {
      'en': 'Please select...',
      'fr': '',
    },
    'ki5rpevj': {
      'en': 'Search for an item...',
      'fr': '',
    },
    'j2n18vc0': {
      'en': 'The email associated with this account is:',
      'fr': '',
    },
    'ur83kxyc': {
      'en': 'casper@ghostbusters.com',
      'fr': '',
    },
    '19m3qeay': {
      'en': 'Created On:',
      'fr': '',
    },
    'iyo5gpgt': {
      'en': 'July 12th, 2023',
      'fr': '',
    },
    'gq3xpj3w': {
      'en': 'Last Active:',
      'fr': '',
    },
    'waud6k3k': {
      'en': 'Just Now',
      'fr': '',
    },
    'e9q8fwip': {
      'en': 'Cancel',
      'fr': '',
    },
    '0vuocx97': {
      'en': 'Save Changes',
      'fr': '',
    },
  },
  // Miscellaneous
  {
    '0nwoj0kc': {
      'en': 'Email address',
      'fr': '',
    },
    'upni203i': {
      'en': 'Password',
      'fr': '',
    },
    'x5hsigqw': {
      'en': 'Button',
      'fr': '',
    },
    '9wy77t9v': {
      'en': 'Button',
      'fr': '',
    },
    'woezzutp': {
      'en': 'Button',
      'fr': '',
    },
    '2bj20mi4': {
      'en': 'Button',
      'fr': '',
    },
    'oztjr3ws': {
      'en': 'Button',
      'fr': '',
    },
    'hc87g50d': {
      'en': 'Button',
      'fr': '',
    },
    '8ct6cr3a': {
      'en': 'Button',
      'fr': '',
    },
    'e368pegn': {
      'en': 'Button',
      'fr': '',
    },
    'yv65a6i5': {
      'en': 'Button',
      'fr': '',
    },
    '4r7kaahz': {
      'en': 'Calling',
      'fr': '',
    },
    '9zk4wopm': {
      'en': 'Not Called',
      'fr': '',
    },
    'xn2fkope': {
      'en': 'Pending Review',
      'fr': '',
    },
    'jv85czds': {
      'en': 'Closed',
      'fr': '',
    },
    'swt4x372': {
      'en': 'Completed',
      'fr': '',
    },
    '5w6ne1dl': {
      'en': 'Please select...',
      'fr': '',
    },
    'uhfmgei0': {
      'en': 'Search for an item...',
      'fr': '',
    },
    'lted0txl': {
      'en': 'All',
      'fr': '',
    },
    'm6iqz668': {
      'en': 'Pending',
      'fr': '',
    },
    'x2pvxk5r': {
      'en': 'Completed',
      'fr': '',
    },
    'txjoh349': {
      'en': 'Calling',
      'fr': '',
    },
    'qube3xir': {
      'en': 'All',
      'fr': '',
    },
    'mxalfkji': {
      'en': '50%',
      'fr': '',
    },
    'z6o24u9q': {
      'en': 'Notifications',
      'fr': '',
    },
    'poegde7v': {
      'en': 'Notifications',
      'fr': '',
    },
    'v3vjad01': {
      'en': 'Turn on notifications',
      'fr': '',
    },
    'bqjgqich': {
      'en': 'Male',
      'fr': '',
    },
    'rzl2h9ar': {
      'en': 'Female',
      'fr': '',
    },
    'qtchqf19': {
      'en': 'Other',
      'fr': '',
    },
    '82a75t5n': {
      'en': 'Design',
      'fr': '',
    },
    'w82xuklg': {
      'en': 'Marketing',
      'fr': '',
    },
    '5uiyxwtk': {
      'en': 'Development',
      'fr': '',
    },
    '3wjkerx7': {
      'en': 'Management',
      'fr': '',
    },
    'p6rgfj1v': {
      'en': 'Operations',
      'fr': '',
    },
    'c8uww550': {
      'en': 'Customer Service',
      'fr': '',
    },
    '2rhm2suy': {
      'en': 'Design',
      'fr': '',
    },
    'hxsxj681': {
      'en': '',
      'fr': '',
    },
    'e7agr7ys': {
      'en': '',
      'fr': '',
    },
    '65e2tfs2': {
      'en': '',
      'fr': '',
    },
    'ddazihx4': {
      'en': '',
      'fr': '',
    },
    'db03cpjj': {
      'en': '',
      'fr': '',
    },
    'fdb9078p': {
      'en': '',
      'fr': '',
    },
    '80ouzj9q': {
      'en': '',
      'fr': '',
    },
    '6rzhptp9': {
      'en': '',
      'fr': '',
    },
    'ce8c4ty0': {
      'en': '',
      'fr': '',
    },
    'pf1odowy': {
      'en': '',
      'fr': '',
    },
    'lqla79dv': {
      'en': '',
      'fr': '',
    },
    'kcvqa08x': {
      'en': '',
      'fr': '',
    },
    'dqrzd6sq': {
      'en': '',
      'fr': '',
    },
    'dpqtohyf': {
      'en': '',
      'fr': '',
    },
    'v01vf71s': {
      'en': '',
      'fr': '',
    },
    'gcv6def1': {
      'en': '',
      'fr': '',
    },
    'um9es99m': {
      'en': '',
      'fr': '',
    },
    'o4enbz4j': {
      'en': '',
      'fr': '',
    },
    '8z4tvfh7': {
      'en': '',
      'fr': '',
    },
    '2ybzla8x': {
      'en': '',
      'fr': '',
    },
    'd1wdf5i1': {
      'en': '',
      'fr': '',
    },
    'f4rdu9en': {
      'en': '',
      'fr': '',
    },
    '2py80kgi': {
      'en': '',
      'fr': '',
    },
    'p6lsrh2a': {
      'en': '',
      'fr': '',
    },
    'ne8cclp9': {
      'en': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
