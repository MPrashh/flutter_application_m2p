import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_codeft/view/list_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class MySearchApp extends StatelessWidget {
//   const MySearchApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       color: Colors.black,
//       home: SearchPage(),
//     );
//   }
// }

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   title: const Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Icon(Icons.apple),
      //       Text('iTunes'),
      //     ],
      //   ),
      //   centerTitle: true,
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 200,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.apple,
                  color: Colors.white,
                  size: 32,
                ),
                Text(
                  'iTunes',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Search for a variety of content from the iTunes store including iBooks, movies, podcasts, music, music videos, and audiobooks.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Specify the parameter for the content to be searched',
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 6,
              child: Container(
                color: Colors.grey.shade900,
                padding: const EdgeInsets.all(8),
                child: Wrap(
                  spacing: 18.0,
                  runSpacing: 2.0,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'album',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'movie',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'musicvideo',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.grey,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'song',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const MyHomePage();
                }));
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                width: MediaQuery.of(context).size.width * 0.9,
                color: Colors.grey.shade700,
                child: const Center(
                    child: Text(
                  "Submit",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

 