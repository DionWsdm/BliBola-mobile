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
7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).

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

3. Pentingnya Berbagi Instance CookieRequest
Instance CookieRequest (atau HTTP client dengan manajemen cookie) perlu dibagikan (di-share) ke semua komponen di aplikasi Flutter karena sifatnya yang stateful.

Jika setiap komponen membuat instance CookieRequest yang baru, maka setiap instance tersebut akan memiliki penyimpanan cookie yang terpisah dan kosong. Ketika pengguna login melalui satu instance, cookie sesi akan disimpan di instance tersebut. Namun, instance lain yang digunakan untuk mengambil data (misalnya, di halaman profil) tidak akan memiliki cookie tersebut dan server (Django) akan menolak permintaan karena pengguna dianggap belum terautentikasi.

Dengan membagikan satu instance ke seluruh aplikasi (misalnya, menggunakan pattern Singleton atau Dependency Injection), kita memastikan bahwa:

Sesi Terpelihara: Cookie yang diterima saat login disimpan di instance bersama.

Akses Terautentikasi: Semua permintaan selanjutnya yang dibuat oleh komponen mana pun di aplikasi akan menggunakan instance bersama ini, yang secara otomatis melampirkan cookie sesi yang valid.

4. Konfigurasi Konektivitas Flutter dan Django
Konfigurasi Konektivitas yang Diperlukan
Agar aplikasi Flutter (berjalan di emulator atau device) dapat berkomunikasi dengan server Django (berjalan secara lokal), konfigurasi berikut diperlukan:

1) Menambahkan 10.0.2.2 pada ALLOWED_HOSTS di Django
Mengapa: Ketika aplikasi Android dijalankan di emulator Google, loopback address (127.0.0.1 atau localhost) dari sudut pandang emulator adalah emulator itu sendiri, bukan komputer host (tempat Django berjalan). IP 10.0.2.2 adalah alamat khusus yang digunakan oleh Android emulator untuk merujuk kembali ke interface loopback dari mesin host. Django, sebagai server web, memerlukan alamat host yang valid di header permintaan.

Apa yang terjadi jika tidak dilakukan: Django akan menolak permintaan dengan error "Invalid HTTP_HOST header" atau 400 Bad Request, karena 10.0.2.2 tidak diizinkan untuk mengakses server tersebut.

2) Mengaktifkan CORS (Cross-Origin Resource Sharing)
Mengapa: Secara default, browser dan klien web menerapkan kebijakan Same-Origin Policy (SOP). Walaupun aplikasi mobile tidak terikat SOP seketat browser, framework seperti Flutter dapat mengirim permintaan dengan origin yang berbeda. Kita perlu mengaktifkan dan mengkonfigurasi middleware CORS (misalnya, django-cors-headers) untuk memberi tahu Django bahwa mengizinkan permintaan dari domain yang berbeda (misalnya, dari aplikasi Flutter).

Apa yang terjadi jika tidak dilakukan: Django mungkin menolak permintaan pra-penerbangan (preflight OPTIONS request) atau permintaan autentikasi, yang sering kali menghasilkan error CORS di sisi klien Flutter.

3) Pengaturan SameSite / Cookie
Mengapa: Cookie sesi Django (misalnya, sessionid atau CSRF token) sering kali memiliki atribut SameSite=Lax atau SameSite=Strict. Ini membatasi pengiriman cookie dalam konteks cross-site. Karena Flutter dan Django berjalan pada origin (sumber) yang secara teknis berbeda (meskipun keduanya di localhost/host), pengaturan ini perlu diperhatikan:

Pastikan pengaturan SameSite pada Django memungkinkan cookie dikirim dalam permintaan cross-site (misalnya, dengan menghapusnya atau mengaturnya ke SameSite=None bersamaan dengan Secure=True, meskipun ini lebih relevan untuk lingkungan produksi).

Pastikan CookieRequest pada Flutter mampu menangani dan mengirim cookie dengan benar, terutama dalam konteks HTTP non-aman (saat pengembangan).

Apa yang terjadi jika tidak dilakukan: Cookie sesi tidak akan dikirim kembali oleh Flutter ke Django, sehingga setiap permintaan berikutnya yang memerlukan autentikasi akan dianggap sebagai unauthenticated (gagal mempertahankan sesi).

