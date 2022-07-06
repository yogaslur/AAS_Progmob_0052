import 'package:aas_progmob/bottom_navbar.dart';
import 'package:aas_progmob/category.dart';
import 'package:aas_progmob/detail.dart';
import 'package:aas_progmob/style.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _value = 0;

  List<String> Categorietitle = [
    "All",
    "HP",
    "Laptop",
  ];

  Future<List<dynamic>> _fecthDataUsers() async {
    var result = await http.get(Uri.parse('https://dummyjson.com/products'));
    return json.decode(result.body)['products'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: ListView(children: <Widget>[
          const SizedBox(
            height: edge,
          ),
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Beli Sekarang!',
              style: blackTextStyle.copyWith(
                fontSize: 24,
              ),
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Selalu Ada, Selalu Bisa',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(left: 15),
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(Categorietitle.length, (index) {
                  return MyRadioListTile<int>(
                    value: index,
                    groupValue: _value,
                    leading: Categorietitle[index],
                    onChanged: (value) {
                      setState(() {
                        _value = value!;
                      });
                    },
                  );
                }),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<List<dynamic>>(
              future: _fecthDataUsers(),
              builder: (context, AsyncSnapshot snapshot) {
                return snapshot.hasData
                    ? Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: GridView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisSpacing: 20,
                                      mainAxisSpacing: 20,
                                      crossAxisCount: 2),
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                  onTap: (() {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (context) => ArticlScreen(
                                                  articalID: snapshot
                                                          .data[index]['id'] -
                                                      1,
                                                )));
                                  }),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      snapshot.data[index]
                                                          ['thumbnail']),
                                                  fit: BoxFit.contain)),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        snapshot.data[index]['title'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 90, 87, 87),
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '\$' +
                                            snapshot.data[index]['price']
                                                .toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 15, 15, 14),
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      )
                    : const Expanded(
                        child: Center(
                        child: CircularProgressIndicator(),
                      ));
              })
        ]),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * edge),
        margin: EdgeInsets.symmetric(
          horizontal: edge,
        ),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.circular(23),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_email.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
