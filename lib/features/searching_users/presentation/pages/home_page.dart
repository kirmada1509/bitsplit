import 'package:bitsplit/features/searching_users/presentation/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String query = ref.watch(queryProvider);
    final items_ = ref.watch(itemsProvider(query));
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) {
                ref.read(queryProvider.notifier).state = value;
              },
            ),
            Consumer(
              builder: (context, ref, child) {
                return items_.when(
                  data: (data) {
                    if (data == null) {
                      return Text("No Matches");
                    }
                    return SizedBox(
                      height: 300,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          return ListTile(
                            title: Text(data[i].title),
                          );
                        },
                        itemCount: data.length,
                      ),
                    );
                  },
                  error: (error, st) {
                    return Text("Error");
                  },
                  loading: () {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              },
            ),
          ],
        ));
  }
}
