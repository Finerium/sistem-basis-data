# Sistem Basis Data

Sarjana Terapan Teknik Informatika, Jurusan Teknik Komputer dan Informatika,
Politeknik Negeri Bandung. Semester Ganjil 2026/2027.

- Nama  : Ghaisan Khoirul Badruzaman
- NIM   : 251524048
- Kelas : 2B-D4

## Jadwal

| Jenis | Waktu | Ruang | Dosen |
|---|---|---|---|
| Praktikum | Selasa 13.00 - 16.30 | D107 Lab. RPL | Djoko Cahyo Utomo L, S.Kom., M.MT. |
| Teori | Senin 10.40 - 12.20 | D111 | Dr. Ade Chandra Nugraha, S.Si., M.T. |

Mulai 21 September 2026 teori pindah dari Jumat 08.40 (D217) ke Senin jam ke-5 sampai ke-6,
yaitu 10.40 - 12.20, ruang D111.

Beban 4 SKS: 2 SKS teori (2 x 50 menit terjadwal, 2 x 50 menit tugas terstruktur,
2 x 60 menit eksplorasi mandiri) dan 2 SKS praktik (2 x 160 menit terjadwal).

Buku acuan teori: Silberschatz, Korth, Sudarshan, *Database System Concepts*.

## Progres

| Tugas | Diberikan | Deadline | Status |
|---|---|---|---|
| [P1 Latihan File I/O (Python)](2026-09-09-p1-latihan-file-io-python/) | Rabu 9 Sep 2026 | Minggu 20 Sep 2026 23.59 (Teams) | selesai, output 32/32 sel cocok acuan |
| [P2 Latihan Indexing (Python)](2026-09-22-p2-latihan-indexing/) | Selasa 22 Sep 2026 | Selasa 22 Sep 2026 17.30 (Teams) | selesai, output 10/10 sel cocok acuan (sel mount Google Drive sengaja beda), plus pengayaan analisis index dan B+Tree |
| [P3 Pemodelan Data dengan PowerDesigner](2026-09-29-p3-pemodelan-powerdesigner/) | Selasa 29 Sep 2026 | Minggu 4 Okt 2026 23.59 (Teams) | selesai, CDM/LDM/PDM format PowerDesigner + DDL PostgreSQL teruji 42/42, laporan 37 halaman |
| [P4 Rev Pemodelan Data dan Referential Integrity](2026-10-06-p4-revisi-ri-constraint/) | Selasa 6 Okt 2026 | Senin 12 Okt 2026 23.59 (Teams) | selesai, revisi P3 (nama relasi jelas, check model 87 error jadi 0, ERD sesuai business rule) + aksi RI per relasi + 27 index, uji 42 constraint dan 17 RI lolos, laporan 41 halaman |
| [P5 Introduction to Data Definition Language](2026-10-13-p5-intro-ddl/) | Selasa 13 Okt 2026 | Kamis 15 Okt 2026 23.59 (Teams) | selesai, pgtutorial.com Section 1 dan 3 (13 latihan) dijalankan di PostgreSQL 18.6, 30 screenshot layar penuh, lembar jawaban 29 halaman |
| [Teori 6 Latihan Aljabar Relasional](2026-10-15-teori-6-latihan-aljabar-relasional/) | Kamis 15 Okt 2026 | Jumat 16 Okt 2026 11.00 (tulis tangan, di meja dosen) | jawaban 8 soal sudah jadi (1 halaman PDF), tinggal disalin tulis tangan |
| [P6.1 Integrity Constraint dan P6.2 Introduction to DML](2026-10-20-p6-dml-integrity/) | Selasa 20 Okt 2026 | Senin 26 Okt 2026 23.59 (Teams) | selesai, P6.1 laporan 11 halaman (7 business rules, 6 percobaan INSERT dan UPDATE semuanya berhasil), P6.2 schema HR + 61 latihan slide + 3 pertanyaan di PostgreSQL 18.6, 76 screenshot layar penuh, lembar jawaban 68 halaman |
| [P7 DML: Join Tables](2026-10-27-p7-dml-join/) | Selasa 27 Okt 2026 | Selasa 3 Nov 2026 23.59 (Teams) | selesai, materi slide join (WHERE, INNER, LEFT, RIGHT, FULL, tiga tabel, self join, UNION, INTERSECT, EXCEPT, GROUP BY) dalam 42 latihan di PostgreSQL 18.6, 42 screenshot layar penuh, lembar jawaban 43 halaman |

