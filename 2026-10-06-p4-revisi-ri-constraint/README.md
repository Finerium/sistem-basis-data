# P4 Rev Tugas Pemodelan Data dan Referential Integrity Constraint

Revisi Tugas P3 (model data Aplikasi Perpustakaan Kampus) ditambah referential integrity constraint untuk setiap
relationship di PDM dan indexing. Dikerjakan individu. Deadline Senin 12 Oktober 2026 23.59 (Teams).

## Isi folder

```
Tugas_P4_2B_048.zip   berkas yang dikumpulkan (isi: .pdf, .cdm, .ldm, .pdm, .sql)
Tugas_P4_2B_048.pdf   laporan 50 halaman
Tugas_P4_2B_048.cdm   Conceptual Data Model, 19 entitas, 28 relasi bernama jelas, 23 domain, 42 business rule
Tugas_P4_2B_048.ldm   Logical Data Model
Tugas_P4_2B_048.pdm   Physical Data Model PostgreSQL, integritas referensial per reference, 24 index
Tugas_P4_2B_048.sql   DDL PostgreSQL (19 tabel, 28 foreign key dengan aksi RI, 27 index tambahan)
gambar/               diagram CDM, LDM, PDM (lengkap dan per bagian) dan peta aksi ON DELETE
```

## Yang direvisi dari P3

| Bagian | P3 | P4 |
|---|---|---|
| Nama relasi | R01 sampai R28, fk_buku_r01 | nama kerja (menerbitkan, dikenai denda), fk_<anak>_<induk> |
| Check Model | belum diperiksa: 87 error, 31 peringatan | 0 error, 0 peringatan (skrip `draf/cek_model.py`) |
| ERD dan business rule | Telepon Anggota dan 6 relasi tanpa business rule | BR31 baru, BR13/16/17/24/29 dilengkapi, matriks relasi-BR |
| Referential integrity | semua RESTRICT | 17 RESTRICT, 6 CASCADE, 3 SET NULL, 1 SET DEFAULT, 1 NO ACTION; ON UPDATE CASCADE |
| Indexing | hanya PK, unique, partial unique | + 21 index foreign key dan 6 index query (3 partial) |
| Kategori default | tidak ada | kategori 000 Karya Umum (id 0) sebagai tujuan SET DEFAULT |
| Atribut dan domain | `berlaku_sampai` dan nama `Judul` dobel, 3 data item menyimpang dari domain | `masa_aktif_sampai`, `Judul Notifikasi`, 3 domain baru |
| Business rule | BR27 hanya RESTRICT | BR27 ditulis ulang, BR29 + NO ACTION, BR30 baru (ON UPDATE) |
| Diagram | diagram lengkap diputar, huruf kecil | halaman landscape, PDM menampilkan key dan index, peta aksi RI |

## Catatan pengerjaan

DDL diuji di PostgreSQL 18.6: 42 uji constraint dari P3 tetap lolos dan 17 uji referential integrity baru (cascade,
restrict berantai, set null yang ditahan CHECK, set default, no action, on update cascade) berjalan sesuai rancangan.

Tiga masukan dosen di Pertemuan 4 (lewat teman sekelas): nama relasi harus jelas, model diperiksa dengan Check
Model lalu error-nya diperbaiki, dan ERD disesuaikan lagi dengan business rule. Ketiganya dibahas di BAB II dan III.
