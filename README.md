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

## Pertemuan teori

| Pertemuan | Tanggal | Materi | Catatan |
|---|---|---|---|
| Teori 1 | Jumat 11 Sep 2026 | Chapter 1 Introduction, file system dibanding DBMS, pembagian 4 SKS | foto papan dan slide disimpan lokal |
| Teori 2 | Jumat 18 Sep 2026 | Model data relasional, 3 lapisan abstraksi, data storage dan indexing (dense, sparse, multi-level, m-way tree, B-tree, B+ tree) | [`catatan.md`](2026-09-18-pertemuan-2/catatan.md), tidak ada tugas yang disebut |

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