## Pertemuan teori

| Pertemuan | Tanggal | Materi | Catatan |
|---|---|---|---|
| Teori 1 | Jumat 11 Sep 2026 | Chapter 1 Introduction, file system dibanding DBMS, pembagian 4 SKS | foto papan dan slide disimpan lokal |
| Teori 2 | Jumat 18 Sep 2026 | Model data relasional, 3 lapisan abstraksi, data storage dan indexing (dense, sparse, multi-level, m-way tree, B-tree, B+ tree) | [`catatan.md`](2026-09-18-pertemuan-2/catatan.md), tidak ada tugas yang disebut |
| Teori 6 | materi dikirim Kamis 15 Okt 2026 | Topik 3 Relational Model (Connolly dan Begg) dan modul DBUT-4 Relational: aljabar relasional, kalkulus relasional, SQL | latihan slide 94 dikerjakan tulis tangan, lihat [folder tugas](2026-10-15-teori-6-latihan-aljabar-relasional/) |

## P2 Latihan Indexing (Python)

Latihan menyimpan 200 record mahasiswa ke block berisi 10 record, lalu membuat tiga jenis index untuk
mempercepat pencarian berdasarkan NIM: dense index (satu entry per record), sparse index (satu entry per
block), dan B-Tree dengan t = 3.

```
2026-09-22-p2-latihan-indexing/
  Tugas_P2_2B_048.ipynb   notebook yang dikumpulkan, sudah dieksekusi
  mahasiswa.csv           dataset 200 mahasiswa (NIM, Nama, Nilai) dari dosen
```

Sama seperti P1, notebook dijalankan lokal, bukan di Google Colab, jadi mount Google Drive dikomentari dan
`csv_path` menunjuk ke folder notebook. Output setiap sel lain sama persis dengan output acuan di template
dosen, termasuk traversal B-Tree 98 node.

Hal yang ditiru dari output acuan: position di B-Tree disimpan sebagai (nomor block, index baris di data),
bukan index di dalam block seperti yang tertulis di komentar template, dan traversal dicetak preorder dengan
indentasi tiga spasi per level.

Di akhir notebook ada dua bagian pengayaan (opsional di intro dosen, ketiga pilihan yang ditawarkan dikerjakan):

- Analisis pencarian tanpa dan dengan index, ditambah data 20.000 record buatan: jumlah perbandingan NIM untuk
  full scan, dense index, sparse index (scan linear dan binary search), dan B-Tree. Tanpa index rata-rata
  10.000,50 perbandingan untuk 20.000 record, dengan index yang dicari secara efisien hanya sekitar 13 sampai 16.
- Implementasi B+Tree (key pemisah di node internal, leaf berantai, pencarian rentang), dicek kebenarannya dan
  dibandingkan dengan B-Tree untuk NIM yang dimasukkan terurut maupun acak. B+Tree membaca lebih sedikit node untuk
  pencarian rentang, tetapi sebagian besar selisihnya datang dari aturan pemecahan node, bukan hanya strukturnya.

## P1 Latihan File I/O (Python)

Latihan membaca, mencari, menambah, mengubah, dan menghapus data pada berkas CSV
skema HR Oracle, sebelum masuk ke DBMS. Aturannya hanya boleh memakai modul `csv`.

```
2026-09-09-p1-latihan-file-io-python/
  Tugas_P1_2B_048.ipynb   notebook yang dikumpulkan, sudah dieksekusi
  oracle-hr-csv/          7 berkas CSV (employees, departments, jobs, dll)
```

Notebook ini dijalankan lokal di Jupyter VS Code, bukan di Google Colab, jadi
`csv_path` menunjuk ke folder `oracle-hr-csv/` yang bersebelahan dengan notebook.

Sel insert, update, dan delete mengubah `countries.csv`. Jadi kalau mau menjalankan
ulang dan mendapat output yang sama, pakai salinan CSV yang masih asli.

Catatan kecil yang ditiru dari output acuan dosen: pesan pencarian memakai ejaan
`Founded`, dan `delete_file` mencetak `Updated 1 line.`
