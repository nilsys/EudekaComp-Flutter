import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DetailFasilitas extends StatelessWidget {
  final DocumentSnapshot document;

  DetailFasilitas(this.document);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(
            top: 20,
          ),
          child: Row(
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                margin: EdgeInsets.only(
                  left: 10,
                ),
                child: Text(
                  document.data()['judul'],
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        Container(
            margin: EdgeInsets.only(top: 5),
            color: Colors.black,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            child: Image.network(
              document.data()['gambar'],
              fit: BoxFit.fill,
            )),
        Expanded(
          child: ListView(
            children: [
              Container(
                  margin: EdgeInsets.only(right: 20, left: 20),
                  child: Text(document.data()["jenis"] ?? '',
                      style: TextStyle(
                          color: Colors.blue, fontFamily: 'Poppins'))),
              Container(
                margin: EdgeInsets.only(right: 20, left: 20),
                child: Text(document.data()["judul"] ?? '',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              Container(
                margin: EdgeInsets.only(right: 20, left: 20),
                child: Text(document.data()["tanggal"] ?? '',
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        color: Colors.grey)),
              ),
              Container(
                margin: EdgeInsets.only(right: 20, left: 20, top: 20),
                child: Text(document.data()['deskripsi-detail'] ?? '',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                    )),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
