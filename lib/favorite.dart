import 'package:flutter/material.dart';
import 'recommendation.dart';
import 'package:url_launcher/url_launcher.dart';

class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Favorite'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: (Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: listFavorites.length,
                itemBuilder: (context, index) {
                  final Recommendation item = listFavorites[index];
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Text(item.linkUri,
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold)),
                            ]))),
                  );
                }),
          )
        ],
      )),
    ));
  }
}
