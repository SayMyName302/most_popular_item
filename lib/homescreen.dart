import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:popular/detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> _cardTitles = [];
  final List<String> _cardImages = [];
  final List<DocumentSnapshot> _cardDocs = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    final snapshot = await FirebaseFirestore.instance.collection('cards').get();
    final docs = snapshot.docs;
    for (final doc in docs) {
      final data = doc.data();
      final title = data['title'];
      final image = data['image'];
      setState(() {
        _cardTitles.add(title);
        _cardImages.add(image);
        _cardDocs.add(doc);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Albums :',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: _cardTitles.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    // Get a reference to the document
                    final docRef = FirebaseFirestore.instance
                        .collection('cards')
                        .doc(_cardDocs[index].id);

                    final docSnap = await docRef.get();
                    final data = docSnap.data();

                    if (data != null && data.containsKey('count')) {
                      final currentCount = data['count'] ?? 0;
                      await docRef.update({'count': currentCount + 1});
                    } else {
                      await docRef.set({'count': 0}, SetOptions(merge: true));
                      await docRef.update({'count': 1});
                    }

// Increment the count

                    // Navigate to the detail screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          title: _cardTitles[index],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 150,
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: CachedNetworkImageProvider(
                          _cardImages[index],
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        _cardTitles[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Popular Albums :',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('cards')
                  .orderBy('count', descending: true)
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final docs = snapshot.data!.docs;
                return ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final doc = docs[index];
                    final data = doc.data() as Map<String, dynamic>?;
                    final title = data?['title'];
                    final image = data?['image'];

                    return GestureDetector(
                      onTap: () async {
                        final docRef = FirebaseFirestore.instance
                            .collection('cards')
                            .doc(doc.id);

                        final currentCount = (await docRef.get())['count'] ?? 0;

                        await docRef.update({'count': currentCount + 1});

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              title: title,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 150,
                        margin: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: CachedNetworkImageProvider(
                              image,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
