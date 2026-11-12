import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        title: const Text('Dashboard Portofolio', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF1B4D3E), Color(0xFF2E7D63)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
        shadowColor: Colors.black26,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          // Banner Sambutan Singkat yang Menarik
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1B4D3E), Color(0xFF388E3C)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.green.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.white24,
                  child: Icon(Icons.code_rounded, color: Colors.white, size: 30),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Halo, Selamat Datang!',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Pilih modul navigasi tugas dan proyek di bawah ini.',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // KATEGORI: UMUM
          _buildSectionHeader('Menu Utama'),
          _buildMenuCard(
            context,
            title: 'Halaman About',
            subtitle: 'Informasi lengkap tentang aplikasi',
            icon: Icons.info_outline,
            route: AppRoutes.about,
          ),
          // MENU ECO WISATA
          _buildMenuCard(
            context,
            title: 'Halaman Eco Wisata',
            subtitle: 'Jelajahi destinasi wisata alam dan lingkungan',
            icon: Icons.eco_outlined,
            route: AppRoutes.ecoList,
          ),
          _buildMenuCard(
            context,
            title: 'Halaman Latihan Feed',
            subtitle: 'Lihat tampilan feed sosial media interaktif',
            icon: Icons.feed_outlined,
            route: AppRoutes.latihanfeed,
          ),

          const SizedBox(height: 16),

          // KATEGORI: SOSIAL MEDIA / TAMPILAN
          _buildSectionHeader('Tampilan Instagram'),
          _buildMenuCard(
            context,
            title: 'Halaman Instagram',
            subtitle: 'Eksplorasi grid layout galeri foto',
            icon: Icons.grid_view_rounded,
            route: AppRoutes.grid,
          ),

          const SizedBox(height: 16),

          // KATEGORI: FORMULIR & DATA
          _buildSectionHeader('Formulir & Data'),
          _buildMenuCard(
            context,
            title: 'Halaman Formulir',
            subtitle: 'Formulir pengisian data input user',
            icon: Icons.description_outlined,
            route: AppRoutes.formulir,
          ),
          _buildMenuCard(
            context,
            title: 'Halaman Input',
            subtitle: 'Manajemen form input data lanjutan',
            icon: Icons.input_rounded,
            route: AppRoutes.input,
          ),
          _buildMenuCard(
            context,
            title: 'Halaman Album',
            subtitle: 'Koleksi galeri foto dan media penyimpanan',
            icon: Icons.photo_album_outlined,
            route: AppRoutes.album,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  // Widget helper untuk membuat Judul Kategori Section
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, top: 4.0),
      child: Text(
        title.toUpperCase(),
        style: const TextStyle(
          color: Color(0xFF1B4D3E),
          fontSize: 13,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.3,
        ),
      ),
    );
  }

  // Widget helper untuk membuat Kartu Menu yang Seragam & Rapi
  Widget _buildMenuCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required String route,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
          side: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          leading: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color(0xFF1B4D3E).withOpacity(0.15), const Color(0xFF1B4D3E).withOpacity(0.05)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF1B4D3E), size: 22),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              subtitle,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ),
          trailing: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: Color(0xFF1B4D3E)),
          ),
          onTap: () {
            Navigator.pushNamed(context, route);
          },
        ),
      ),
    );
  }
}