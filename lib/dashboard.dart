import 'dart:html';
import 'package:flutter/material.dart';
import 'package:tugas4_tpm/Recommendation.dart';
import 'package:tugas4_tpm/login_page.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'help.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _millisecondsElapsed = 0;
  bool _isRunning = false;
  Timer? _timer;
  List<String> _flags = [];

  void _toggleTimer() {
    setState(() {
      _isRunning = !_isRunning;
    });
    if (_isRunning) {
      _timer = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        setState(() {
          _millisecondsElapsed += 10;
        });
      });
    } else {
      _timer?.cancel();
    }
  }

  void _resetTimer() {
    setState(() {
      _millisecondsElapsed = 0;
      _isRunning = false;
    });
    _timer?.cancel();
  }

  String _formatMilliseconds(int milliseconds) {
    final seconds = (milliseconds / 1000).truncate();
    final minutes = (seconds / 60).truncate();
    final hours = (minutes / 60).truncate();
    return '${hours.toString().padLeft(2, '0')}:${(minutes % 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}.${(milliseconds % 1000).toString().padLeft(3, '0')}';
  }

  void _addFlag() {
    String time = _formatMilliseconds(_millisecondsElapsed);
    setState(() {
      if (_flags.length < 5) {
        _flags.add(time);
      } else {
        _flags.removeAt(0);
        _flags.add(time);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('Dashboard'),
            centerTitle: true,
          ),
          drawer: NavigationDrawer(),
          body: SingleChildScrollView(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                children: <Widget>[
                  daftarAnggota(context),
                  stopwatch(
                      context,
                      _millisecondsElapsed,
                      _isRunning,
                      _toggleTimer,
                      _resetTimer,
                      _formatMilliseconds,
                      _addFlag,
                      _flags),
                  linkReccomendation(context),
                  favorite(context)
                ],
              ),
            ),
          ))),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[buildHeader(context), buildMenuItems(context)],
      ),
    );
  }
}

Widget buildHeader(BuildContext context) {
  return Container(
    color: Colors.green,
    padding: EdgeInsets.only(
      top: 20,
      bottom: 20,
    ),
    child: Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('images/profile.png'),
                fit: BoxFit.fill,
              ),
              color: Colors.white),
        ),
        SizedBox(height: 10),
        Text(
          'Kelompok 8',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}

Widget buildMenuItems(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
    child: Column(
      children: [
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Dashboard'),
          onTap: () {
            //close drawer
            Navigator.pop(context);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.live_help_outlined),
          title: Text('Panduan Penggunaan'),
          onTap: () {
            //close drawer
            Navigator.pop(context);

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Panduan()),
            );
          },
        ),
        Divider(color: Colors.black),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text('Logout'),
          onTap: () {
            //close drawer
            Navigator.pop(context);

            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
          },
        ),
      ],
    ),
  );
}

Widget daftarAnggota(BuildContext context) {
  return (Center(
      child: Column(children: [
    Text('Daftar Anggota',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
    SizedBox(height: 10),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('images/agung.jpg'),
                    fit: BoxFit.cover,
                  ),
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Agung Prayogi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              '123200085',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('images/ilham.jpg'),
                    fit: BoxFit.fill,
                  ),
                  color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              'Ilham Kurniawan Adi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              '123200067',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    ),
    Divider(color: Colors.black),
  ])));
}

Widget stopwatch(
    BuildContext context,
    int _millisecondElapsed,
    bool _isRunning,
    Function _toggleTimer,
    Function _resetTimer,
    Function _formatMilliseconds,
    Function _addFlag,
    List _flags) {
  return (Center(
    child: Column(
      children: [
        Text('Stopwatch',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Text(
          _formatMilliseconds(_millisecondElapsed),
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                _toggleTimer();
              },
              child: Icon(_isRunning ? Icons.pause : Icons.play_arrow),
            ),
            ElevatedButton(
              onPressed: () {
                _resetTimer();
              },
              child: Icon(Icons.stop),
            ),
            ElevatedButton(
              onPressed: () {
                _addFlag();
              },
              child: Icon(Icons.flag),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          height: 300,
          child: ListView.builder(
            itemCount: _flags.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Text('${index + 1}'),
                title: Text(_flags[index]),
              );
            },
          ),
        ),
        Divider(color: Colors.black),
      ],
    ),
  ));
}

Widget linkReccomendation(BuildContext context) {
  return (Column(
    children: [
      Text('Link Reccomendation',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      SizedBox(height: 10),
      Container(
        height: 1880,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: recommendationsList.length,
            itemBuilder: (context, index) {
              final Recommendation item = recommendationsList[index];
              return InkWell(
                onTap: () async {
                  final url = item.linkUri;
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Card(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 100,
                            child: Image.network(item.imgUrl),
                          ),
                          SizedBox(height: 10),
                          Text(item.name,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text(item.linkUri,
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold)),
                        ]))),
              );
            }),
      ),
      SizedBox(height: 10),
      Divider(color: Colors.black),
    ],
  ));
}

Widget favorite(BuildContext context) {
  final List<Recommendation> listFavorite = [];
  for (int i = 0; i < recommendationsList.length; i++) {
    if (recommendationsList[i].isFavorite == true) {
      listFavorite.add(recommendationsList[i]);
    }
  }
  return (Column(
    children: [
      Text('Favorite',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      SizedBox(height: 10),
      Container(
        height: 1180,
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: listFavorite.length,
            itemBuilder: (context, index) {
              final Recommendation item = listFavorite[index];
              return InkWell(
                onTap: () async {
                  final url = item.linkUri;
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Card(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            height: 100,
                            child: Image.network(item.imgUrl),
                          ),
                          SizedBox(height: 10),
                          Text(item.name,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text(item.linkUri,
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold)),
                        ]))),
              );
            }),
      )
    ],
  ));
}
