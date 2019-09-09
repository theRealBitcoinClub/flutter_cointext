import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _kFontFam = 'MyFlutterApp';

const IconData facebook = const IconData(0xf300, fontFamily: _kFontFam);
const IconData facebook_rect = const IconData(0xf301, fontFamily: _kFontFam);
const IconData twitter = const IconData(0xf302, fontFamily: _kFontFam);
const IconData twitter_bird = const IconData(0xf303, fontFamily: _kFontFam);
const IconData instagram = const IconData(0xf31e, fontFamily: _kFontFam);
const IconData instagram_filled = const IconData(0xf31f, fontFamily: _kFontFam);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TEXT_COLOR = Colors.white;
    return MaterialApp(
      title: 'CoinText',
      theme: ThemeData(
        primarySwatch:
            Colors.green, // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Colors.lightGreen[800],
        accentColor: Colors.lightGreen[600],
        fontFamily: 'Montserrat',
        textTheme: TextTheme(
          caption: TextStyle(
              fontSize: 42.0, fontWeight: FontWeight.w400, color: TEXT_COLOR),
          headline: TextStyle(
              fontSize: 36.0, fontWeight: FontWeight.w400, color: TEXT_COLOR),
          button: TextStyle(
              fontSize: 28.0, fontWeight: FontWeight.w300, color: TEXT_COLOR),
          title: TextStyle(
              fontSize: 24.0, fontWeight: FontWeight.w500, color: TEXT_COLOR),
        ),
      ),
      home: MyHomePage(title: 'CoinText'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _homeState = "HOME";
  void _navigate(String id) {
    updateHomeState(id);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.title,
        ),
        leading: Builder(
          builder: (context) => IconButton(
            tooltip: "MENU",
            padding: EdgeInsets.all(6.0),
            alignment: Alignment.centerRight,
            icon: Image.asset("images/home.png"),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      bottomSheet: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(twitter_bird),
            title: Text('Twitter'),
          ),
          BottomNavigationBarItem(
            icon: Icon(facebook),
            title: Text('Facebook'),
          ),
          BottomNavigationBarItem(
            icon: Icon(instagram),
            title: Text('Instagram'),
          ),
        ],
        fixedColor: Colors.grey[400],
        selectedFontSize: 12.0,
        onTap: (index) {
          switch (index) {
            case 0:
              _launchURL("https://twitter.com/cointext");
              break;
            case 1:
              _launchURL("https://www.facebook.com/cointext/");
              break;
            case 2:
              _launchURL("https://www.instagram.com/cointext/");
              break;
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset("images/drawer.png"),
              decoration: BoxDecoration(color: Colors.white),
            ),
            _buildListTileMenu(context, 'Argentina', "ARS"),
            _buildListTileMenu(context, 'Australia', "AUD"),
            _buildListTileMenu(context, 'Austria', "AUT"),
            _buildListTileMenu(context, 'Bangladesh', "BDT"),
            _buildListTileMenu(context, 'Belgium', "BEL"),
            _buildListTileMenu(context, 'Brazil', "BRL"),
            _buildListTileMenu(context, 'Canada', "CAD"),
            _buildListTileMenu(context, 'Chile', "CLP"),
            _buildListTileMenu(context, 'Colombia', "COP"),
            _buildListTileMenu(context, 'Croatia', "HRK"),
            _buildListTileMenu(context, 'Czech Rep', "CZK"),
            _buildListTileMenu(context, 'Denmark', "DKK"),
            _buildListTileMenu(context, 'Dominican Republic', "DOP"),
            _buildListTileMenu(context, 'Estonia', "EST"),
            _buildListTileMenu(context, 'Finland', "FIN"),
            _buildListTileMenu(context, 'France', "FRA"),
            _buildListTileMenu(context, 'Germany', "GER"),
            _buildListTileMenu(context, 'Hong Kong', "HK"),
            _buildListTileMenu(context, 'Hungary', "HUN"),
            _buildListTileMenu(context, 'Ireland', "IRE"),
            _buildListTileMenu(context, 'Israel', "ISR"),
            _buildListTileMenu(context, 'Italy', "ITA"),
            _buildListTileMenu(context, 'Jersey', "JER"),
            _buildListTileMenu(context, 'Latvia', "LAT"),
            _buildListTileMenu(context, 'Lithuania', "LIT"),
            _buildListTileMenu(context, 'Mexico', "MEX"),
            _buildListTileMenu(context, 'Netherlands', "NLD"),
            _buildListTileMenu(context, 'Norway', "NOR"),
            _buildListTileMenu(context, 'Philippines', "PHI"),
            _buildListTileMenu(context, 'Poland', "POL"),
            _buildListTileMenu(context, 'Portugal', "POR"),
            _buildListTileMenu(context, 'Puerto Rico', "PRI"),
            _buildListTileMenu(context, 'Romania', "ROM"),
            _buildListTileMenu(context, 'Slovenia', "SLO"),
            _buildListTileMenu(context, 'South Africa', "ZAF"),
            _buildListTileMenu(context, 'Spain', "SPA"),
            _buildListTileMenu(context, 'Sweden', "SWE"),
            _buildListTileMenu(context, 'Switzerland', "CH"),
            _buildListTileMenu(context, 'Taiwan', "TAI"),
            _buildListTileMenu(context, 'Turkey', "TUR"),
            _buildListTileMenu(context, 'UK', "UK"),
            _buildListTileMenu(context, 'Ukraine', "UKR"),
            _buildListTileMenu(context, 'USA', "USA")
          ],
        ),
      ),
      body: Scrollbar(
        child: ListView(children: _buildContent()),
      ),
    );
  }

  ListTile _buildListTileHomeContent(
      BuildContext context, String text, String id, String countryCode) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(48.0, 32.0, 48.0, 32.0),
      trailing: Text(
        countryCode,
        style: Theme.of(context).textTheme.title,
      ),
      title: _buildHomeItemText(context, text),
      onTap: () {
        updateHomeState(id);
      },
    );
  }

  void updateHomeState(String id) {
    setState(() {
      _homeState = id;
    });
  }

  Image _drawImage(String img) => Image.asset("images/" + img + ".png");

  ListTile _buildListTileMenu(BuildContext context, String text, String id) {
    return ListTile(
      contentPadding: EdgeInsets.all(16.0),
      trailing: Icon(Icons.arrow_forward_ios),
      title: _buildDrawerItemText(context, text),
      onTap: () {
        _navigate(id);
      },
    );
  }

  List<Widget> _buildContent() {
    List<Widget> rtv = [];

    switch (_homeState) {
      case "HOME":
        rtv.add(Padding(padding: EdgeInsets.all(10.0)));
        rtv.add(_buildListTileHomeContent(context, 'Argentina', "ARS", "+54"));
        rtv.add(_buildListTileHomeContent(context, 'Australia', "AUD", "+61"));
        rtv.add(_buildListTileHomeContent(context, 'Austria', "AUT", "+43"));
        rtv.add(
            _buildListTileHomeContent(context, 'Bangladesh', "BDT", "+880"));
        rtv.add(_buildListTileHomeContent(context, 'Belgium', "BEL", "+32"));
        rtv.add(_buildListTileHomeContent(context, 'Brazil', "BRL", "+55"));
        rtv.add(_buildListTileHomeContent(context, 'Canada', "CAD", "+1"));
        rtv.add(_buildListTileHomeContent(context, 'Chile', "CLP", "+56"));
        rtv.add(_buildListTileHomeContent(context, 'Colombia', "COP", "+57"));
        rtv.add(_buildListTileHomeContent(context, 'Croatia', "HRK", "+385"));
        rtv.add(_buildListTileHomeContent(context, 'Czech Rep', "CZK", "+420"));
        rtv.add(_buildListTileHomeContent(context, 'Denmark', "DKK", "+45"));
        rtv.add(_buildListTileHomeContent(
            context, 'Dominican Republic', "DOP", "+1"));
        rtv.add(_buildListTileHomeContent(context, 'Estonia', "EST", "+372"));
        rtv.add(_buildListTileHomeContent(context, 'Finland', "FIN", "+358"));
        rtv.add(_buildListTileHomeContent(context, 'France', "FRA", "+33"));
        rtv.add(_buildListTileHomeContent(context, 'Germany', "GER", "+49"));
        rtv.add(_buildListTileHomeContent(context, 'Hong Kong', "HK", "+852"));
        rtv.add(_buildListTileHomeContent(context, 'Hungary', "HUN", "+36"));
        rtv.add(_buildListTileHomeContent(context, 'Ireland', "IRE", "+353"));
        rtv.add(_buildListTileHomeContent(context, 'Israel', "ISR", "+972"));
        rtv.add(_buildListTileHomeContent(context, 'Italy', "ITA", "+39"));
        rtv.add(_buildListTileHomeContent(context, 'Jersey', "JER", "+44"));
        rtv.add(_buildListTileHomeContent(context, 'Latvia', "LAT", "+371"));
        rtv.add(_buildListTileHomeContent(context, 'Lithuania', "LIT", "+370"));
        rtv.add(_buildListTileHomeContent(context, 'Mexico', "MEX", "+52"));
        rtv.add(
            _buildListTileHomeContent(context, 'Netherlands', "NLD", "+31"));
        rtv.add(_buildListTileHomeContent(context, 'Norway', "NOR", "+47"));
        rtv.add(
            _buildListTileHomeContent(context, 'Philippines', "PHI", "+63"));
        rtv.add(_buildListTileHomeContent(context, 'Poland', "POL", "+48"));
        rtv.add(_buildListTileHomeContent(context, 'Portugal', "POR", "+351"));
        rtv.add(
            _buildListTileHomeContent(context, 'Puerto Rico', "PRI", "+1787"));
        rtv.add(_buildListTileHomeContent(context, 'Romania', "ROM", "+40"));
        rtv.add(_buildListTileHomeContent(context, 'Slovenia', "SLO", "+386"));
        rtv.add(
            _buildListTileHomeContent(context, 'South Africa', "ZAF", "+27"));
        rtv.add(_buildListTileHomeContent(context, 'Spain', "SPA", "+34"));
        rtv.add(_buildListTileHomeContent(context, 'Sweden', "SWE", "+46"));
        rtv.add(_buildListTileHomeContent(context, 'Switzerland', "CH", "+41"));
        rtv.add(_buildListTileHomeContent(context, 'Taiwan', "TAI", "+886"));
        rtv.add(_buildListTileHomeContent(context, 'Turkey', "TUR", "+90"));
        rtv.add(_buildListTileHomeContent(context, 'UK', "UK", "+44"));
        rtv.add(_buildListTileHomeContent(context, 'Ukraine', "UKR", "+380"));
        rtv.add(_buildListTileHomeContent(context, 'USA', "USA", "+1"));
        break;
      case "ARS":
        rtv.add(_buildListTileHomeContent(context, 'Argentina', "HOME", "+54"));
        rtv.add(buildListTileCaption("¡Toque el número!"));
        rtv.add(_buildListTileNumber("drawer", "110-11", "+54"));
        break;
      case "AUD":
        rtv.add(_buildListTileHomeContent(context, 'Australia', "HOME", "+61"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "488811810", "+61"));
        break;
      case "AUT":
        rtv.add(_buildListTileHomeContent(context, 'Austria', "HOME", "+43"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "676800800718", "+43"));
        break;
      case "BDT":
        rtv.add(
            _buildListTileHomeContent(context, 'Bangladesh', "HOME", "+880"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "4445650050", "+880"));
        break;
      case "BEL":
        rtv.add(_buildListTileHomeContent(context, 'Belgium', "HOME", "+32"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "460225732", "+32"));
        break;
      case "BRL":
        rtv.add(_buildListTileHomeContent(context, 'Brazil', "HOME", "+55"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "29000", "+55"));
        break;
      case "CAD":
        rtv.add(_buildListTileHomeContent(context, 'Canada', "HOME", "+1"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "5067002100", "+1"));
        break;
      case "CLP":
        rtv.add(_buildListTileHomeContent(context, 'Chile', "HOME", "+56"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "945950999", "+56"));
        break;
      case "COP":
        rtv.add(_buildListTileHomeContent(context, 'Colombia', "HOME", "+57"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "85668", "+57"));
        break;
      case "HRK":
        rtv.add(_buildListTileHomeContent(context, 'Croatia', "HOME", "+385"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "951006707", "+385"));
        break;
      case "CZK":
        rtv.add(
            _buildListTileHomeContent(context, 'Czech Rep', "HOME", "+420"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "736350073", "+420"));
        break;
      case "DKK":
        rtv.add(_buildListTileHomeContent(context, 'Denmark', "HOME", "+45"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "92452565", "+45"));
        break;
      case "DOP":
        rtv.add(_buildListTileHomeContent(
            context, 'Dominican Republic', "HOME", "+1"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "7400", "+1"));
        break;
      case "EST":
        rtv.add(_buildListTileHomeContent(context, 'Estonia', "HOME", "+372"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "59120201", "+372"));
        break;
      case "FIN":
        rtv.add(_buildListTileHomeContent(context, 'Finland', "HOME", "+358"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "4573976101", "+358"));
        break;
      case "FRA":
        rtv.add(_buildListTileHomeContent(context, 'France', "HOME", "+33"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "38691", "+33"));
        break;
      case "GER":
        rtv.add(_buildListTileHomeContent(context, 'Germany', "HOME", "+49"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "15735999059", "+49"));
        break;
      case "HK":
        rtv.add(
            _buildListTileHomeContent(context, 'Hong Kong', "HOME", "+852"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "57456744", "+852"));
        break;
      case "HUN":
        rtv.add(_buildListTileHomeContent(context, 'Hungary', "HOME", "+36"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "707178409", "+36"));
        break;
      case "IRE":
        rtv.add(_buildListTileHomeContent(context, 'Ireland', "HOME", "+353"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "861803183", "+353"));
        break;
      case "ISR":
        rtv.add(_buildListTileHomeContent(context, 'Israel', "HOME", "+972"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "526230418", "+972"));
        break;
      case "ITA":
        rtv.add(_buildListTileHomeContent(context, 'Italy', "HOME", "+39"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "3202042282", "+39"));
        break;
      case "JER":
        rtv.add(_buildListTileHomeContent(context, 'Jersey', "HOME", "+44"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "7937900030", "+44"));
        break;
      case "LAT":
        rtv.add(_buildListTileHomeContent(context, 'Latvia', "HOME", "+371"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "23230313", "+371"));
        break;
      case "LIT":
        rtv.add(
            _buildListTileHomeContent(context, 'Lithuania', "HOME", "+370"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "66841321", "+370"));
        break;
      case "MEX":
        rtv.add(_buildListTileHomeContent(context, 'Mexico', "HOME", "+52"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "9993193199", "+52"));
        break;
      case "NLD":
        rtv.add(
            _buildListTileHomeContent(context, 'Netherlands', "HOME", "+31"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "97014200771", "+31"));
        break;
      case "NOR":
        rtv.add(_buildListTileHomeContent(context, 'Norway', "HOME", "+47"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "59445076", "+47"));
        break;
      case "PHI":
        rtv.add(
            _buildListTileHomeContent(context, 'Philippines', "HOME", "+63"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "9221101037", "+63"));
        break;
      case "POL":
        rtv.add(_buildListTileHomeContent(context, 'Poland', "HOME", "+48"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "539585454", "+48"));
        break;
      case "POR":
        rtv.add(_buildListTileHomeContent(context, 'Portugal', "HOME", "+351"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "927995026", "+351"));
        break;
      case "PRI":
        rtv.add(
            _buildListTileHomeContent(context, 'Puerto Rico', "HOME", "+1787"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "3011087", "+1787"));
        break;
      case "ROM":
        rtv.add(_buildListTileHomeContent(context, 'Romania', "HOME", "+40"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "371700677", "+40"));
        break;
      case "SLO":
        rtv.add(_buildListTileHomeContent(context, 'Slovenia', "HOME", "+386"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "51300586", "+386"));
        break;
      case "ZAF":
        rtv.add(
            _buildListTileHomeContent(context, 'South Africa', "HOME", "+27"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "872406777", "+27"));
        break;
      case "SPA":
        rtv.add(_buildListTileHomeContent(context, 'Spain', "HOME", "+34"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "957870414", "+34"));
        break;
      case "SWE":
        rtv.add(_buildListTileHomeContent(context, 'Sweden', "HOME", "+46"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "700861888", "+46"));
        break;
      case "CH":
        rtv.add(
            _buildListTileHomeContent(context, 'Switzerland', "HOME", "+41"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "798073741", "+41"));
        break;
      case "TAI":
        rtv.add(_buildListTileHomeContent(context, 'Taiwan', "HOME", "+886"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "931181297", "+886"));
        break;
      case "TUR":
        rtv.add(_buildListTileHomeContent(context, 'Turkey', "HOME", "+90"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "8505400651", "+90"));
        break;
      case "UK":
        rtv.add(_buildListTileHomeContent(context, 'UK', "HOME", "+44"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "7491163242", "+44"));
        break;
      case "UKR":
        rtv.add(_buildListTileHomeContent(context, 'Ukraine', "HOME", "+380"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "931770157", "+380"));
        break;
      case "USA":
        rtv.add(_buildListTileHomeContent(context, 'USA', "HOME", "+1"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "7077776185", "+1"));
        break;
    }

    rtv.add(ListTile(contentPadding: EdgeInsets.all(32.0)));
    return rtv;
  }

  ListTile buildListTileCaption(String msg) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(32.0, 0.0, 0.0, 16.0),
      title: Text(
        msg,
        style: Theme.of(context)
            .textTheme
            .caption
            .copyWith(color: Colors.yellow[700]),
      ),
    );
  }

  ListTile _buildListTileNumber(
      String img, String phoneNumber, String countryCode) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      leading: Image.asset(
        "images/" + img + ".png",
        width: 100.0,
      ),
      title: Text(
        phoneNumber,
        style: Theme.of(context).textTheme.title,
      ),
      trailing: Icon(
        Icons.sms,
        size: 36.0,
      ),
      onTap: () {
        _launchURL("sms:" + countryCode + phoneNumber);
      },
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      _showSnackBar(context, 'Could not launch $url');
      throw 'Could not launch $url';
    }
  }

  Text _buildDrawerItemText(BuildContext context, String txt) => Text(
        txt,
        style: Theme.of(context).textTheme.button,
      );

  Text _buildHomeItemText(BuildContext context, String txt) => Text(
        txt,
        style: Theme.of(context).textTheme.headline,
      );

  void _showSnackBar(ctx, String msg, {String additionalText = ""}) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      duration: Duration(milliseconds: 3000),
      content: Text(
        /*FlutterI18n.translate(ctx, msgId)*/ msg + additionalText,
        style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: Colors.grey[900]),
      ),
      backgroundColor: Colors.yellow[700],
    ));
  }
}
