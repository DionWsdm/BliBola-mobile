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

Tugas 8:

Soal:
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?

Jawaban:
1. Perbedaan Navigator.push() dan Navigator.pushReplacement()
Perbedaan utama antara Navigator.push() dan Navigator.pushReplacement() terletak pada cara mereka memanipulasi stack navigasi (tumpukan halaman) dalam aplikasi Flutter:
- Navigator.push(): Menambahkan rute (halaman baru) ke atas tumpukan navigasi yang sudah ada. Halaman sebelumnya tetap ada di tumpukan. Ini memungkinkan saya untuk kembali ke halaman sebelumnya menggunakan tombol back bawaan perangkat atau Navigator.pop().
Dalam aplikasi saya, ini digunakan untuk navigasi ke halaman "Add News" (NewsFormPage) dari "Home" (MyHomePage) melalui ItemCard. Tujuannya agar setelah saya selesai mengisi form di halaman "Add News", saya bisa dengan mudah menekan tombol back untuk kembali ke halaman "Home" tanpa harus memuat ulang halaman utama.
- Navigator.pushReplacement(): Mengganti rute teratas saat ini dengan rute baru. Halaman sebelumnya dihapus dari tumpukan navigasi. Ini berarti saya tidak bisa kembali ke halaman yang diganti menggunakan tombol back. Dalam aplikasi saya, inidigunakan dalam LeftDrawer saat menavigasi antara "Home" dan "Add News". Saya menggunakannya karena ketika saya mengakses salah satu halaman melalui drawer, saya tidak ingin halaman drawer tersebut tetap berada di tumpukan; ini mencegah tumpukan navigasi menjadi terlalu dalam atau kembali ke drawer lagi setelah keluar.

2. Pemanfaatan Hierarchy Widget untuk Konsistensi
Saya memanfaatkan hirarki widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi saya, yaitu pada MyHomePage dan NewsFormPage.
- Scaffold: Berfungsi sebagai kerangka dasar untuk setiap halaman, menyediakan struktur visual utama. Dengan menggunakan Scaffold, saya memastikan bahwa setiap halaman memiliki area yang jelas untuk app bar, body utama, dan drawer.
- AppBar: Digunakan di kedua halaman (MyHomePage dan NewsFormPage) untuk menampilkan judul aplikasi yang konsisten ("Football News" atau "Form Tambah Berita") dan memiliki warna latar belakang yang sama (Indigo/Primary Color) untuk identitas visual yang seragam.
- Drawer: Widget LeftDrawer saya buat sebagai widget terpisah (StatelessWidget) dan diterapkan di kedua halaman (MyHomePage dan NewsFormPage). Ini adalah kunci konsistensi:
    Struktur Menu Sama: Menu navigasi (Home dan Add News) selalu terlihat dan berfungsi sama, terlepas dari halaman mana saya membukanya.
    Navigasi Konsisten: Logika routing (menggunakan Navigator.pushReplacement()) di dalam drawer juga sama, memastikan pengalaman navigasi yang mulus.

3. Kelebihan Layout Widget pada Elemen Form
Dalam konteks desain antarmuka form, menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView memberikan kelebihan utama pada keterbacaan dan kemampuan beradaptasi dengan berbagai ukuran layar.
- Padding:
Kelebihan: Memberikan ruang kosong yang konsisten di sekitar elemen input (TextFormField, DropdownButtonFormField, dll.), yang secara signifikan meningkatkan keterbacaan dan membuat antarmuka tidak terasa sesak. Contoh Penggunaan: Saya menggunakan Padding(padding: const EdgeInsets.all(8.0), child: ...) di sekitar setiap TextFormField dan DropdownButtonFormField di NewsFormPage untuk memisahkan setiap kolom input secara visual.
- SingleChildScrollView:
Kelebihan: Membuat seluruh konten form dapat di-scroll. Ini sangat penting untuk pencegahan overflow (tampilan terpotong) pada perangkat dengan layar kecil atau saat keyboard virtual muncul. Pengguna tetap dapat mengakses semua field form. Contoh Penggunaan: Saya membungkus Column yang berisi semua input form di NewsFormPage dengan SingleChildScrollView.
- ListView (pada LeftDrawer):
Kelebihan: Mirip dengan SingleChildScrollView, tetapi secara khusus dioptimalkan untuk daftar, memastikan bahwa semua item di drawer (seperti ListTile untuk Home dan Add News) tetap dapat diakses meskipun daftar itemnya panjang. Contoh Penggunaan: Saya menggunakan ListView sebagai child dari Drawer di LeftDrawer untuk menampung DrawerHeader dan semua ListTile navigasi.

4. Penyesuaian Warna Tema Aplikasi
Saya menyesuaikan warna tema agar aplikasi Football News memiliki identitas visual yang konsisten dengan brand toko dengan mengatur properti warna di widget kunci:
- Warna Primer (Dominan): Saya menggunakan warna Indigo sebagai warna utama (primary color) aplikasi. Ini terlihat pada AppBar di NewsFormPage (backgroundColor: Colors.indigo,) dan tombol "Simpan" (backgroundColor: WidgetStateProperty.all(Colors.indigo)). Di MyHomePage, AppBar menggunakan warna utama dari Theme.of(context).colorScheme.primary, yang umumnya ditetapkan ke warna tema aplikasi (misalnya, Indigo).
- Warna Sekunder/Aksen: Saya menggunakan warna untuk elemen interaktif atau kartu. Di MyHomePage, ItemCard menggunakan Theme.of(context).colorScheme.secondary sebagai warna latar belakang (color: Theme.of(context).colorScheme.secondary). Jika skema warna tema saya memiliki warna sekunder yang cocok (misalnya, biru gelap atau aksen oranye pada brand sepak bola), ini akan secara otomatis diterapkan.
- Warna Teks/Kontras: Saya secara eksplisit mengatur warna teks menjadi putih (color: Colors.white) pada elemen yang berada di atas latar belakang Indigo (seperti judul AppBar, teks di DrawerHeader, dan teks tombol "Simpan") untuk memastikan kontras yang baik dan keterbacaan.

