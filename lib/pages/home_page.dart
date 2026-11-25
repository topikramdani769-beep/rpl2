import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../routes/app_routes.dart';
import '../services/auth_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = AuthService();
  late Future<UserModel> _futureUser;

  @override
  void initState() {
    super.initState();
    _futureUser = _auth.getUser();
  }

  void _retryFetchUser() {
    setState(() {
      _futureUser = _auth.getUser();
    });
  }

  Future<void> _logout() async {
    await _auth.logout();
    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAF9),
      appBar: AppBar(
        title: const Text(
          'Dashboard Portofolio',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
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
        actions: [
          IconButton(
            onPressed: _logout,
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          _buildUserBanner(),

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
          // MENU BARU: POST PAGE
          _buildMenuCard(
            context,
            title: 'Halaman Post',
            subtitle: 'Lihat daftar postingan data dari API',
            icon: Icons.article_outlined,
            route: AppRoutes.post,
          ),
          // MENU ARTIKEL (CRUD + FOTO)
          _buildMenuCard(
            context,
            title: 'Halaman Artikel',
            subtitle: 'Kelola daftar artikel dan upload foto sampul',
            icon: Icons.edit_note_rounded,
            route: '/articles',
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

  Widget _buildUserBanner() {
    return FutureBuilder<UserModel>(
      future: _futureUser,
      builder: (context, snap) {
        String greeting = 'Halo, Selamat Datang!';
        String subtitle =
            'Pilih modul navigasi tugas dan proyek di bawah ini.';
        bool hasError = false;
        String errorText = '';

        if (snap.connectionState == ConnectionState.waiting) {
          greeting = 'Memuat data pengguna...';
        } else if (snap.hasError) {
          hasError = true;
          errorText = snap.error.toString();
          greeting = 'Gagal memuat profil';
          subtitle = errorText;
        } else if (snap.hasData && snap.data != null) {
          final user = snap.data!;
          greeting = 'Halo, ${user.name}!';
          subtitle = '${user.email} • Pilih modul navigasi di bawah ini.';
        }

        return Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white24,
                    child: snap.connectionState == ConnectionState.waiting
                        ? const SizedBox(
                            width: 22,
                            height: 22,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Icon(
                            Icons.code_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          greeting,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (hasError) ...[
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        side: const BorderSide(color: Colors.white54),
                      ),
                      onPressed: _retryFetchUser,
                      child: const Text('Coba Lagi'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF1B4D3E),
                      ),
                      onPressed: _logout,
                      child: const Text('Kembali ke Login'),
                    ),
                  ],
                ),
              ],
            ],
          ),
        );
      },
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
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          leading: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF1B4D3E).withOpacity(0.15),
                  const Color(0xFF1B4D3E).withOpacity(0.05),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: const Color(0xFF1B4D3E), size: 22),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black87,
            ),
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
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
              color: Color(0xFF1B4D3E),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, route);
          },
        ),
      ),
    );
  }
}