4) Menambahkan Izin Akses Internet di Android
Mengapa: Untuk berkomunikasi melalui jaringan, aplikasi Android wajib mendeklarasikan izin android.permission.INTERNET di file android/app/src/main/AndroidManifest.xml.

Apa yang terjadi jika tidak dilakukan: Aplikasi Flutter akan gagal membuat koneksi jaringan, seringkali dengan error seperti SocketException: OS Error: Permission denied.

5. Mekanisme Pengiriman Data (Input ke Tampilan Flutter)
Mekanisme pengiriman data dari input pengguna hingga ditampilkan kembali di Flutter umumnya mengikuti langkah-langkah berikut:

Pengambilan Input Flutter: Pengguna memasukkan data (misalnya, melalui widget TextField). Data ini ditangkap oleh controller dan disimpan sebagai variabel Dart (biasanya String).

Pembuatan Request dan JSON Encoding:

Data Dart disiapkan ke dalam Map (misalnya, {'title': 'judul', 'content': 'isi'}).

Map ini kemudian diubah menjadi string berformat JSON menggunakan dart:convert (jsonEncode(dataMap)).

Pengiriman HTTP Request:

Aplikasi menggunakan client HTTP (instance CookieRequest) untuk mengirim permintaan (misalnya, POST atau PUT) ke endpoint API Django yang relevan.

String JSON diletakkan di body permintaan, dan header Content-Type: application/json disetel.

Jika ini adalah operasi terautentikasi, cookie sesi akan otomatis dilampirkan oleh CookieRequest.

Pemrosesan oleh Django:

Django menerima permintaan. Middleware seperti CSRF memvalidasi token.

View Django menerima data JSON dari request body.

Data JSON dide-serialize (diubah) menjadi objek Python (misalnya, dictionary).

Logika business (misalnya, validasi data, penyimpanan ke database melalui model Django, dll.) dijalankan.

Jika berhasil, Django membuat object hasil (misalnya, instance model yang baru disimpan).

Pembuatan Response dan JSON Encoding:

Object hasil (misalnya, data yang baru dibuat beserta ID dari database) di-serialize kembali menjadi string berformat JSON oleh Django Rest Framework (DRF).

Django mengirimkan respons HTTP (biasanya status code 201 Created atau 200 OK) dengan body berisi string JSON.

Penerimaan dan Pemrosesan di Flutter:

Flutter menerima respons.

Status code diperiksa untuk memastikan keberhasilan.

Body respons (JSON string) di-decode kembali menjadi Map<String, dynamic> menggunakan jsonDecode(response.body).

Pemetaan ke Model Dart:

Map<String, dynamic> yang baru di-decode dipetakan ke instance Model Dart (misalnya, Post.fromJson(dataMap)).

Pembaruan State dan Tampilan:

Instance Model Dart yang telah terisi digunakan untuk memperbarui state aplikasi (misalnya, menggunakan StatefulWidget, Provider, atau BLoC).

Perubahan state memicu pembangunan ulang (rebuild) widget Flutter, dan data baru (misalnya, post yang baru dibuat) ditampilkan kepada pengguna.

6. Mekanisme Autentikasi (Login, Register, Logout)
Mekanisme autentikasi dalam Flutter-Django, yang mengandalkan cookies sesi, adalah sebagai berikut:

A. Register (Pendaftaran)
Input Flutter: Pengguna memasukkan username, email, dan password.

Pengiriman Request: Flutter mengirim permintaan POST ke endpoint registrasi Django (misalnya, /api/register/) dengan body berisi data akun dalam format JSON.

Pemrosesan Django:

Django menerima data, memvalidasi input (kekuatan password, keunikan username/ email).

Akun baru dibuat dan disimpan di database dengan password yang sudah di-hash.

Respons Django: Django merespons dengan status code 201 Created atau 200 OK, dan seringkali langsung melakukan login untuk pengguna baru, mengirimkan cookie sesi.

Aksi Flutter: Flutter menangani respons dan dapat mengarahkan pengguna ke halaman login atau langsung ke menu utama (jika login otomatis).

B. Login
Input Flutter: Pengguna memasukkan username dan password.

Pengiriman Request: Flutter mengirim permintaan POST ke endpoint login Django (misalnya, /api/login/ atau endpoint bawaan).

