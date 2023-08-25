import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class MatchListScreen extends StatefulWidget {
  MatchListScreen({super.key});

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
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Match List'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('matchScore')
              .doc('match1')
              .snapshots(),
          builder:
              (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
            print(snapshot.data?.data());
            if (snapshot.hasData) {
              final score = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Card(
                  elevation: 5,
                  child: Container(
                    height: 300,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 48,
                        ),
                        Text(
                          score.get('match_name'),
                          style: Theme.of(context).textTheme.headline4,
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text(
                                  score.get('teamAScore').toString(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  score.get('teamA'),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                            const Text('vs'),
                            Column(
                              children: [
                                Text(
                                  score.get('teamBScore').toString(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                Text(
                                  score.get('teamB'),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
