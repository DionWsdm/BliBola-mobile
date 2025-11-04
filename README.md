Tugas 7:

Soal:
1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".

Jawaban:
1. Widget tree adalah struktur pohon yang menggambarkan bagaimana widget saling terhubung di dalam aplikasi Flutter. Setiap elemen di UI adalah widget, dan widget bisa memiliki anak (child) atau kumpulan anak (children). Hubungan parent-child berarti widget induk membungkus widget anaknya dan mengatur bagaimana anak tersebut ditampilkan, seperti tata letak, posisi, atau gaya. Misalnya, Column sebagai parent mengatur posisi beberapa ItemCard (children) secara vertikal.
2. Widget yang Digunakan dan Fungsinya
    - MaterialApp: membungkus seluruh aplikasi dan menyediakan tema, warna, serta navigasi dasar.
    - Scaffold: struktur dasar halaman yang punya AppBar, body, dan elemen UI utama.
    - AppBar: bagian atas halaman yang menampilkan judul “Football News”.
    - Center: memposisikan konten di tengah layar.
    - Column: menata widget anak secara vertikal.
    - Padding: memberi jarak di sekitar widget.
    - Text: menampilkan tulisan.
    - GridView.count: menampilkan daftar ItemCard dalam bentuk grid.
    - Material: memberi efek material design, seperti warna latar dan sudut melengkung.
    - InkWell: menangani ketika sebuah widget card disentuh dan efek gelombang air (ripple).
    - Container: pembungkus dengan padding, ukuran, dan alignment.
    - Icon: menampilkan ikon.
3. MaterialApp adalah widget utama yang menyediakan pengaturan global untuk aplikasi Flutter berbasis Material Design, seperti tema warna, font, rute, dan navigasi. Widget ini biasanya digunakan sebagai root widget karena ia menjadi fondasi bagi tampilan dan interaksi aplikasi. Tanpa MaterialApp, banyak widget material seperti Scaffold atau AppBar tidak akan berfungsi dengan benar.
4. StatelessWidget digunakan untuk widget yang tampilannya tidak berubah selama aplikasi berjalan (tidak punya state). Sementara StatefulWidget digunakan jika ada data atau kondisi yang bisa berubah, misalnya ketika menekan tombol atau memuat data baru. Jadi, jika UI hanya menampilkan data statis, StatelessWidget digunakan. Tapi untuk interface yang dinamis, StatefulWidget lebih cocok.
5. BuildContext adalah objek yang menyimpan informasi tentang posisi widget di dalam widget tree. Ia penting karena dipakai untuk mengakses hal-hal seperti tema, navigator, atau scaffold terdekat. Dalam metode build(), context digunakan agar widget bisa “berkomunikasi” dengan lingkungan sekitarnya, misalnya Theme.of(context) untuk mengambil warna tema aplikasi.
6. Hot reload memperbarui kode yang sedang dijalankan tanpa menghapus state aplikasi. Jadi, perubahan kecil seperti warna, teks, atau layout bisa langsung terlihat tanpa kehilangan data yang sedang aktif. Hot restart, sebaliknya, me-restart seluruh aplikasi dari awal dan menghapus semua state, mirip seperti menjalankan ulang aplikasi dari nol. Hot reload cocok untuk pengembangan cepat, sementara hot restart berguna jika mengubah hal-hal mendasar seperti variabel global atau struktur aplikasi utama.