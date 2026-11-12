import 'package:flutter/material.dart';

class EcoReceiptScreen extends StatelessWidget {
  final String title;
  final String location;
  final int jumlah;
  final int total;
  final String metode;

  const EcoReceiptScreen({
    super.key,
    required this.title,
    required this.location,
    required this.jumlah,
    required this.total,
    required this.metode,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1B4D3E),
        title: const Text('Struk Pembayaran', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(child: Icon(Icons.check_circle, color: Colors.green, size: 64)),
                  const SizedBox(height: 12),
                  const Center(
                    child: Text('Pembayaran Berhasil!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF1B4D3E))),
                  ),
                  const Divider(height: 30),
                  _buildRow('Destinasi', title),
                  _buildRow('Lokasi', location),
                  _buildRow('Jumlah Tiket', '$jumlah Tiket'),
                  _buildRow('Metode Bayar', metode),
                  const Divider(height: 30),
                  _buildRow('Total Bayar', 'Rp $total', isBold: true),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B4D3E),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: const Text('Kembali ke Beranda', style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: TextStyle(color: Colors.grey[700], fontSize: 15)),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
              fontSize: isBold ? 16 : 15,
              color: isBold ? Colors.green : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}