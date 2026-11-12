import 'package:flutter/material.dart';
import 'eco_receipt_page.dart';

class EcoDetailScreen extends StatefulWidget {
  final Map<String, dynamic> itemData;

  const EcoDetailScreen({super.key, required this.itemData});

  @override
  State<EcoDetailScreen> createState() => _EcoDetailScreenState();
}

class _EcoDetailScreenState extends State<EcoDetailScreen> {
  int jumlahTiket = 1;
  String metodePembayaran = 'Cash';

  @override
  Widget build(BuildContext context) {
    final int hargaSatuan = widget.itemData['price'] as int;
    final int totalHarga = hargaSatuan * jumlahTiket;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B4D3E),
        title: Text(widget.itemData['title'] as String, style: const TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.itemData['image'] as String, height: 250, width: double.infinity, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(widget.itemData['title'] as String, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1B4D3E))),
                      ),
                      Text('Rp $hargaSatuan', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.grey, size: 16),
                      Text(' ${widget.itemData['location']}', style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const Divider(height: 30),
                  const Text('Deskripsi Ekowisata', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(widget.itemData['description'] as String, style: const TextStyle(color: Colors.black87, height: 1.4)),
                  const Divider(height: 30),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Jumlah Tiket:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if (jumlahTiket > 1) setState(() => jumlahTiket--);
                            },
                            icon: const Icon(Icons.remove_circle_outline, color: Color(0xFF1B4D3E)),
                          ),
                          Text('$jumlahTiket', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          IconButton(
                            onPressed: () {
                              setState(() => jumlahTiket++);
                            },
                            icon: const Icon(Icons.add_circle_outline, color: Color(0xFF1B4D3E)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  const Text('Metode Pembayaran:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('Cash'),
                          value: 'Cash',
                          groupValue: metodePembayaran,
                          onChanged: (value) => setState(() => metodePembayaran = value!),
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<String>(
                          title: const Text('QRIS'),
                          value: 'QRIS',
                          groupValue: metodePembayaran,
                          onChanged: (value) => setState(() => metodePembayaran = value!),
                        ),
                      ),
                    ],
                  ),

                  // DETAIL QRIS: Muncul otomatis jika metode pembayaran dipilih QRIS
                  if (metodePembayaran == 'QRIS') ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.green.shade300),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Scan QR Code di bawah untuk membayar',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1B4D3E)),
                          ),
                          const SizedBox(height: 12),
                          // Simulasi Gambar QR Code menggunakan placeholder/ikon atau gambar QR
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Colors.grey.shade300),
                            ),
                            child: const Icon(Icons.qr_code_2, size: 100, color: Color(0xFF1B4D3E)),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Dapat dipindai melalui GoPay, OVO, Dana, BCA, Mandiri, dll.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],

                  const SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Total Pembayaran:', style: TextStyle(color: Colors.grey)),
                          Text('Rp $totalHarga', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1B4D3E),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EcoReceiptScreen(
                                title: widget.itemData['title'] as String,
                                location: widget.itemData['location'] as String,
                                jumlah: jumlahTiket,
                                total: totalHarga,
                                metode: metodePembayaran,
                              ),
                            ),
                          );
                        },
                        child: const Text('Bayar Sekarang', style: TextStyle(color: Colors.white, fontSize: 16)),
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
  }
}