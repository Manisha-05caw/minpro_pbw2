<?php
require_once 'koneksi.php';
$query_profil = mysqli_query($koneksi, "SELECT * FROM profil LIMIT 1");
$profil       = mysqli_fetch_assoc($query_profil);
$query_skills = mysqli_query($koneksi, "SELECT * FROM skills");
$query_pengalaman = mysqli_query($koneksi, "SELECT * FROM pengalaman");
$query_sertifikat = mysqli_query($koneksi, "SELECT * FROM sertifikat");
?>
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Portfolio - <?php echo $profil['nama']; ?></title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

  <link rel="stylesheet" href="style.css">
</head>
<body>

  <nav class="navbar navbar-expand-lg bg-body-tertiary sticky-top">
    <div class="container">
      <a class="navbar-brand" href="#home"><?php echo $profil['nama']; ?></a>
      <button class="navbar-toggler" type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav"
        aria-controls="navbarNav"
        aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="#home">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#about">About Me</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#certificates">Certificates</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>


  <section id="home" class="text-center py-5 section-home">
    <div class="container">

      <img
        src="<?php echo $profil['foto']; ?>"
        alt="Foto Profil"
        class="foto-profil rounded-circle mb-4"
      >

      <h1 class="fw-bold"><?php echo $profil['nama']; ?></h1>
      <p class="fs-5 text-secondary"><?php echo $profil['tagline']; ?></p>
      <p class="text-secondary mx-auto" style="max-width: 500px;">
        <?php echo $profil['deskripsi']; ?>
      </p>

      <div class="mt-4">
        <a href="#about" class="btn btn-ungu me-2">Tentang Saya</a>
        <a href="#certificates" class="btn btn-outline-ungu">Sertifikat</a>
      </div>

    </div>
  </section>

  <section id="about" class="py-5 section-about">
    <div class="container">

      <h2 class="text-center mb-5">About Me</h2>

      <div class="row align-items-center mb-5 g-4">
        <div class="col-12 col-md-4 text-center">
          <img
            src="<?php echo $profil['foto']; ?>"
            alt="Foto About"
            class="img-fluid rounded-3"
            style="max-width: 250px;"
          >
        </div>
        <div class="col-12 col-md-8">
          <h4>Perkenalkan saya <?php echo $profil['nama']; ?> 👋</h4>
          <p class="text-secondary">
            <?php echo $profil['bio']; ?>
          </p>
        </div>
      </div>

      <h4 class="mb-3">Skills</h4>

      <?php while ($skill = mysqli_fetch_assoc($query_skills)) : ?>
        <p class="mb-1"><?php echo $skill['nama_skill']; ?></p>
        <div class="progress mb-3">
          <div class="progress-bar"
            role="progressbar"
            style="width: <?php echo $skill['level']; ?>%;"
            aria-valuenow="<?php echo $skill['level']; ?>"
            aria-valuemin="0"
            aria-valuemax="100">
            <?php echo $skill['level']; ?>%
          </div>
        </div>
      <?php endwhile; ?>

      <h4 class="mt-5 mb-3">Pengalaman</h4>
      <ul>
        <?php while ($exp = mysqli_fetch_assoc($query_pengalaman)) : ?>
          <li class="mb-2">
            <strong><?php echo $exp['tahun']; ?></strong>
            — <?php echo $exp['posisi']; ?> di <?php echo $exp['tempat']; ?>
          </li>
        <?php endwhile; ?>
      </ul>

    </div>
  </section>

  <section id="certificates" class="py-5 section-cert">
    <div class="container">

      <h2 class="text-center mb-5">Certificates</h2>

      <div class="row g-4">

        <?php while ($cert = mysqli_fetch_assoc($query_sertifikat)) : ?>
          <div class="col-12 col-sm-6 col-lg-4 d-flex">
            <div class="card h-100 w-100 shadow-sm">
              <img
                src="<?php echo $cert['file_url']; ?>"
                alt="<?php echo $cert['judul']; ?>"
                class="card-img-top"
                style="height: 180px; object-fit: cover;"
              >
              <div class="card-body d-flex flex-column">
                <h5 class="card-title"><?php echo $cert['judul']; ?></h5>
                <p class="card-text text-secondary flex-grow-1">
                  <small><?php echo $cert['penerbit']; ?> · <?php echo $cert['tahun']; ?></small><br>
                  <?php echo $cert['deskripsi']; ?>
                </p>
                <a href="<?php echo $cert['file_url']; ?>" class="btn btn-ungu mt-3" target="_blank">Lihat Sertifikat</a>
              </div>
            </div>
          </div>
        <?php endwhile; ?>

      </div>
    </div>
  </section>

 
  <footer class="text-center py-3 foot