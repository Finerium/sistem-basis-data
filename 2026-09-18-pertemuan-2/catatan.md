# Teori Pertemuan 2, Jumat 18 September 2026

Dosen Dr. Ade Chandra Nugraha, S.Si., M.T., ruang D217, 08.40 - 10.40. Ini pertemuan terakhir
di hari Jumat, mulai 21 September 2026 teori pindah ke Senin 10.40 - 12.20.

Foto papan tulis dan PDF materinya disimpan lokal di `materi/2026-09-18-pertemuan-2/`
(tidak ikut di-push). Tidak ada tugas yang disebut.

## Di papan tulis

- Program = algoritma + struktur data.
- Model data yang dipakai di mata kuliah ini adalah model relasional.
- Ada 3 lapisan abstraksi:
  - View level, digambarkan dengan E-R diagram
  - Logical level, isinya relational model beserta relational algebra dan relational calculus
  - Physical level, urusan teknologi penyimpanannya

## Materi P2: Data Storage, Data Structure, dan Indexing

Sumbernya posting Google Classroom "Sistem Basis Data 25/26 Ganjil" dari Muhammad Riza Alifi
(26 Agustus 2025), ditambah catatan Multi-way Trees dari
https://faculty.cs.niu.edu/~freedman/340/340notes/340multi.htm.

### Data storage

- Secondary storage seperti hard disk menyimpan file per block. Alamat block ditentukan
  dari nomor sector dan nomor track.
- DBMS menyimpan record tabel ke dalam block, dan bekerja sama dengan OS supaya
  penyimpanan ke disk efisien.

### Indexing

Tujuannya supaya data retrieval cepat.

| Jenis | Isi | Kelebihan dan kekurangan |
|---|---|---|
| Dense index | satu entry untuk setiap record | jumlah entry sama dengan jumlah record, jadi boros kalau tabelnya besar |
| Sparse index | satu entry untuk beberapa record, misalnya key 001 menunjuk record 001 sampai 005 | lebih hemat storage |

Keduanya termasuk ordered index, artinya record di tabel sudah urut berdasarkan search key.
Kalau index-nya sendiri sudah terlalu besar, index dipecah jadi beberapa tingkat
(multi-level index), dan bentuknya jadi tree.

### Struktur data untuk index

- **Binary search tree**: tiap langkah memotong setengah ruang pencarian, sama seperti
  binary search. Anaknya maksimal 2.
- **m-way search tree**: satu node bisa punya sampai m anak dan m - 1 key, key di dalam
  node urut naik. Contoh m = 5 berarti maksimal 5 anak dan 4 key. Masalahnya tree ini bisa
  tidak seimbang (skewed).
- **B-tree** order m, yaitu m-way search tree yang selalu seimbang:
  1. Root punya minimal 2 subtree, kecuali root itu satu-satunya node.
  2. Node selain root dan leaf punya maksimal m anak dan minimal m/2 anak.
  3. Jumlah key di node itu = jumlah anaknya - 1.
  4. Semua leaf ada di level yang sama.
- **B+ tree**: data pointer hanya disimpan di leaf. Ini yang dipakai mayoritas DBMS untuk indexing.

### Operasi di B-tree

- **Search**: mulai dari root, bandingkan dengan key di node untuk memilih pointer,
  turun terus sampai ketemu atau sampai leaf.
- **Insert**: key selalu masuk ke leaf.
  1. Leaf masih muat: tinggal disisipkan di posisi urutnya.
  2. Leaf penuh: leaf di-split jadi dua, key tengahnya naik ke parent.
  3. Root ikut penuh: root di-split dan key tengahnya jadi root baru. Jadi B-tree
     tumbuhnya ke atas, bukan di leaf.
- **Delete**:
  1. Dari leaf, dan leaf masih minimal setengah penuh: key sisanya digeser.
  2. Dari leaf tapi jadi underflow: pinjam dari sibling yang kelebihan key (key di-redistribusi
     lewat separator di parent). Kalau sibling juga pas-pasan, leaf digabung dengan sibling dan
     separator-nya. Kalau parent ikut underflow, proses yang sama diulang ke atas.
  3. Dari node non-leaf: key diganti predecessor atau successor-nya, lalu predecessor atau
     successor itu dihapus dari leaf.

### Bacaan lanjutan

Silberschatz, *Database System Concepts*, Chapter 14: Indexing.

## Catatan

Di posting Classroom tertulis "jika nilainya lebih kecil maka diarahkan ke bagian kanan, jika
nilainya lebih besar maka diarahkan ke bagian kiri". Itu kebalikan dari aturan BST yang biasa
(yang lebih kecil ke kiri, yang lebih besar ke kanan). Kalau keluar di kuis, pakai versi buku.
