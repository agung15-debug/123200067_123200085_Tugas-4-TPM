import 'package:flutter/material.dart';
import 'recommendation.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class LinkRecommendation extends StatefulWidget {
  const LinkRecommendation({Key? key}) : super(key: key);

  @override
  State<LinkRecommendation> createState() => _LinkRecommendationState();
}

class _LinkRecommendationState extends State<LinkRecommendation> {
  void _toggleFavorites(Recommendation recommendation) {
    setState(() {
      if (listFavorites.contains(recommendation)) {
        listFavorites.remove(recommendation);
      } else {
        listFavorites.add(recommendation);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Rekomendasi Link'),
              centerTitle: true,
              backgroundColor: Colors.green,
            ),
            body: Container(
                child: Column(
              children: [
                SizedBox(height: 10),
                Expanded(
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
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      height: 100,
                                      child: Image.network(item.imgUrl),
                                    ),
                                    Text(item.name,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10),
                                    Text(item.linkUri,
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10),
                                    IconButton(
                                        onPressed: () {
                                          _toggleFavorites(item);
                                        },
                                        icon: Icon(listFavorites.contains(item)
                                            ? Icons.favorite
                                            : Icons.favorite_border))
                                  ]))),
                        );
                      }),
                ),
              ],
            ))));
  }
}
