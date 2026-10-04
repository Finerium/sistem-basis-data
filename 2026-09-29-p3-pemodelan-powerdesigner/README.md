# P3 Pemodelan Data Aplikasi Perpustakaan Kampus (PowerDesigner)

Tugas praktikum P3 Sistem Basis Data: membangun CDM, LDM, dan PDM (PostgreSQL) untuk Aplikasi Perpustakaan
Kampus dari ERD kelompok, lalu menghasilkan skrip DDL. Dikerjakan individu. Deadline Minggu 4 Oktober 2026 23.59 (Teams).

## Isi folder

```
Tugas_P3_2B_048.zip   berkas yang dikumpulkan (isi: .cdm, .ldm, .pdm, .sql, .pdf)
Tugas_P3_2B_048.pdf   laporan 37 halaman
Tugas_P3_2B_048.cdm   Conceptual Data Model, 19 entitas, 28 relasi, 20 domain, 40 business rule
Tugas_P3_2B_048.ldm   Logical Data Model, foreign identifier hasil migrasi relasi
Tugas_P3_2B_048.pdm   Physical Data Model untuk PostgreSQL
Tugas_P3_2B_048.sql   DDL PostgreSQL (19 tabel, 28 foreign key, CHECK, unique, 4 partial unique index)
gambar/               diagram CDM, LDM, PDM (lengkap dan per bagian) dengan notasi PowerDesigner
```

## Catatan pengerjaan

PowerDesigner hanya jalan di Windows, sedangkan laptop yang dipakai MacBook Apple Silicon. Instalasi Windows 11 ARM
di UTM dan pendaftaran trial PowerDesigner tidak selesai sebelum deadline. Karena itu model ditulis sekali sebagai
spesifikasi, lalu dari spesifikasi yang sama dibangkitkan berkas model berformat XML PowerDesigner, diagram dengan
notasi PowerDesigner (Graphviz), dan DDL PostgreSQL. Berkas .cdm, .ldm, dan .pdm belum pernah dibuka di
PowerDesigner asli, ini dicatat juga di Open Issue laporan.

DDL sudah diuji di PostgreSQL 18.6 (Ubuntu 26.04 di OrbStack): 19 tabel terbentuk, 10 skenario sah diterima, dan 32
percobaan pelanggaran business rule ditolak oleh constraint yang tepat.