Dengan mengandalkan warna dari theme (Theme.of(context).colorScheme.primary dan .secondary) dan menetapkan warna yang sama secara eksplisit di tempat lain (seperti Colors.indigo), saya dapat mempertahankan skema warna yang kohesif di seluruh aplikasi.

Tugas 9:
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
2. Apa fungsi package http dan CookieRequest dalam tugas ini?Jelaskan perbedaan peran http vs CookieRequest.
3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.

Jawaban:
1. Pentingnya Model Dart untuk Data JSON
Kita perlu membuat model Dart (kelas) saat mengambil atau mengirim data JSON karena beberapa alasan krusial yang berkaitan dengan keamanan tipe (type safety), null-safety, dan maintainability (kemudahan pemeliharaan).

Mengapa Model Diperlukan
Keamanan Tipe dan Validasi: Dengan model, kita mendefinisikan secara eksplisit tipe data untuk setiap field (misalnya, String untuk nama, int untuk usia). Jika kita hanya menggunakan Map<String, dynamic>, kita harus selalu melakukan casting secara manual (misalnya, data['name'] as String?). Jika field tersebut hilang atau tipe datanya salah, casting manual ini dapat menyebabkan runtime error (kesalahan saat aplikasi berjalan) yang sulit dilacak. Model menyediakan validasi tipe yang lebih kuat.

Null-Safety: Dart memiliki null-safety yang ketat. Dalam Map<String, dynamic>, kita tidak tahu apakah sebuah key pasti ada atau tidak, dan apakah nilainya pasti non-null. Dalam model, kita dapat mendefinisikan field sebagai wajib (final String name;) atau opsional/nullable (final String? description;). Ini memaksa kita untuk menangani potensi nilai null selama proses pemetaan (fromJson), sehingga mencegah runtime error yang disebabkan oleh dereferensi null.

Maintainability dan Readability: Model bertindak sebagai dokumentasi yang jelas tentang struktur data yang diharapkan dari API. Setiap kali struktur API berubah, perubahan pada model akan langsung menunjukkan error kompilasi, memaksa pengembang untuk memperbarui logika di semua tempat yang menggunakan model tersebut. Ini jauh lebih mudah dikelola daripada melacak perubahan pada string keys di seluruh kode yang menggunakan Map<String, dynamic>.

Konsekuensi Memetakan Langsung Map<String, dynamic>
Konsekuensi utama dari langsung memetakan Map<String, dynamic> adalah:

Peningkatan Risiko Runtime Error: Kesalahan pengetikan pada key (string literal), salah asumsi tipe data, atau kegagalan menangani nilai null akan menyebabkan aplikasi crash hanya saat kode tersebut dieksekusi (bukan saat dikompilasi).

Kode yang Sulit Dipelihara: Tidak ada autocomplete atau pemeriksaan tipe untuk string keys, membuat refactoring atau perubahan struktur data menjadi proses yang rawan kesalahan dan memakan waktu.

2. Fungsi Package http dan CookieRequest
Fungsi Package http
Package http adalah library standar di Flutter/Dart untuk melakukan permintaan HTTP (seperti GET, POST, PUT, DELETE) ke server web. Fungsinya adalah sebagai klien yang mengirim permintaan dan menerima respons, namun tidak secara otomatis mengelola state seperti cookies di antara permintaan yang berbeda. Setiap permintaan yang dibuat dianggap independen.

Fungsi CookieRequest (Mengasumsikan Custom atau Library Pengelola Cookie)
CookieRequest (atau kelas serupa seperti http.Client yang diperluas, atau library seperti dio dengan cookie manager) digunakan untuk mengelola session state, terutama cookies, secara otomatis di antara beberapa permintaan. Fungsi utamanya adalah:

Menerima Cookie: Setelah permintaan login yang berhasil, ia akan menyimpan cookie yang dikirim server di header respons.

Mengirim Cookie: Secara otomatis melampirkan cookie yang disimpan pada setiap permintaan berikutnya ke domain yang sama (misalnya, permintaan untuk mengambil data pengguna yang terautentikasi).

Peran http:
Peran dasar: Melakukan permintaan HTTP tunggal.
Manajemen Cookie:Tidak mengelola cookie antar permintaan.
Sesi: Setiap permintaan adalah sesi baru (tidak stateful).
Penggunaan: Untuk permintaan publik yang tidak memerlukan autentikasi sesi.

Peran CookieRequest:
Peran dasar: Melakukan permintaan HTTP dan mengelola state.
Manajemen Cookie: Secara otomatis menyimpan dan mengirim kembali cookies untuk mempertahankan sesi.
Sesi: Mempertahankan sesi (stateful) dengan menyimpan cookies login.
Penggunaan: Untuk semua permintaan yang memerlukan autentikasi sesi (seperti API yang hanya dapat diakses setelah login).