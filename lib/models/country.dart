class Country {
  final String countryEn;

  final String countryAr;

  final String flagUrl;
  final String code;
  Country({this.countryEn, this.countryAr, this.flagUrl, this.code});

}



class Countries {
  static List<Country> countriesData() {
    return [
      Country(countryEn: 'Jordan', countryAr: 'الأردن', code: 'JO'),
      Country(
          countryEn: 'United Arab Emirates',
          countryAr: 'الإمارات العربية المتحدة',
          code: 'AE'),
      Country(countryEn: 'Bahrain', countryAr: 'البحرين', code: 'BH'),
      Country(countryEn: 'Algeria', countryAr: 'الجزائر', code: 'DZ'),

      Country(countryEn: 'Saudi Arabia', countryAr: 'السعودية', code: 'SA'),
      Country(countryEn: 'Sudan', countryAr: 'السودان', code: 'SD'),
      Country(countryEn: 'Somalia', countryAr: 'الصومال', code: 'SO'),
      Country(countryEn: 'Iraq', countryAr: 'العراق', code: 'IQ'),
      Country(countryEn: 'Kuwait', countryAr: 'الكويت', code: 'KW'),
      Country(countryEn: 'Morocco', countryAr: 'المغرب', code: 'MA'),
      Country(countryEn: 'Yemen', countryAr: 'اليمن', code: 'YE'),
      Country(countryEn: 'Tunisia', countryAr: 'تونس', code: 'TN'),
      Country(countryEn: 'Comoros', countryAr: 'جزر القمر', code: 'KM'),
      Country(countryEn: 'Djibouti', countryAr: 'جيبوتي', code: 'DJ'),
      Country(
          countryEn: 'Syrian Arab Republic', countryAr: 'سوريا', code: 'SY'),

      Country(countryEn: 'Oman', countryAr: 'عمان', code: 'OM'),
      Country(countryEn: 'Palestin', countryAr: 'فلسطين', code: 'PS'),
      Country(countryEn: 'Qatar', countryAr: 'قطر', code: 'QA'),
      Country(countryEn: 'Lebanon', countryAr: 'لبنان', code: 'LB'),
      Country(
          countryEn: 'Libyan Arab Jamahiriya', countryAr: 'ليبيا', code: 'LY'),
      Country(countryEn: 'Egypt', countryAr: 'مصر', code: 'EG'),
      Country(countryEn: 'Mauritania', countryAr: 'موريتانيا', code: 'MR'),

      Country(countryEn: 'Italy', countryAr: 'إيطاليا', code: 'IT'),

      Country(countryEn: 'Iran', countryAr: 'إيران', code: 'IR'),
      Country(countryEn: 'China', countryAr: 'الصين', code: 'CN'),
      Country(countryEn: 'Israel', countryAr: 'إسرائيل', code: 'IL'),

      Country(countryEn: 'US', countryAr: 'الولايات المتحدة', code: 'US'),

      Country(
          countryEn: 'United Kingdom',
          countryAr: 'المملكة المتحدة',
          code: 'GB'),
      Country(countryEn: 'Turkey', countryAr: 'تركيا', code: 'TR'),

      Country(countryEn: 'Afghanistan', countryAr: 'أفغانستان', code: 'AF'),
      // Country(countryEn: 'Åland Islands', countryAr: 'جزر أولاند', code: 'AX'),
      Country(countryEn: 'Albania', countryAr: 'ألبانيا', code: 'AL'),
      // Country(
      //     countryEn: 'American Samoa',
      //     countryAr: 'ساموا الأمريكية',
      //     code: 'AS'),
      Country(countryEn: 'AndorrA', countryAr: 'أندورا', code: 'AD'),
      Country(countryEn: 'Angola', countryAr: 'أنغولا', code: 'AO'),
      // Country(countryEn: 'Anguilla', countryAr: 'أنغويلا', code: 'AI'),
      // Country(
      //     countryEn: 'Antarctica',
      //     countryAr: 'القارة القطبية الجنوبية',
      //     code: 'AQ'),
      Country(countryEn: 'Antigua', countryAr: 'أنتيغوا وباربودا', code: 'AG'),
      Country(countryEn: 'Argentina', countryAr: 'الأرجنتين', code: 'AR'),
      Country(countryEn: 'Armenia', countryAr: 'أرمينيا', code: 'AM'),
      Country(countryEn: 'Aruba', countryAr: 'أروبا', code: 'AW'),
      Country(countryEn: 'Australia', countryAr: 'أستراليا', code: 'AU'),
      Country(countryEn: 'Austria', countryAr: 'النمسا', code: 'AT'),
      Country(countryEn: 'Azerbaijan', countryAr: 'أذربيجان', code: 'AZ'),
      Country(countryEn: 'Bahamas', countryAr: 'باهاماس', code: 'BS'),
      Country(countryEn: 'Bangladesh', countryAr: 'بنغلاديش', code: 'BD'),
      Country(countryEn: 'Barbados', countryAr: 'باربادوس', code: 'BB'),
      Country(countryEn: 'Belarus', countryAr: 'روسيا البيضاء', code: 'BY'),
      Country(countryEn: 'Belgium', countryAr: 'بلجيكا', code: 'BE'),
      Country(countryEn: 'Belize', countryAr: 'بليز', code: 'BZ'),
      Country(countryEn: 'Benin', countryAr: 'بنين', code: 'BJ'),
      Country(countryEn: 'Bermuda', countryAr: 'برمودا', code: 'BM'),
      Country(countryEn: 'Bhutan', countryAr: 'بوتان', code: 'BT'),
      Country(countryEn: 'Bolivia', countryAr: 'بوليفيا', code: 'BO'),
      Country(
          countryEn: 'Bosnia and Herzegovina',
          countryAr: 'البوسنة والهرسك',
          code: 'BA'),
      // Country(countryEn: 'Botswana', countryAr: 'بوتسوانا', code: 'BW'),
      // Country(countryEn: 'Bouvet Island', countryAr: 'جزيرة بوفيه', code: 'BV'),
      Country(countryEn: 'Brazil', countryAr: 'البرازيل', code: 'BR'),
      // Country(
      //     countryEn: 'British Indian Ocean Territory',
      //     countryAr: 'إقليم المحيط الهندي البريطاني',
      //     code: 'IO'),
      Country(countryEn: 'Brunei', countryAr: 'بروناي', code: 'BN'),
      Country(countryEn: 'Bulgaria', countryAr: 'بلغاريا', code: 'BG'),
      Country(countryEn: 'Burkina Faso', countryAr: 'بوركينا فاسو', code: 'BF'),
      // Country(countryEn: 'Burundi', countryAr: 'بوروندي', code: 'BI'),
      Country(countryEn: 'Cambodia', countryAr: 'كمبوديا', code: 'KH'),
      Country(countryEn: 'Cameroon', countryAr: 'الكاميرون', code: 'CM'),
      Country(countryEn: 'Canada', countryAr: 'كندا', code: 'CA'),
      // Country(countryEn: 'Cape Verde', countryAr: 'الرأس الأخضر', code: 'CV'),
      // Country(countryEn: 'Cayman Islands', countryAr: 'جزر كايمان', code: 'KY'),
      // Country(
      //     countryEn: 'Central African Republic',
      //     countryAr: 'جمهورية أفريقيا الوسطى',
      //     code: 'CF'),
      // Country(countryEn: 'Chad', countryAr: 'تشاد', code: 'TD'),
      Country(countryEn: 'Chile', countryAr: 'تشيلي', code: 'CL'),
      // Country(
      //     countryEn: 'Christmas Island',
      //     countryAr: 'جزيرة عيد الميلاد',
      //     code: 'CX'),
      // Country(
      //     countryEn: 'Cocos (Keeling) Islands',
      //     countryAr: 'جزر كوكوس',
      //     code: 'CC'),
      Country(countryEn: 'Colombia', countryAr: 'كولومبيا', code: 'CO'),
      Country(countryEn: 'Congo', countryAr: 'جمهورية الكونغو', code: 'CG'),
      // Country(
      //     countryEn: 'Congo, The DemocratCameroonic Republic of the',
      //     countryAr: 'جمهورية الكونغو الديمقراطية',
      //     code: 'CD'),
      // Country(countryEn: 'Cook Islands', countryAr: 'جزر كوك', code: 'CK'),
      Country(countryEn: 'Costa Rica', countryAr: 'كوستاريكا', code: 'CR'),
      Country(countryEn: 'Cote d\'Ivoire', countryAr: 'ساحل العاج', code: 'CI'),
      Country(countryEn: 'Croatia', countryAr: 'كرواتيا', code: 'HR'),
      Country(countryEn: 'Cuba', countryAr: 'كوبا', code: 'CU'),
      Country(countryEn: 'Cyprus', countryAr: 'قبرص', code: 'CY'),
      // Country(
      //     countryEn: 'Czech Republic', countryAr: 'جمهورية التشيك', code: 'CZ'),
      Country(countryEn: 'Denmark', countryAr: 'الدنمارك', code: 'DK'),
      Country(countryEn: 'Dominica', countryAr: 'دومينيكا', code: 'DM'),
      Country(
          countryEn: 'Dominican Republic',
          countryAr: 'جمهورية الدومينيكان',
          code: 'DO'),
      Country(countryEn: 'Ecuador', countryAr: 'الإكوادور', code: 'EC'),
      Country(countryEn: 'El Salvador', countryAr: 'السلفادور', code: 'SV'),
      Country(countryEn: 'Guinea', countryAr: 'غينيا الاستوائية', code: 'GQ'),
      Country(countryEn: 'Eritrea', countryAr: 'إريتريا', code: 'ER'),
      Country(countryEn: 'Estonia', countryAr: 'إستونيا', code: 'EE'),
      Country(countryEn: 'Ethiopia', countryAr: 'إثيوبيا', code: 'ET'),
      // Country(
      //     countryEn: 'Falkland Islands (Malvinas)',
      //     countryAr: 'جزر فوكلاند',
      //     code: 'FK'),
      // Country(countryEn: 'Faroe Islands', countryAr: 'جزر فارو', code: 'FO'),
      Country(countryEn: 'Fiji', countryAr: 'فيجي', code: 'FJ'),
      Country(countryEn: 'Finland', countryAr: 'فنلندا', code: 'FI'),
      Country(countryEn: 'France', countryAr: 'فرنسا', code: 'FR'),
      // Country(
      //     countryEn: 'French Guiana', countryAr: 'غويانا الفرنسية', code: 'GF'),
      // Country(
      //     countryEn: 'French Polynesia',
      //     countryAr: 'بولينزيا الفرنسية',
      //     code: 'PF'),
      // Country(
      //     countryEn: 'French Southern Territories',
      //     countryAr: 'أراض فرنسية جنوبية وأنتارتيكية',
      //     code: 'TF'),
      Country(countryEn: 'Gabon', countryAr: 'الغابون', code: 'GA'),
      Country(countryEn: 'Gambia', countryAr: 'غامبيا', code: 'GM'),
      Country(countryEn: 'Georgia', countryAr: 'جورجيا', code: 'GE'),
      Country(countryEn: 'Germany', countryAr: 'ألمانيا', code: 'DE'),
      Country(countryEn: 'Ghana', countryAr: 'غانا', code: 'GH'),
      Country(countryEn: 'Gibraltar', countryAr: 'جبل طارق', code: 'GI'),
      Country(countryEn: 'Greece', countryAr: 'اليونان', code: 'GR'),
      Country(countryEn: 'Greenland', countryAr: 'جرينلاند', code: 'GL'),
      Country(countryEn: 'Grenada', countryAr: 'غرينادا', code: 'GD'),
      Country(countryEn: 'Guadeloupe', countryAr: 'غوادلوب', code: 'GP'),
      // Country(countryEn: 'Guam', countryAr: 'غوام', code: 'GU'),
      Country(countryEn: 'Guatemala', countryAr: 'غواتيمالا', code: 'GT'),
      // Country(countryEn: 'Guernsey', countryAr: 'غيرنزي', code: 'GG'),
      Country(countryEn: 'Guinea', countryAr: 'غينيا', code: 'GN'),
      Country(countryEn: 'Guinea', countryAr: 'غينيا بيساو', code: 'GW'),
      Country(countryEn: 'Guyana', countryAr: 'غيانا', code: 'GY'),
      Country(countryEn: 'Haiti', countryAr: 'هايتي', code: 'HT'),
      // Country(
      //     countryEn: 'Heard Island and Mcdonald Islands',
      //     countryAr: 'جزيرة هيرد وجزر ماكدونالد',
      //     code: 'HM'),
      // Country(
      //     countryEn: 'Holy See (Vatican City State)',
      //     countryAr: 'الفاتيكان',
      //     code: 'VA'),
      Country(countryEn: 'Honduras', countryAr: 'هندوراس', code: 'HN'),
      // Country(countryEn: 'Hong Kong', countryAr: 'هونغ كونغ', code: 'HK'),
      Country(countryEn: 'Hungary', countryAr: 'المجر', code: 'HU'),
      Country(countryEn: 'Iceland', countryAr: 'آيسلندا', code: 'IS'),
      Country(countryEn: 'India', countryAr: 'الهند', code: 'IN'),
      Country(countryEn: 'Indonesia', countryAr: 'إندونيسيا', code: 'ID'),
      Country(countryEn: 'Ireland', countryAr: 'أيرلندا', code: 'IE'),
      // Country(countryEn: 'Isle of Man', countryAr: 'جزيرة مان', code: 'IM'),
      Country(countryEn: 'Jamaica', countryAr: 'جامايكا', code: 'JM'),
      Country(countryEn: 'Japan', countryAr: 'اليابان', code: 'JP'),
      // Country(countryEn: 'Jersey', countryAr: 'جيرزي', code: 'JE'),
      Country(countryEn: 'Kazakhstan', countryAr: 'كازاخستان', code: 'KZ'),
      Country(countryEn: 'Kenya', countryAr: 'كينيا', code: 'KE'),
      // Country(countryEn: 'Kiribati', countryAr: 'كيريباتي', code: 'KI'),
      // Country(
      //     countryEn: 'Korea, Democratic People\'S Republic of',
      //     countryAr: 'كوريا الشمالية',
      //     code: 'KP'),
      Country(
          countryEn: 'Korea, South', countryAr: 'كوريا الجنوبية', code: 'KR'),
      Country(countryEn: 'Kyrgyzstan', countryAr: 'قيرغيزستان', code: 'KG'),
      // Country(
      //     countryEn: 'Lao People\'S Democratic Republic',
      //     countryAr: 'لاوس',
      //     code: 'LA'),
      Country(countryEn: 'Latvia', countryAr: 'لاتفيا', code: 'LV'),
      // Country(countryEn: 'Lesotho', countryAr: 'ليسوتو', code: 'LS'),
      Country(countryEn: 'Liberia', countryAr: 'ليبيريا', code: 'LR'),
      Country(countryEn: 'Liechtenstein', countryAr: 'ليختنشتاين', code: 'LI'),
      Country(countryEn: 'Lithuania', countryAr: 'ليتوانيا', code: 'LT'),
      Country(countryEn: 'Luxembourg', countryAr: 'لوكسمبورغ', code: 'LU'),
      Country(countryEn: 'Macao', countryAr: 'ماكاو', code: 'MO'),
      Country(countryEn: 'Macedonia', countryAr: 'مقدونيا', code: 'MK'),
      Country(countryEn: 'Madagascar', countryAr: 'مدغشقر', code: 'MG'),
      // Country(countryEn: 'Malawi', countryAr: 'مالاوي', code: 'MW'),
      Country(countryEn: 'Malaysia', countryAr: 'ماليزيا', code: 'MY'),
      Country(countryEn: 'Maldives', countryAr: 'جزر المالديف', code: 'MV'),
      Country(countryEn: 'Mali', countryAr: 'مالي', code: 'ML'),
      Country(countryEn: 'Malta', countryAr: 'مالطا', code: 'MT'),
      // Country(
      //     countryEn: 'Marshall Islands', countryAr: 'جزر مارشال', code: 'MH'),
      Country(countryEn: 'Martinique', countryAr: 'مارتينيك', code: 'MQ'),
      Country(countryEn: 'Mauritius', countryAr: 'موريشيوس', code: 'MU'),
      Country(countryEn: 'Mayotte', countryAr: 'مايوت', code: 'YT'),
      Country(countryEn: 'Mexico', countryAr: 'المكسيك', code: 'MX'),
      // Country(
      //     countryEn: 'Micronesia, Federated States of',
      //     countryAr: 'ولايات ميكرونيسيا المتحدة',
      //     code: 'FM'),
      Country(countryEn: 'Moldova', countryAr: 'مولدوفا', code: 'MD'),
      Country(countryEn: 'Monaco', countryAr: 'موناكو', code: 'MC'),
      Country(countryEn: 'Mongolia', countryAr: 'منغوليا', code: 'MN'),
      Country(countryEn: 'Montserrat', countryAr: 'مونتسيرات', code: 'MS'),
      Country(countryEn: 'Mozambique', countryAr: 'موزمبيق', code: 'MZ'),
      Country(countryEn: 'Myanmar', countryAr: 'ميانمار', code: 'MM'),
      Country(countryEn: 'Namibia', countryAr: 'ناميبيا', code: 'NA'),
      // Country(countryEn: 'Nauru', countryAr: 'ناورو', code: 'NR'),
      Country(countryEn: 'Nepal', countryAr: 'نيبال', code: 'NP'),
      Country(countryEn: 'Netherlands', countryAr: 'هولندا', code: 'NL'),
      // Country(countryEn: 'Netherlands Antilles', countryAr: '', code: 'AN'),
      Country(countryEn: 'Caledonia', countryAr: 'كاليدونيا', code: 'NC'),
      Country(countryEn: 'New Zealand', countryAr: 'نيوزيلندا', code: 'NZ'),
      Country(countryEn: 'Nicaragua', countryAr: 'نيكاراغوا', code: 'NI'),
      Country(countryEn: 'Niger', countryAr: 'النيجر', code: 'NE'),
      Country(countryEn: 'Nigeria', countryAr: 'نيجيريا', code: 'NG'),
      // Country(countryEn: 'Niue', countryAr: 'نييوي', code: 'NU'),
      // Country(
      //     countryEn: 'Norfolk Island', countryAr: 'جزيرة نورفولك', code: 'NF'),
      // Country(
      //     countryEn: 'Northern Mariana Islands',
      //     countryAr: 'جزر ماريانا الشمالية',
      //     code: 'MP'),
      Country(countryEn: 'Norway', countryAr: 'النرويج', code: 'NO'),

      Country(countryEn: 'Pakistan', countryAr: 'باكستان', code: 'PK'),
      // Country(countryEn: 'Palau', countryAr: 'بالاو', code: 'PW'),

      Country(countryEn: 'Panama', countryAr: 'بنما', code: 'PA'),
      // Country(
      //     countryEn: 'Papua New Guinea',
      //     countryAr: 'بابوا غينيا الجديدة',
      //     code: 'PG'),
      Country(countryEn: 'Paraguay', countryAr: 'باراغواي', code: 'PY'),
      Country(countryEn: 'Peru', countryAr: 'بيرو', code: 'PE'),
      Country(countryEn: 'Philippines', countryAr: 'الفلبين', code: 'PH'),
      // Country(countryEn: 'Pitcairn', countryAr: 'جزر بيتكيرن', code: 'PN'),
      Country(countryEn: 'Poland', countryAr: 'بولندا', code: 'PL'),
      Country(countryEn: 'Portugal', countryAr: 'البرتغال', code: 'PT'),
      // Country(countryEn: 'Puerto Rico', countryAr: 'بورتوريكو', code: 'PR'),
      // Country(countryEn: 'Reunion', countryAr: 'لا ريونيون', code: 'RE'),
      Country(countryEn: 'Romania', countryAr: 'رومانيا', code: 'RO'),
      Country(countryEn: 'Russia', countryAr: 'روسيا', code: 'RU'),
      Country(countryEn: 'RWANDA', countryAr: 'رواندا', code: 'RW'),
      // Country(countryEn: 'Saint Helena', countryAr: 'سان بارتيلمي', code: 'SH'),
      // Country(
      //     countryEn: 'Saint Kitts and Nevis',
      //     countryAr: 'سانت هيلانة وأسينشين وتريستان دا كونا',
      //     code: 'KN'),
      Country(
          countryEn: 'Saint Lucia', countryAr: 'سانت كيتس ونيفيس', code: 'LC'),
      // Country(
      //     countryEn: 'Saint Pierre and Miquelon',
      //     countryAr: 'سانت لوسيا',
      //     code: 'PM'),
      Country(
          countryEn: 'Saint Vincent and the Grenadines',
          countryAr: 'سانت فينسنت والغرينادين',
          code: 'VC'),
      // Country(countryEn: 'Samoa', countryAr: 'ساموا', code: 'WS'),
      Country(countryEn: 'San Marino', countryAr: 'سان مارينو', code: 'SM'),
      // Country(
      //     countryEn: 'Sao Tome and Principe',
      //     countryAr: 'ساو تومي وبرينسيب',
      //     code: 'ST'),
      Country(countryEn: 'Senegal', countryAr: 'السنغال', code: 'SN'),
      Country(
          countryEn: 'Serbia and Montenegro', countryAr: 'صربيا', code: 'CS'),
      Country(countryEn: 'Seychelles', countryAr: 'سيشل', code: 'SC'),
      // Country(countryEn: 'Sierra Leone', countryAr: 'سيراليون', code: 'SL'),
      Country(countryEn: 'Singapore', countryAr: 'سنغافورة', code: 'SG'),
      Country(countryEn: 'Slovakia', countryAr: 'سلوفاكيا', code: 'SK'),
      Country(countryEn: 'Slovenia', countryAr: 'سلوفينيا', code: 'SI'),
      // Country(
      //     countryEn: 'Solomon Islands', countryAr: 'جزر سليمان', code: 'SB'),
      Country(countryEn: 'South Africa', countryAr: 'جنوب أفريقيا', code: 'ZA'),
      // Country(
      //     countryEn: 'South Georgia and the South Sandwich Islands',
      //     countryAr: 'جورجيا الجنوبية وجزر ساندويتش الجنوبية',
      //     code: 'GS'),
      Country(countryEn: 'Spain', countryAr: 'إسبانيا', code: 'ES'),
      Country(countryEn: 'Sri Lanka', countryAr: 'سريلانكا', code: 'LK'),

      Country(countryEn: 'Suriname', countryAr: 'سورينام', code: 'SR'),
      // Country(
      //     countryEn: 'Svalbard and Jan Mayen',
      //     countryAr: 'سفالبارد ويان ماين',
      //     code: 'SJ'),
      // Country(countryEn: 'Swaziland', countryAr: 'سوازيلاند', code: 'SZ'),
      Country(countryEn: 'Sweden', countryAr: 'السويد', code: 'SE'),
      Country(countryEn: 'Switzerland', countryAr: 'سويسرا', code: 'CH'),

      Country(
          countryEn: 'Taiwan, Province of China',
          countryAr: 'تايوان',
          code: 'TW'),
      // Country(countryEn: 'Tajikistan', countryAr: 'طاجيكستان', code: 'TJ'),
      Country(
          countryEn: 'Tanzania, United Republic of',
          countryAr: 'تنزانيا',
          code: 'TZ'),
      Country(countryEn: 'Thailand', countryAr: 'تايلاند', code: 'TH'),
      // Country(countryEn: 'Timor-Leste', countryAr: 'تيمور الشرقية', code: 'TL'),
      Country(countryEn: 'Togo', countryAr: 'توغو', code: 'TG'),
      // Country(countryEn: 'Tokelau', countryAr: 'توكيلاو', code: 'TK'),
      // Country(countryEn: 'Tonga', countryAr: 'تونغا', code: 'TO'),
      Country(
          countryEn: 'Trinidad and Tobago',
          countryAr: 'ترينيداد وتوباغو',
          code: 'TT'),

      // Country(countryEn: 'Turkmenistan', countryAr: 'تركمانستان', code: 'TM'),
      // Country(
      //     countryEn: 'Turks and Caicos Islands',
      //     countryAr: 'جزر توركس وكايكوس',
      //     code: 'TC'),
      // Country(countryEn: 'Tuvalu', countryAr: 'توفالو', code: 'TV'),
      Country(countryEn: 'Uganda', countryAr: 'أوغندا', code: 'UG'),
      Country(countryEn: 'Ukraine', countryAr: 'أوكرانيا', code: 'UA'),

      // Country(
      //     countryEn: 'United States Minor Outlying Islands',
      //     countryAr: 'جزر الولايات المتحدة الصغيرة النائية',
      //     code: 'UM'),
      Country(countryEn: 'Uruguay', countryAr: 'الأوروغواي', code: 'UY'),
      Country(countryEn: 'Uzbekistan', countryAr: 'أوزبكستان', code: 'UZ'),
      // Country(countryEn: 'Vanuatu', countryAr: 'فانواتو', code: 'VU'),
      Country(countryEn: 'Venezuela', countryAr: 'فنزويلا', code: 'VE'),
      Country(countryEn: 'Vietnam', countryAr: 'فيتنام', code: 'VN'),
      Country(
          countryEn: 'Virgin Islands',
          countryAr: 'جزر العذراء البريطانية',
          code: 'VG'),
      // Country(
      //     countryEn: 'Virgin Islands, U.S.',
      //     countryAr: 'جزر العذراء الأمريكية',
      //     code: 'VI'),
      // Country(
      //     countryEn: 'Wallis and Futuna',
      //     countryAr: 'والس وفوتونا',
      //     code: 'WF'),
      // Country(
      //     countryEn: 'Western Sahara',
      //     countryAr: 'الصحراء الغربية',
      //     code: 'EH'),
      Country(countryEn: 'Zambia', countryAr: 'زامبيا', code: 'ZM'),
      Country(countryEn: 'Zimbabwe', countryAr: 'زيمبابوي', code: 'ZW')
    ];
  }
}
