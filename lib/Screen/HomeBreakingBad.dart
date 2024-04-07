import 'package:flutter/material.dart';
import 'package:flutter_api_breaking_bad/Api/model/PersonModel.dart';
import 'package:flutter_api_breaking_bad/Api/service/person.dart';

class BreakingBadHome extends StatefulWidget {
  const BreakingBadHome({super.key});

  @override
  State<BreakingBadHome> createState() => _BreakingBadHomeState();
}

class _BreakingBadHomeState extends State<BreakingBadHome> {
  late Future<List<Person>> PresonList;

  @override
  void initState() {
    super.initState();
    PresonList = PersonApi().getPerson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 8,
          backgroundColor: Colors.blue,
          title: const Text(
            'Breaking Bad',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          centerTitle: true,
        ),
        //floatingActionButton: FloatingActionButton(onPressed: (){getPersonFromApi}),
        body: FutureBuilder<List<Person>>(
            future: PresonList,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, i) {
                      return ListTile(
                        title: Text(snapshot.data![i].quote),
                        subtitle: Text(snapshot.data![i].author),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return CircularProgressIndicator();
            }));
  }
}
