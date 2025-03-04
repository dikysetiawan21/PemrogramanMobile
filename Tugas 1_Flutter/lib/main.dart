import 'package:flutter/material.dart';

// Fungsi utama yang menjalankan aplikasi Flutter
void main() {
  runApp(const MyApp());
}

// Widget utama aplikasi yang bersifat Stateful
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// State untuk mengatur perubahan dalam aplikasi
class _MyAppState extends State<MyApp> {
  int _selectedIndex =
      0; // Menyimpan indeks dari item yang dipilih di BottomNavigationBar

  // Fungsi untuk menangani perubahan item di BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, // Menghilangkan banner debug di pojok kanan atas
      home: Scaffold(
        // Membuat AppBar dengan desain khusus menggunakan ClipRRect
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(140), // Mengatur tinggi AppBar
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(
                20,
              ), // Membuat sudut bawah kiri membulat
              bottomRight: Radius.circular(
                20,
              ), // Membuat sudut bawah kanan membulat
            ),
            child: AppBar(
              backgroundColor: Colors.blue, // Warna latar belakang AppBar
              elevation: 5, // Memberikan efek bayangan pada AppBar
              flexibleSpace: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 10.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Bagian atas AppBar berisi ikon menu, judul, dan ikon notifikasi
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.menu, color: Colors.white),
                            onPressed:
                                () {}, // Fungsi ketika tombol menu ditekan
                          ),
                          const Text(
                            "I Am Programmer", // Judul di tengah AppBar
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                            onPressed:
                                () {}, // Fungsi ketika tombol notifikasi ditekan
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      // Bagian teks sambutan
                      const Text(
                        "Hi Programmer!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "The life of a coder", // Deskripsi kecil di bawah teks sambutan
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        // Body aplikasi yang berisi daftar kartu kursus dalam ListView
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Memanggil fungsi buildCourseCard untuk membuat kartu kursus
            buildCourseCard(
              "UI/UX Design",
              Image.asset('assets/images/uiux.jpg'),
              "🎨 Belajar desain yang bikin mata nyaman, bukan sakit kepala 😆",
            ),
            buildCourseCard(
              "Game Development",
              Image.asset('assets/images/gamedevelopment.jpg'),
              "🎮 Belajar membuat game dari nol hingga pro!",
            ),
            buildCourseCard(
              "Web Development",
              Image.asset('assets/images/webdevelopment.jpg'),
              "🌐 Menjadi web developer handal dengan teknologi terbaru!",
            ),
            buildCourseCard(
              "Mobile App Development",
              Image.asset('assets/images/mobileappdevelopment.jpg'),
              "📱 Bikin aplikasi keren untuk Android & iOS.",
            ),
          ],
        ),
        // Bottom Navigation Bar untuk navigasi antar halaman
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                spreadRadius: 1,
                blurRadius: 10,
              ), // Efek bayangan pada navbar
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex, // Menunjukkan item yang aktif
            onTap: _onItemTapped, // Mengubah indeks ketika item dipilih
            type:
                BottomNavigationBarType
                    .fixed, // Menjaga ikon dan label tetap terlihat
            selectedItemColor: Colors.blue, // Warna ikon saat dipilih
            unselectedItemColor: Colors.grey, // Warna ikon yang tidak dipilih
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.task), label: 'Task'),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk membangun kartu kursus
  Widget buildCourseCard(String title, Widget imageWidget, String description) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16), // Jarak antar kartu
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ), // Membuat sudut kartu membulat
      elevation: 5, // Efek bayangan pada kartu
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // Menampilkan gambar dengan sudut membulat
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(width: 80, height: 80, child: imageWidget),
            ),
            const SizedBox(width: 16), // Jarak antara gambar dan teks
            // Bagian teks yang berisi judul dan deskripsi kursus
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title, // Judul kursus
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description, // Deskripsi kursus
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            // Ikon panah ke kanan sebagai indikasi navigasi
            const Icon(Icons.arrow_forward_ios, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}
