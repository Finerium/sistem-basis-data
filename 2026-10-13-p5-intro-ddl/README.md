# P5 Introduction to Data Definition Language

Tugas praktikum Pertemuan 5 dari Pak Djoko (Teams "[2B] P5 Introduction to Data Definition Language"). Kerjakan
syntax di pgtutorial.com Section 1 (Getting Started) dan Section 3 (Working with Tables) secara urut, sertakan syntax
dalam bentuk teks dan screenshot layar penuh yang menampilkan jam. Deadline Kamis 15 Oktober 2026 23.59 (Teams),
multiple submissions.

## Isi folder

```
P5_2B_048.pdf    lembar jawaban yang dikumpulkan (template dosen, 29 halaman)
P5_2B_048.docx   versi Word dari lembar jawaban yang sama
```

## Isi lembar jawaban

Satu latihan untuk satu halaman materi, urut sesuai pgtutorial.com:

| No | Materi | Isi |
|---|---|---|
| 1 | What is PostgreSQL | masuk psql, `SELECT version()`, buat database `inventory_db` |
| 2 | Creating a new table | `CREATE TABLE inventories`, `\d inventories` |
| 3 | Inserting data into a table | insert satu baris, banyak baris, `RETURNING *` |
| 4 | Selecting data from a table | `SELECT *`, kolom tertentu, kolom hitungan, alias |
| 5 | Concatenating strings | `\|\|`, `CONCAT`, `CONCAT_WS` |
| 6 | Dropping a table | `DROP TABLE IF EXISTS categories` |
| 7 | Database design | tidak ada syntax (perancangan tabel dan relasi) |
| 8 | Primary key | identity primary key, composite primary key |
| 9 | NOT NULL constraint | perbandingan NULL, insert NULL, pelanggaran NOT NULL |
| 10 | DEFAULT constraint | default nilai pajak, `DEFAULT CURRENT_TIMESTAMP` |
| 11 | CHECK constraint | constraint kolom, `ADD CONSTRAINT`, `DROP CONSTRAINT` |
| 12 | UNIQUE constraint | unique satu kolom, dua kolom, dan NULL |
| 13 | Foreign key | foreign key, `DROP ... CASCADE`, ON DELETE SET NULL / CASCADE / SET DEFAULT |

Query dijalankan di PostgreSQL 18.6 lewat psql, 30 screenshot layar penuh dengan jam di menu bar (13 Oktober 2026).
Tabel `brands` dan `products` dibuat di lebih dari satu materi, jadi sebelum materi UNIQUE dan Foreign key ditambah
`DROP TABLE IF EXISTS` supaya bisa dibuat ulang. Hal ini juga ditulis di keterangan latihannya.

Nama berkas mengikuti instruksi di Teams (`P5_2B_048.pdf`). Contoh di template memakai nama dosen di belakangnya,
contoh di Teams tidak.
