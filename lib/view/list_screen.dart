import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_codeft/view/details_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final dataProvider = FutureProvider<List<dynamic>>((ref) async {
  final response = await http.get(Uri.parse(
      'https://itunes.apple.com/search?term=jackjohnson&entity=musicVideo'));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return data['results'];
  } else {
    throw Exception('Failed to load data');
  }
});


class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataAsyncValue = ref.watch(dataProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () {
            return Navigator.pop(context);
          },
        ),
        title: const Text(
          'iTunes',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.grid_view),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {},
          ),
        ],
      ),
      body: dataAsyncValue.when(
        data: (data) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1,
            mainAxisSpacing: 99,
            crossAxisSpacing: 10,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
            final item = data[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return DetailPage(item: item);
                }));
              },
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    Image.network(
                      item['artworkUrl100'],
                      //width: 400,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                    Expanded(
                      child: Text(
                        item['artistName'],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        loading: () => Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.08,
            color: Colors.grey,
            child: const Row(
              children: [
                SizedBox(
                  width: 4,
                ),
                CircularProgressIndicator(
                  strokeWidth: 2,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Loading",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        error: (error, stack) => const Center(
          child: Text('Failed to load data'),
        ),
      ),
    );
  }
}
