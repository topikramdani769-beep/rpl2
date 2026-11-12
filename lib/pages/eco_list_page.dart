import 'package:flutter/material.dart';
import 'eco_detail_page.dart';

class EcoListScreen extends StatelessWidget {
  const EcoListScreen({super.key});

  // Data 10 Item Wisata Alam & Ekowisata (Sepenuhnya Berbahasa Indonesia & Detail)
  final List ecoTourismList = const [
    {
      'title': 'Suaka Konservasi Orangutan Borneo',
      'category': 'SAFARI ALAM LIAR',
      'location': 'Kalimantan, Indonesia',
      'price': 150000,
      'rating': 4.9,
      'image': 'https://images.unsplash.com/photo-1534567153574-2b12153a87f0?q=80&w=600',
      'description': 'Jelajahi keindahan hutan hujan tropis Kalimantan yang lebat dan saksikan secara langsung upaya konservasi orangutan di habitat alaminya bersama pemandu alam berpengalaman.',
    },
    {
      'title': 'Petualangan Taman Nasional Komodo',
      'category': 'EKSPEDISI PULAU',
      'location': 'Nusa Tenggara Timur, Indonesia',
      'price': 350000,
      'rating': 4.8,
      'image': 'https://images.unsplash.com/photo-1575550959106-5a7defe28b56?q=80&w=600',
      'description': 'Nikmati petualangan eksklusif melihat langsung kadal purba Komodo, snorkeling di hamparan pantai berpasir pink yang memukau, serta menikmati pemandangan savana eksotis.',
    },
    {
      'title': 'Ekowisata Hutan Hujan Amazon',
      'category': 'PENGINAPAN HUTAN',
      'location': 'Brasil, Amerika Selatan',
      'price': 500000,
      'rating': 4.7,
      'image': 'https://images.unsplash.com/photo-1516026672322-bc52d61a55d5?q=80&w=600',
      'description': 'Rasakan pengalaman menginap di eco-lodge tengah hutan hujan Amazon, melakukan susur sungai di malam hari, dan mengamati keanekaragaman satwa liar eksotis.',
    },
    {
      'title': 'Cagar Alam Margasatwa Serengeti',
      'category': 'SAVANA AFRIKA',
      'location': 'Tanzania, Afrika Timur',
      'price': 650000,
      'rating': 5.0,
      'image': 'https://images.unsplash.com/photo-1516426122078-c23e76319801?q=80&w=600',
      'description': 'Saksikan fenomena migrasi agung jutaan satwa liar melintasi savana luas Afrika langsung dari kemah eksklusif yang ramah lingkungan.',
    },
    {
      'title': 'Ekowisata Hutan Kabut Monteverde',
      'category': 'HUTAN KABUT',
      'location': 'Monteverde, Kosta Rika',
      'price': 280000,
      'rating': 4.9,
      'image': 'https://images.unsplash.com/photo-1448375240586-882707db888b?q=80&w=600',
      'description': 'Berjalan di atas jembatan gantung di atas kanopi hutan kabut tropis yang lembap, sambil mengamati burung quetzal yang langka.',
    },
    {
      'title': 'Ekspedisi Bahari Kepulauan Galapagos',
      'category': 'WISATA LAUT',
      'location': 'Ekuador',
      'price': 700000,
      'rating': 4.9,
      'image': 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?q=80&w=600',
      'description': 'Ikuti ekspedisi laut ramah lingkungan untuk menyelami keindahan bawah laut Galapagos bersama singa laut, penyu, dan kura-kura raksasa.',
    },
    {
      'title': 'Safari Macan Tutul Taman Nasional Yala',
      'category': 'SAFARI ALAM LIAR',
      'location': 'Sri Lanka',
      'price': 200000,
      'rating': 4.6,
      'image': 'https://images.unsplash.com/photo-1561731216-c3a4d99437d5?q=80&w=600',
      'description': 'Nikmati safari pagi hari di Taman Nasional Yala untuk melacak keberadaan macan tutul Sri Lanka, gajah liar, dan berbagai jenis burung endemik.',
    },
    {
      'title': 'Trekking Konservasi Panda Merah',
      'category': 'TREKKING PEGUNUNGAN',
      'location': 'Nepal',
      'price': 320000,
      'rating': 4.8,
      'image': 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?q=80&w=600',
      'description': 'Lakukan trekking menyusuri jalur pegunungan Himalaya yang berudara sejuk sambil belajar tentang upaya pelestarian panda merah.',
    },
    {
      'title': 'Jalur Penjelajahan Alam Liar Kruger',
      'category': 'JELAJAH ALAM',
      'location': 'Afrika Selatan',
      'price': 450000,
      'rating': 4.7,
      'image': 'https://images.unsplash.com/photo-1534177616072-ef7dc120449d?q=80&w=600',
      'description': 'Rasakan pariwisata alam liar yang autentik dengan berjalan kaki menelusuri semak belukar dipandu oleh ranger profesional bersertifikat.',
    },
    {
      'title': 'Ekowisata Terumbu Karang Raja Ampat',
      'category': 'WISATA BAHARI',
      'location': 'Papua Barat, Indonesia',
      'price': 600000,
      'rating': 5.0,
      'image': 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?q=80&w=600',
      'description': 'Saksikan keindahan surga bawah laut terbaik di dunia dengan ekosistem terumbu karang yang terjaga serta gugusan pulau karst yang menakjubkan.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F5),
      body: ListView(
        children: [
          // 1. HERO BANNER SECTION (Bagian Atas)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: const BoxDecoration(
              color: Color(0xFF1B4D3E), // Warna hijau tua khas ekowisata
            ),
            child: Column(
              children: [
                const Text(
                  'Ekowisata Nusantara',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                const Text(
                  'Tur Alam Liar & Konservasi',
                  style: TextStyle(
                    color: Colors.amberAccent,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Jelajahi keajaiban satwa liar dan alam langka di destinasi ekowisata terbaik dunia.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70, fontSize: 13),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  onPressed: () {},
                  child: const Text('Pesan Sekarang', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),

          // 2. HEADER JUDUL DAFTAR WISATA
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'DESTINASI UNGGULAN',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Pilihan Perjalanan Ekowisata Terbaik',
                  style: TextStyle(
                    color: Color(0xFF1B4D3E),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // 3. LIST KARTU DESTINASI WISATA
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            itemCount: ecoTourismList.length,
            itemBuilder: (context, index) {
              final item = ecoTourismList[index];
              return Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EcoDetailScreen(itemData: item),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                            child: Image.network(
                              item['image'] as String,
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            top: 12,
                            left: 12,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: const Color(0xFF1B4D3E).withOpacity(0.85),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                item['category'] as String,
                                style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    item['title'] as String,
                                    style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF1B4D3E)),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.star, color: Colors.amber, size: 18),
                                    Text(' ${item['rating']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                const Icon(Icons.location_on, color: Colors.grey, size: 16),
                                const SizedBox(width: 4),
                                Text(item['location'] as String, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              item['description'] as String,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.black54, fontSize: 13),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Rp ${item['price']} / orang',
                                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.green, fontSize: 15),
                                ),
                                const Text(
                                  'Lihat Detail →',
                                  style: TextStyle(color: Color(0xFF1B4D3E), fontWeight: FontWeight.bold, fontSize: 13),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}