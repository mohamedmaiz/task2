import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final items = [];
  final GlobalKey<AnimatedListState> key = GlobalKey<AnimatedListState>();

  void _addItemCount() {
    items.insert(0, "item ${items.length + 1}");
    key.currentState!
        .insertItem(0, duration: const Duration(milliseconds: 800));
  }

  void removeItem(int index) {
    key.currentState!.removeItem(
        index,
        (_, animation) => SizeTransition(
              sizeFactor: animation,
              child: const Card(
                margin: EdgeInsets.all(8),
                color: Colors.red,
                child: ListTile(
                  title: Text("deleted",
                      style: TextStyle(color: Colors.white, fontSize: 22)),
                ),
              ),
            ),
        duration: const Duration(milliseconds: 250));
    items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 23, 30, 73),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.white, width: 1)),
              child: IconButton(
                  onPressed: () {
                    _addItemCount();
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 22,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: AnimatedList(
              key: key,
              initialItemCount: 0,
              itemBuilder: (context, index, animation) => SizeTransition(
                key: UniqueKey(),
                sizeFactor: animation,
                child: Card(
                  margin: const EdgeInsets.all(8),
                  color: const Color.fromARGB(255, 228, 195, 51),
                  child: ListTile(
                    title: Text(items[index],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22)),
                    trailing: IconButton(
                        onPressed: () {
                          removeItem(index);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 22,
                        )),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
