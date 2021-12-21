import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zomato_clone/Models/shopinfo.dart';
import 'package:http/http.dart' as http;
import 'package:zomato_clone/Views/Details_Page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  late Future<List<Info?>> veri;
  String url =
      "https://raw.githubusercontent.com/Grkmzdmr/json_map/master/lib/assets/data/zomato.json";
  Future<List<Info>> getInfo() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => Info.fromJson(e))
          .toList();
    } else {
      throw Exception("Bağlantı Hatası");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    veri = getInfo();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0), // here the desired height
          child: AppBar(
            
            backgroundColor: Colors.white,
            centerTitle: false,
            title: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text(
                "Tıkla Keşfet",
                style: TextStyle(fontSize: 24, color: Colors.red.shade700),
              ),
            ),
          ),
        ),
        body: BodyList());
  }

  BodyList() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      child: FutureBuilder(
        builder: (context, AsyncSnapshot<List<Info?>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPage(snapshot.data![index]!.name,snapshot.data![index]!.phone,snapshot.data![index]!.weekdays,snapshot.data![index]!.weekends,snapshot.data![index]!.adress,snapshot.data![index]!.photos)));
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 2 + 90,
                            width: MediaQuery.of(context).size.width - 20,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 0, top: 150),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 0, left: 20),
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 130,left: 02),
                                  child: Column(
                                    children: [
                                      SizedBox(height: 160,),
                                      Container(
                                        width: 200,
                                        child: Text(
                                          snapshot.data![index]!.name
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 20, fontFamily: "Noto"),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 30),
                                        child: Container(
                                            width: 180,
                                            child: Text("Edirne,Keşan")),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 2 - 50,
                            width: MediaQuery.of(context).size.width - 20,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0)),
                              color: Colors.grey.shade800,
                              image: DecorationImage(
                                  image: new AssetImage(
                                      "assets/images/${snapshot.data![index]!.photo}"),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
        future: veri,
      ),
    );
  }
}
