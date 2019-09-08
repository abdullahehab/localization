import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';

class Log extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
      data: data,
      child: MaterialApp(
        title: 'Flutter Demo',
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          //app-specific localization
          EasylocaLizationDelegate(
            locale: data.locale,
            path: 'resources/langs',
            //useOnlyLangCode: true,
            // loadPath: 'https://raw.githubusercontent.com/aissat/easy_localization/master/example/resources/langs'
          ),
        ],
        supportedLocales: [Locale('en', 'US'), Locale('ar', 'DZ')],
        locale: data.savedLocale,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Reset(),
      ),
    );
  }
}

class Reset extends StatefulWidget {
  @override
  _ResetState createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  @override
  Widget build(BuildContext context) {
    var data = EasyLocalizationProvider.of(context).data;
    return EasyLocalizationProvider(
        data: data,
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).tr('title')),
            actions: <Widget>[
              FlatButton(
                child: Text("English"),
                color: Localizations.localeOf(context).languageCode == "en"
                    ? Colors.lightBlueAccent
                    : Colors.blue,
                onPressed: () {
                  this.setState(() {
                    data.changeLocale(Locale("en", "US"));
                    print(Localizations.localeOf(context).languageCode);
                  });
                },
              ),
              FlatButton(
                child: Text("عربي"),
                color: Localizations.localeOf(context).languageCode == "ar"
                    ? Colors.red
                    : Colors.blue,
                onPressed: () {
                  this.setState(() {
                    data.changeLocale(Locale("ar", "DZ"));
                    print(Localizations.localeOf(context).languageCode);
                  });
                },
              )
            ],
          ),
          body: Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      hintText:
                          Localizations.localeOf(context).languageCode == "en"
                              ? AppLocalizations.of(context).tr('username')
                              : AppLocalizations.of(context).tr('username')),
                ),
                TextFormField(
                  decoration: InputDecoration(
                      hintText:
                          Localizations.localeOf(context).languageCode == "en"
                              ? AppLocalizations.of(context)
                                  .tr('profile.reset_password.password')
                              : AppLocalizations.of(context)
                                  .tr('profile.reset_password.password')),
                ),
              ],
            ),
          )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              this.setState(() {
                data.changeLocale(Locale("ar", "DZ"));
                print(Localizations.localeOf(context).languageCode);
              });
            },
            child: Text('+1'),
          ),
        ));
  }
}
