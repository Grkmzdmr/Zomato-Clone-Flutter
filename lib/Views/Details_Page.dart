import 'package:flutter/material.dart';
import 'package:zomato_clone/Views/Photo_Page.dart';

class DetailsPage extends StatefulWidget {
  String? name;
  String? number;
  String? weekdays;
  String? weekends;
  String? adress;
  List<String>? photos;

  DetailsPage(this.name, this.number, this.weekdays, this.weekends, this.adress,
      this.photos);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 200),
              child: Container(
                  width: 300,
                  child: Text(
                    "${widget.name}",
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        color: Colors.red.shade700),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 260),
              child: Container(width: 100, child: Text("Keşan,Edirne")),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: InkWell(
                onTap: () {
                  showAlertDialogHours(context);
                },
                child: Container(
                  child: Row(children: [
                    Icon(Icons.access_time_filled),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Çalışma Saatlerini Gör"),
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: InkWell(
                onTap: () {
                  showAlertDialog(context);
                },
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.phone_outlined),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Telefon Numarasını Gör"),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: InkWell(
                onTap: () {
                  showAlertDialogAdress(context);
                },
                child: Container(
                  child: Row(
                    children: [
                      Icon(Icons.article_rounded),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Adresi Gör"),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Divider(
              height: 20,
              thickness: 0.5,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 280, top: 10),
              child: Text("Fotoğraflar"),
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: widget.photos != null
                      ? widget.photos!
                          .map((photos) => Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                PhotoPage(photos)));
                                  },
                                  child: Container(
                                      height: 150,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          image: DecorationImage(
                                              image: new AssetImage(
                                                  "assets/images/$photos"),
                                              fit: BoxFit.fill))),
                                ),
                              ))
                          .toList()
                      : [Text("fotoğraf yok")]),
            ),
            SizedBox(height: 40),
            Divider(
              height: 20,
              thickness: 0.5,
              color: Colors.black,
            ),
            Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/gmp.png")))),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                "Tıkla Keşfet",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24.0))),
      title: Text(
        "Telefon Numarası",
        style: TextStyle(fontSize: 14),
      ),
      content: Text(widget.number.toString(), style: TextStyle(fontSize: 16)),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  showAlertDialogHours(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24.0))),
      title: Text(
        "Çalışma Saatleri",
        style: TextStyle(fontSize: 14),
      ),
      content: Container(
        height: 100,
        child: Column(
          children: [
            Text(widget.weekdays.toString(), style: TextStyle(fontSize: 16)),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.weekends.toString(),
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void showAlertDialogAdress(BuildContext context) {
    AlertDialog alertDialog = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24.0))),
      title: Text(
        "Adres",
        style: TextStyle(fontSize: 14),
      ),
      content: Container(
        height: 100,
        child: Column(
          children: [
            Text(
              widget.adress.toString(),
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }
}
