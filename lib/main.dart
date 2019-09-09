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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: _buildContent(),
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
        rtv.add(Padding(padding: EdgeInsets.all(30.0)));
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
            context, 'Dominican Republic', "DOP", "+1809"));
        rtv.add(_buildListTileHomeContent(context, 'Estonia', "EST", "+372"));
        rtv.add(_buildListTileHomeContent(context, 'Finland', "FIN", "+358"));
        rtv.add(_buildListTileHomeContent(context, 'France', "FRA", "+33"));
        rtv.add(_buildListTileHomeContent(context, 'Germany', "GER", "+49"));
        rtv.add(_buildListTileHomeContent(context, 'Hong Kong', "HK", "+852"));
        rtv.add(_buildListTileHomeContent(context, 'Hungary', "HUN", "+36"));
        rtv.add(_buildListTileHomeContent(context, 'Ireland', "IRE", "+353"));
        rtv.add(_buildListTileHomeContent(context, 'Israel', "ISR", "+972"));
        rtv.add(_buildListTileHomeContent(context, 'Italy', "ITA", "+39"));
        rtv.add(
            _buildListTileHomeContent(context, 'Jersey', "JER", "+44 1534"));
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
        rtv.add(_buildListTileNumber("drawer", "+54-110-11", ""));
        break;
      case "AUD":
        rtv.add(_buildListTileHomeContent(context, 'Australia', "AUD", "+61"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+61488811810", ""));
        break;
      case "AUT":
        rtv.add(_buildListTileHomeContent(context, 'Austria', "AUT", "+43"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+43676800800718", ""));
        break;
      case "BDT":
        rtv.add(
            _buildListTileHomeContent(context, 'Bangladesh', "BDT", "+880"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+8804445650050", ""));
        break;
      case "BEL":
        rtv.add(_buildListTileHomeContent(context, 'Belgium', "BEL", "+32"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+32460225732", ""));
        break;
      case "BRL":
        rtv.add(_buildListTileHomeContent(context, 'Brazil', "BRL", "+55"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+29000", ""));
        break;
      case "CAD":
        rtv.add(_buildListTileHomeContent(context, 'Canada', "CAD", "+1"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+15067002100", ""));
        break;
      case "CLP":
        rtv.add(_buildListTileHomeContent(context, 'Chile', "CLP", "+56"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+56945950999", ""));
        break;
      case "COP":
        rtv.add(_buildListTileHomeContent(context, 'Colombia', "COP", "+57"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+85668", ""));
        break;
      case "HRK":
        rtv.add(_buildListTileHomeContent(context, 'Croatia', "HRK", "+385"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+385951006707", ""));
        break;
      case "CZK":
        rtv.add(_buildListTileHomeContent(context, 'Czech Rep', "CZK", "+420"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+420736350073", ""));
        break;
      case "DKK":
        rtv.add(_buildListTileHomeContent(context, 'Denmark', "DKK", "+45"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+4592452565", ""));
        break;
      case "DOP":
        rtv.add(_buildListTileHomeContent(
            context, 'Dominican Republic', "DOP", "+1809"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+7400", ""));
        break;
      case "EST":
        rtv.add(_buildListTileHomeContent(context, 'Estonia', "EST", "+372"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+37259120201", ""));
        break;
      case "FIN":
        rtv.add(_buildListTileHomeContent(context, 'Finland', "FIN", "+358"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+3584573976101", ""));
        break;
      case "FRA":
        rtv.add(_buildListTileHomeContent(context, 'France', "FRA", "+33"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+38691", ""));
        break;
      case "GER":
        rtv.add(_buildListTileHomeContent(context, 'Germany', "GER", "+49"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+4915735999059", ""));
        break;
      case "HK":
        rtv.add(_buildListTileHomeContent(context, 'Hong Kong', "HK", "+852"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+85257456744", ""));
        break;
      case "HUN":
        rtv.add(_buildListTileHomeContent(context, 'Hungary', "HUN", "+36"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+36707178409", ""));
        break;
      case "IRE":
        rtv.add(_buildListTileHomeContent(context, 'Ireland', "IRE", "+353"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+353861803183", ""));
        break;
      case "ISR":
        rtv.add(_buildListTileHomeContent(context, 'Israel', "ISR", "+972"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+972526230418", ""));
        break;
      case "ITA":
        rtv.add(_buildListTileHomeContent(context, 'Italy', "ITA", "+39"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+393202042282", ""));
        break;
      case "JER":
        rtv.add(
            _buildListTileHomeContent(context, 'Jersey', "JER", "+44 1534"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+447937900030", ""));
        break;
      case "LAT":
        rtv.add(_buildListTileHomeContent(context, 'Latvia', "LAT", "+371"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+37123230313", ""));
        break;
      case "LIT":
        rtv.add(_buildListTileHomeContent(context, 'Lithuania', "LIT", "+370"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+37066841321", ""));
        break;
      case "MEX":
        rtv.add(_buildListTileHomeContent(context, 'Mexico', "MEX", "+52"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+529993193199", ""));
        break;
      case "NLD":
        rtv.add(
            _buildListTileHomeContent(context, 'Netherlands', "NLD", "+31"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+3197014200771", ""));
        break;
      case "NOR":
        rtv.add(_buildListTileHomeContent(context, 'Norway', "NOR", "+47"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+4759445076", ""));
        break;
      case "PHI":
        rtv.add(
            _buildListTileHomeContent(context, 'Philippines', "PHI", "+63"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+639221101037", ""));
        break;
      case "POL":
        rtv.add(_buildListTileHomeContent(context, 'Poland', "POL", "+48"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+48539585454", ""));
        break;
      case "POR":
        rtv.add(_buildListTileHomeContent(context, 'Portugal', "POR", "+351"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+351927995026", ""));
        break;
      case "PRI":
        rtv.add(
            _buildListTileHomeContent(context, 'Puerto Rico', "PRI", "+1787"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+17873011087", ""));
        break;
      case "ROM":
        rtv.add(_buildListTileHomeContent(context, 'Romania', "ROM", "+40"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+40371700677", ""));
        break;
      case "SLO":
        rtv.add(_buildListTileHomeContent(context, 'Slovenia', "SLO", "+386"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+38651300586", ""));
        break;
      case "ZAF":
        rtv.add(
            _buildListTileHomeContent(context, 'South Africa', "ZAF", "+27"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+27872406777", ""));
        break;
      case "SPA":
        rtv.add(_buildListTileHomeContent(context, 'Spain', "SPA", "+34"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+34957870414", ""));
        break;
      case "SWE":
        rtv.add(_buildListTileHomeContent(context, 'Sweden', "SWE", "+46"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+46700861888", ""));
        break;
      case "CH":
        rtv.add(_buildListTileHomeContent(context, 'Switzerland', "CH", "+41"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+41798073741", ""));
        break;
      case "TAI":
        rtv.add(_buildListTileHomeContent(context, 'Taiwan', "TAI", "+886"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+886931181297", ""));
        break;
      case "TUR":
        rtv.add(_buildListTileHomeContent(context, 'Turkey', "TUR", "+90"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+908505400651", ""));
        break;
      case "UK":
        rtv.add(_buildListTileHomeContent(context, 'UK', "UK", "+44"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+447491163242", ""));
        break;
      case "UKR":
        rtv.add(_buildListTileHomeContent(context, 'Ukraine', "UKR", "+380"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+380931770157", ""));
        break;
      case "USA":
        rtv.add(_buildListTileHomeContent(context, 'USA', "USA", "+1"));
        rtv.add(buildListTileCaption("Touch the number!"));
        rtv.add(_buildListTileNumber("drawer", "+17077776185", ""));
        break;
    }

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
