# Portfolio Website - Syawe Manisha P. Siregar


## Tampilan Setiap Section / Fitur

### Navbar
Navigasi di bagian atas halaman berisi link ke Home, About Me, dan Certificates SEBAHAI menu di tampilan mobile. Nama di navbar diambil dinamis dari database tabel `profil`.


<img width="2783" height="157" alt="image" src="https://github.com/user-attachments/assets/36682b45-66a8-4364-8929-36459cf2d115" />


### Section Home
Berisi foto profil, nama, tagline, deskripsi singkat, dan dua tombol CTA. Semua data diambil dari tabel `profil` di database.

<img width="2736" height="825" alt="image" src="https://github.com/user-attachments/assets/fceb4918-3894-4f86-8967-4979139a37be" />


### Section About Me
Berisi foto, bio diri, skills dengan progress bar, dan daftar pengalaman. Skills diambil dari tabel `skills`, pengalaman dari tabel `pengalaman`.

<img width="2678" height="1116" alt="image" src="https://github.com/user-attachments/assets/39d5cdc2-1acf-4f99-97fe-66dd28dbc9da" />

### Section Certificates
Berisi 3 kartu sertifikat asli dalam layout grid. Setiap card menampilkan foto sertifikat, judul, penerbit, tahun, deskripsi, dan tombol lihat sertifikat. Data diambil dari tabel `sertifikat`.

<img width="2720" height="1147" alt="image" src="https://github.com/user-attachments/assets/16152ba9-dfb2-4534-8bf4-9179c853e40b" />

---

## Penjelasan Code Setiap Section / Fitur

### koneksi.php
```php
$koneksi = mysqli_connect("localhost", "root", "", "portfolio");
```
File ini bertugas menghubungkan website ke database MySQL. Di-include ke `index.php` menggunakan `require_once`.

### Navbar (dinamis)
```php
<a class="navbar-brand" href="#home">
  <?php echo $profil['nama']; ?>
</a>
```
Nama di navbar diambil dari hasil query tabel `profil` menggunakan `mysqli_fetch_assoc()`.

## Penjelasan style.css

### Body (Dasar Halaman)
```css
body {
  font-family: Arial, sans-serif;
  background-color: #ffffff;
  color: #333333;
}
```
- `font-family` — mengatur font seluruh halaman menjadi Arial
- `background-color: #ffffff` — background halaman putih
- `color: #333333` — warna teks default abu-abu gelap

---

### Navbar
```css
.navbar-brand {
  font-weight: bold;
  color: #7040d4 !important;
}
.nav-link:hover {
  color: #7040d4 !important;
}
```
- `.navbar-brand` — membuat nama di navbar tebal dan berwarna ungu
- `.nav-link:hover` — saat link navbar di-hover, warnanya berubah jadi ungu
- `!important` — memaksa warna ini menimpa warna bawaan Bootstrap

---

### Tombol Custom
```css
.btn-ungu {
  background-color: #7040d4;
  color: white;
  border: none;
  border-radius: 5px;
  padding: 8px 20px;
}
.btn-ungu:hover {
  background-color: #5930b0;
  color: white;
}
```
- `.btn-ungu` — tombol dengan background ungu, teks putih, sudut membulat
- `padding: 8px 20px` — jarak dalam tombol (atas-bawah 8px, kiri-kanan 20px)
- `.btn-ungu:hover` — saat tombol di-hover, warna ungu menjadi lebih gelap

```css
.btn-outline-ungu {
  background-color: transparent;
  color: #7040d4;
  border: 2px solid #7040d4;
  border-radius: 5px;
  padding: 8px 20px;
}
.btn-outline-ungu:hover {
  background-color: #7040d4;
  color: white;
}
```
- `.btn-outline-ungu` — tombol transparan dengan border ungu dan teks ungu
- `.btn-outline-ungu:hover` — saat di-hover, background berubah jadi ungu dan teks jadi putih


### Section Home (dinamis)
```php
$query_profil = mysqli_query($koneksi, "SELECT * FROM profil LIMIT 1");
$profil       = mysqli_fetch_assoc($query_profil);
```
```html
<h1><?php echo $profil['nama']; ?></h1>
<p><?php echo $profil['tagline']; ?></p>
<p><?php echo $profil['deskripsi']; ?></p>
```
Data nama, tagline, dan deskripsi diambil dari tabel `profil` di database lalu dicetak ke HTML menggunakan `echo`.

### Section About Me - Skills (dinamis)
```php
$query_skills = mysqli_query($koneksi, "SELECT * FROM skills");
```
```php
<?php while ($skill = mysqli_fetch_assoc($query_skills)) : ?>
  <p><?php echo $skill['nama_skill']; ?></p>
  <div class="progress">
    <div class="progress-bar"
      style="width: <?php echo $skill['level']; ?>%;">
      <?php echo $skill['level']; ?>%
    </div>
  </div>
<?php endwhile; ?>
```
Menggunakan `while` loop untuk menampilkan semua data skills dari tabel `skills`. Lebar progress bar diisi otomatis dari kolom `level`.

### Section About Me - Pengalaman (dinamis)
```php
$query_pengalaman = mysqli_query($koneksi, "SELECT * FROM pengalaman");
```
```php
<?php while ($exp = mysqli_fetch_assoc($query_pengalaman)) : ?>
  <li>
    <strong><?php echo $exp['tahun']; ?></strong>
    — <?php echo $exp['posisi']; ?> di <?php echo $exp['tempat']; ?>
  </li>
<?php endwhile; ?>
```
Data pengalaman organisasi/kegiatan diambil dari tabel `pengalaman` dan ditampilkan dalam bentuk list.

### Section Certificates (dinamis)
```php
$query_sertifikat = mysqli_query($koneksi, "SELECT * FROM sertifikat");
```
```php
<?php while ($cert = mysqli_fetch_assoc($query_sertifikat)) : ?>
  <div class="col-12 col-sm-6 col-lg-4 d-flex">
    <div class="card h-100 w-100 shadow-sm">
      <img src="<?php echo $cert['file_url']; ?>"
           class="card-img-top" style="height:180px; object-fit:cover;">
      <div class="card-body d-flex flex-column">
        <h5><?php echo $cert['judul']; ?></h5>
        <p><small><?php echo $cert['penerbit']; ?> · <?php echo $cert['tahun']; ?></small></p>
        <p><?php echo $cert['deskripsi']; ?></p>
        <a href="<?php echo $cert['file_url']; ?>" class="btn btn-ungu mt-3">Lihat Sertifikat</a>
      </div>
    </div>
  </div>
<?php endwhile; ?>
```
Data sertifikat diambil dari tabel `sertifikat`. Foto sertifikat ditampilkan di atas card menggunakan kolom `file_url` yang berisi path ke folder `assets/`.

---

## Struktur Database

| Tabel | Kolom | Keterangan |
|---|---|---|
| `profil` | id, nama, tagline, deskripsi, bio, foto | Data untuk section Home & About Me |
| `skills` | id, nama_skill, level | Data progress bar skills |
| `pengalaman` | id, tahun, posisi, tempat | Data list pengalaman |
| `sertifikat` | id, judul, penerbit, tahun, deskripsi, file_url | Data card sertifikat |

---

## Teknologi yang Digunakan

| Teknologi | Kegunaan |
|---|---|
| HTML5 | Struktur halaman |
| CSS3 | Styling custom (warna, layout, font) |
| PHP | Mengambil data dari database dan menampilkan ke HTML |
| MySQL | Menyimpan data profil, skills, pengalaman, sertifikat |
| Bootstrap 5 | Navbar, grid system, card, progress bar, responsive design |
