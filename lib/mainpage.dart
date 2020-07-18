import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Future _data;

  getData() async{
    var url = "https://breakingbadapi.com/api/characters";
    var res = await  http.get(url);
    List<dynamic> dataList= jsonDecode(res.body);
    print(dataList);
    return dataList;
  }

  @override
  void initState() {
    // TODO: implement initState
    _data= getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: FutureBuilder(
        future: _data,
        builder: (_ ,snapshot){
          if(snapshot.data ==null){
            return Center(child: CircularProgressIndicator());
          }
          return OrientationBuilder(
            builder: (_,orientation){
            return GridView.builder(
                itemCount: snapshot.data.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
                itemBuilder: (_,index){
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(snapshot.data[index]['img'] ,fit: BoxFit.contain,),
                        Text(snapshot.data[index]['name']),
                      ],
                    ),
                  );
                }
            );
            },
          );
        },
      )
    );
  }
}
