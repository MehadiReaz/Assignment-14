import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xm_14/screens/result_screen.dart';
import 'package:xm_14/screens/result_screen2.dart';

// ignore: must_be_immutable
class MatchListScreen extends StatefulWidget {
  const MatchListScreen({super.key});

  @override
  State<MatchListScreen> createState() => _MatchListScreenState();
}

class _MatchListScreenState extends State<MatchListScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final CollectionReference matchScoreCollection =
      FirebaseFirestore.instance.collection('matchScore');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match List'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 80,
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const ResultScreen1())));
                  },
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Ban',
                              style: TextStyle(fontSize: 19),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text('VS'),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Pak',
                              style: TextStyle(fontSize: 19),
                            ),
                          ],
                        ),
                        Icon(Icons.arrow_forward)
                      ]),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 80,
            child: Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const ResultScreen2())));
                  },
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Ind',
                              style: TextStyle(fontSize: 19),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text('VS'),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Nepal',
                              style: TextStyle(fontSize: 19),
                            ),
                          ],
                        ),
                        Icon(Icons.arrow_forward)
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
