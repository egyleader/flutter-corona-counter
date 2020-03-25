import 'package:corona/components/big_list_item.dart';
import 'package:corona/components/small_list_item.dart';
import 'package:corona/const.dart';
import 'package:corona/providers/theme_provider.dart';
import 'package:corona/themes/dark_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    var data = EasyLocalizationProvider.of(context).data;

    final width = MediaQuery.of(context).size.width - 20.0;
    final height = MediaQuery.of(context).size.height - 20.0;

    return EasyLocalizationProvider(
      data: data,
      child: SafeArea(
        child: Scaffold(
            body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    children: <Widget>[
                      Image.asset('assets/images/logo-small.png',
                          height: height * 0.05),
                      SizedBox(
                        width: width * .02,
                      ),
                      Text(
                        tr('title'),
                        style: themeProvider.isDark()
                            ? kTitleDarkStyle
                            : kTitleLightStyle,
                      ),
                    ],
                  ),
                ),
                Text(tr('trending')),

                SizedBox(
                    height: height * .3,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        BigListItem(
                          image:
                              'https://media.linkonlineworld.com/img/large/2018/11/17/2018_11_17_2_28_57_579.jpg',
                          title: tr("cardTitle"),
                          subtitle: tr("author"),
                          onpressed: () {},
                        ),
                        BigListItem(
                          image:
                              'https://media.linkonlineworld.com/img/large/2018/11/17/2018_11_17_2_28_57_579.jpg',
                          title: tr("cardTitle"),
                          subtitle: tr("author"),
                          onpressed: () {},
                        ),
                        BigListItem(
                          image:
                              'https://media.linkonlineworld.com/img/large/2018/11/17/2018_11_17_2_28_57_579.jpg',
                          title: tr("cardTitle"),
                          subtitle: tr("author"),
                          onpressed: () {},
                        ),
                      ],
                    )),
                Text(tr('selected')),

                SizedBox(
                    height: height * .3,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        BigListItem(
                          image:
                              'https://media.linkonlineworld.com/img/large/2018/11/17/2018_11_17_2_28_57_579.jpg',
                          title: tr("cardTitle"),
                          subtitle: tr("author"),
                          onpressed: () {},
                        ),
                        BigListItem(
                          image:
                              'https://media.linkonlineworld.com/img/large/2018/11/17/2018_11_17_2_28_57_579.jpg',
                          title: tr("cardTitle"),
                          subtitle: tr("author"),
                          onpressed: () {},
                        ),
                        BigListItem(
                          image:
                              'https://media.linkonlineworld.com/img/large/2018/11/17/2018_11_17_2_28_57_579.jpg',
                          title: tr("cardTitle"),
                          subtitle: tr("author"),
                          onpressed: () {},
                        ),
                      ],
                    )),
                     Text(tr('selected')),

                SizedBox(
                    height: height * .20,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        SmallListItem(
                          image:
                              'https://media.linkonlineworld.com/img/large/2018/11/17/2018_11_17_2_28_57_579.jpg',
                          title: tr("cardTitle"),
                          onpressed: () {},
                        ),
                        SmallListItem(
                          image:
                              'https://media.linkonlineworld.com/img/large/2018/11/17/2018_11_17_2_28_57_579.jpg',
                          title: tr("cardTitle"),
                          onpressed: () {},
                        ),
                        SmallListItem(
                          image:
                              'https://media.linkonlineworld.com/img/large/2018/11/17/2018_11_17_2_28_57_579.jpg',
                          title: tr("cardTitle"),
                          onpressed: () {},
                        ),
                      ],
                    )),
                // // switch for the dark theme with themeProvider
                // Switch(
                //     value: themeProvider.getTheme() == darkTheme ? false : true,
                //     onChanged: (value) {
                //       themeProvider.switchTheme();
                //     }),
                // // switch to change language with Easy Localization
                // Switch(
                //     value: false,
                //     onChanged: (value) {
                //       if (Localizations.localeOf(context).languageCode ==
                //           "ar") {
                //         print(true);
                //         data.changeLocale(
                //             locale: Locale.fromSubtags(languageCode: "en"));
                //       } else {
                //         print(false);
                //         data.changeLocale(
                //             locale: Locale.fromSubtags(languageCode: "ar"));
                //       }
                //     }),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
