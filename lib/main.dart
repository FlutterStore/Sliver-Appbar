import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AppHome(),
    );
  }
}

class AppHome extends StatefulWidget {
  const AppHome({super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {

  
  @override
  Widget build(BuildContext context) {

  return Scaffold(
    drawer: const Drawer(),
    body:CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          actions: [
            Icon(Icons.notifications),
            SizedBox(width: 10,),
          ],
          automaticallyImplyLeading: true,
          centerTitle: true,
          foregroundColor: Colors.red,
          iconTheme:IconThemeData(color: Colors.white) ,
          leadingWidth: 20,
          shadowColor: Colors.green,     
          backgroundColor: Colors.green,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text('SliverAppBar',style: TextStyle(fontSize: 15),),
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            childCount: 50,
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.green[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            },
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    )
  );
  }
}