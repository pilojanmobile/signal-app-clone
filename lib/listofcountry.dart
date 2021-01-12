import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signalappclone/controller/controller.dart';
import 'package:signalappclone/register.dart';

import 'jsons/country.dart';

class Listofcountry extends StatefulWidget {
  Listofcountry({Key key}) : super(key: key);

  @override
  _ListofcountryState createState() => _ListofcountryState();
}

class _ListofcountryState extends State<Listofcountry> {
  List results = [];
  Country country = Country();
  var rows = [];
  var rowsdialogcode = [];
  String query = '';
  TextEditingController tc;
  var controller = Get.put(AppController());

  @override
  void initState() {
    super.initState();
    tc = TextEditingController();
    rows = country.countrylist;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Country List",
          style: new TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: tc,
                    decoration: InputDecoration(
                        hintText: 'Search Country',
                        prefixIcon: Icon(Icons.search)),
                    onChanged: (v) {
                      setState(() {
                        query = v;
                        setResults(query);
                      });
                    },
                  ),
                ),
                Expanded(
                  child: query.isEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: rows.length,
                          itemBuilder: (con, ind) {
                            return ListTile(
                              title: Text(rows[ind]['name']),
                              onTap: () {
                                setState(() {
                                  tc.text = rows[ind]['name'];
                                  query = rows[ind]['name'];
                                  controller.choosevalue(
                                      tc.text, rows[ind]['dial_code']);

                                  setResults(query);
                                  Get.off(Register());
                                });
                              },
                            );
                          },
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: results.length,
                          itemBuilder: (con, ind) {
                            return ListTile(
                              title: Text(results[ind]['name']),
                              onTap: () {
                                setState(() {
                                  tc.text = results[ind]['name'];
                                  query = results[ind]['name'];
                                  controller.choosevalue(
                                      tc.text, results[ind]['dial_code']);

                                  setResults(query);
                                  Get.off(Register());
                                });
                              },
                            );
                          },
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void setResults(String query) {
    results = rows
        .where((elem) =>
            elem['name'].toString().toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
