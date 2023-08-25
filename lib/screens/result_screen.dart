import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ResultScreen1 extends StatelessWidget {
  const ResultScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bag VS Pak'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('matchScore')
              .doc('match1')
              .snapshots(),
          builder:
              (context, AsyncSnapshot<DocumentSnapshot<Object?>> snapshot) {
            if (snapshot.hasData) {
              final score = snapshot.data!;
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Card(
                  elevation: 5,
                  child: SizedBox(
                    height: 200,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          score.get('match_name'),
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 35,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text(score.get('teamAScore').toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25)),
                              ],
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            const Text(':',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19)),
                            const SizedBox(
                              width: 12,
                            ),
                            Column(
                              children: [
                                Text(score.get('teamBScore').toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25)),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Text(
                          'Time: ${score.get('timeLeft')}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Text(
                          'Total Time: ${score.get('totalTime')}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
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
