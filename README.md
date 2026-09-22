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
| [P2 Latihan Indexing (Python)](2026-09-22-p2-latihan-indexing/) | Selasa 22 Sep 2026 | Selasa 22 Sep 2026 17.30 (Teams) | selesai, output 10/10 sel cocok acuan (sel mount Google Drive sengaja beda) |

## Pertemuan teori

| Pertemuan | Tanggal | Materi | Catatan |
|---|---|---|---|
| Teori 1 | Jumat 11 Sep 2026 | Chapter 1 Introduction, file system dibanding DBMS, pembagian 4 SKS | foto papan dan slide disimpan lokal |
| Teori 2 | Jumat 18 Sep 2026 | Model data relasional, 3 lapisan abstraksi, data storage dan indexing (dense, sparse, multi-level, m-way tree, B-tree, B+ tree) | [`catatan.md`](2026-09-18-pertemuan-2/catatan.md), tidak ada tugas yang disebut |

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

Di akhir notebook ada bagian pengayaan (opsional di intro dosen): jumlah perbandingan NIM untuk full scan, dense
index, sparse index (scan linear dan binary search), dan B-Tree, dihitung pada 200 record dan 20.000 record
buatan. Hasilnya, tanpa index rata-rata 10.000,50 perbandingan untuk 20.000 record, sedangkan dengan index yang
dicari secara efisien hanya sekitar 13 sampai 16.

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