Pemrosesan Django:

Django memvalidasi kredensial.

Jika kredensial valid, Django akan memulai sesi: membuat entri sesi di database dan menghasilkan cookie sesi (berisi session ID).

Respons Django (Krusial):

Django mengirim status code 200 OK dengan header Set-Cookie yang berisi cookie sesi (misalnya, sessionid).

CookieRequest pada Flutter secara otomatis menangkap dan menyimpan cookie sesi ini.

Aksi Flutter:

Flutter memverifikasi status code 200 OK.

Flutter memperbarui state autentikasi aplikasi (misalnya, isLoggedIn = true) dan mengalihkan pengguna ke menu utama/halaman yang terautentikasi. Karena cookie sesi sudah tersimpan, semua permintaan berikutnya akan terautentikasi.

C. Akses Terautentikasi (Contoh: Ambil Data Profil)
Pengiriman Request: Flutter mengirim permintaan GET ke endpoint terautentikasi (misalnya, /api/profile/).

Peran CookieRequest: Instance CookieRequest secara otomatis melampirkan cookie sesi yang tersimpan ke header permintaan.

Pemrosesan Django:

Django menerima permintaan, mengambil session ID dari cookie.

Django memverifikasi session ID di database dan mengidentifikasi pengguna yang terautentikasi (misalnya, request.user).

View menjalankan logika untuk pengguna yang login.

Respons dan Tampilan: Django mengirimkan respons data (JSON), dan Flutter menampilkannya.

D. Logout
Pengiriman Request: Flutter mengirim permintaan POST ke endpoint logout Django (misalnya, /api/logout/).

Pemrosesan Django: Django menerima permintaan dan menghapus sesi dari database server.

Respons Django (Opsional): Django dapat mengirim header Set-Cookie untuk menghapus cookie sesi di klien.

Aksi Flutter (Krusial): Flutter harus:

Memastikan logout berhasil.

Menghapus cookie sesi yang tersimpan dari instance CookieRequest.

Memperbarui state aplikasi menjadi logged out (isLoggedIn = false) dan mengarahkan pengguna kembali ke halaman login.

Tentu, berikut adalah ringkasan yang fokus pada kata kerja aktif yang mengarahkan tindakan Anda, disesuaikan untuk konteks Produk (Product).

7. Langkah-langkah: 
1) Mendefinisikan Model Produk
Membuat kelas ProductEntry di Flutter yang memetakan field produk (Nama, Harga, Stok) dari Django. Menuliskan factory constructor fromJson() untuk mengubah JSON yang diterima menjadi objek Dart.Menuliskan method toJson() untuk mengemas objek Dart menjadi JSON saat mengirim data form.
2. Menyiapkan Lingkungan Konektivitas
Menginstal package provider, pbp_django_auth, dan http di proyek Flutter Anda. Tambahkan izin internet pada AndroidManifest.xml Android. Mengonfigurasi Django: Izinkan host 10.0.2.2 dan Aktifkan CORS. Menyediakan CookieRequest melalui widget Provider di root aplikasi untuk mempertahankan cookie sesi di seluruh aplikasi.
3. Melaksanakan Mekanisme Autentikasi
Membuat endpoint login, register, dan logout di Django. Menggunakan request.login() di Flutter saat tombol login ditekan; simpanlah cookie sesi secara otomatis. Mengarahkan pengguna ke halaman utama (menu) setelah login berhasil. Menggunakan request.logout() untuk menghapus sesi server dan cookie klien, kemudian navigasikan kembali ke halaman login.
4. Mengambil dan Menampilkan Data
Menuliskan fungsi fetchProducts() yang memanggil request.get() ke endpoint JSON produk Django. Ubah hasil respons JSON menjadi daftar List<ProductEntry>. Menampilkan data produk menggunakan FutureBuilder yang memproses hasil dari fetchProducts().Mengimplementasikan view proxy di Django dan gunakan URL proxy tersebut di Flutter untuk menampilkan gambar thumbnail produk.
5. Mengirim Data Formulir
Menggunakan request.postJson() di halaman form tambah produk baru.
Mengirimkan data form (setelah di-encode ke JSON) ke endpoint create-flutter/ Django. Memastikan view create-flutter Django memproses data JSON, membuat objek Product, dan menyimpannya di database.