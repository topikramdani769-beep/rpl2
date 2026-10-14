import 'package:flutter/material.dart';

class LatihanFeed extends StatelessWidget {
  const LatihanFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const FeedScreen(),
    );
  }
}
class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> stories = [
      {'name': 'Cerita Anda', 'type': 'add'},
      {'name': 'faisal_rd', 'image': ''},
      {'name': 'aden.geng', 'image': ''},
      {'name': 'wandi_brigez', 'image': ''},
      {'name': 'alham_tua', 'image': ''},
      {'name': 'Gadi_Follback', 'image': ''},
      {'name': 'ALam_ngabret', 'image': ''},
      {'name': 'Haitsam_H', 'image': ''},
      {'name': 'Faizal', 'image': ''},
      {'name': 'Dera_', 'image': ''},
      {'name': 'Hanif_Bdg', 'image': ''},
    ];
    final List<Map<String, String>> feedList = [
      {
        'username': 'twoopick_celeste',
        'profile': 'assets/images/foto_profil.png',
        'postImage': 'assets/images/gagah.jpeg',
        'caption': 'Lagi mejehna naek vesmet 🛵💨',
      },
      {
        'username': 'twoopick_celeste',
        'profile': 'assets/images/foto_profil.png',
        'postImage': 'assets/images/saya.jpeg',
        'caption': 'Foto kita blur, tapi ceritanya jelas.',
      },
      {
        'username': 'twoopick_celeste',
        'profile': 'assets/images/foto_profil.png',
        'postImage': 'assets/images/topik.jpeg',
        'caption': 'StreetWear Ootd.',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'instagram',
          style: TextStyle(
            fontFamily: 'Billabong',
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chat_bubble_outline),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: feedList.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Column(
              children: [
                SizedBox(
                  height: 106,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    itemCount: stories.length,
                    itemBuilder: (context, storyIndex) {
                      final story = stories[storyIndex];
                      final bool isAdd = story['type'] == 'add';
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(2.5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: isAdd
                                    ? null
                                    : const LinearGradient(
                                        colors: [
                                          Color(0xFFfd1d1d),
                                          Color(0xFFfcb045),
                                        ],
                                        begin: Alignment.topRight,
                                        end: Alignment.bottomLeft,
                                      ),
                              ),
                              child: CircleAvatar(
                                radius: 31,
                                backgroundColor: Colors.black,
                                child: CircleAvatar(
                                  radius: 29,
                                  backgroundColor: Colors.grey[900],
                                  backgroundImage: isAdd
                                      ? null
                                      : AssetImage(story['image']!),
                                  child: isAdd
                                      ? const Icon(Icons.add, color: Colors.white)
                                      : null,
                                ),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              story['name']!,
                              style: const TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Divider(height: 1, thickness: 0.2, color: Colors.grey),
              ],
            );
          }
          final post = feedList[index - 1];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  radius: 18,
                  backgroundImage: AssetImage(post['profile']!),
                ),
                title: Text(
                  post['username']!,
                  style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                trailing: const Icon(Icons.more_vert, size: 20),
              ),
              Image.asset(
                post['postImage']!,
                width: double.infinity,
                height: 380,
                fit: BoxFit.cover,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chat_bubble_outline),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.send_outlined),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.bookmark_border),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                    children: [
                      TextSpan(
                        text: '${post['username']} ',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: post['caption']),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}