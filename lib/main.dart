import 'package:flutter/material.dart';
import 'package:htttp/model.dart';
import 'package:htttp/network.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

   late Future<Model> fetchingData;
   @override
  void initState() {

    super.initState();
    fetchingData = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hello News"),),
      body: FutureBuilder<Model>(
        future: fetchingData,
        builder: (context,snapshot){
         if(snapshot.hasData){
           return ListView.builder(
               itemCount: snapshot.data!.articles.length,
               itemBuilder: (context,index) {
                 final art = snapshot.data!.articles[index];
                return  Card(

                  child: ListTile(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                    subtitle: Text(art.content),

                    dense: true,
                    tileColor: Colors.blueGrey,
                    leading: SizedBox(
                      height: 50, width: 50,
                        child: Image.network(art.urlToImage,fit: BoxFit.fitWidth,)),
                    title: Text(art.title),
                  ),
                );
               }
           );
         }
        return Center(child: CircularProgressIndicator());
        }
      ),
    );
  }
}

