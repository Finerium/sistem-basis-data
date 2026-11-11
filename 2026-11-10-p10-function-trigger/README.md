# P10.1 Function & Procedure dan P10.2 Trigger

Dua tugas praktikum Pertemuan 10 dari Pak Djoko (Teams): "[2B] P10.1 - Function & Procedure" dan "[2B] P10.2 - Trigger",
keduanya deadline Minggu 15 November 2026 23.59, multiple submissions. Semua query dijalankan di PostgreSQL 18.6.

## Isi folder

```
T10.1_2B_048.pdf    lembar jawaban P10.1 (template dosen, 21 halaman)
T10.1_2B_048.docx   template P10.1 yang sudah diisi
T10.2_2B_048.pdf    lembar jawaban P10.2 (template dosen, 20 halaman)
T10.2_2B_048.docx   template P10.2 yang sudah diisi
```

## P10.1 Function & Procedure (database `hr`)

| Soal | Isi |
|---|---|
| 1 | function `salary_grade` (S >= 13000, A >= 10000, B >= 7000, C >= 5000, D di bawahnya), dicek nilai batas dan jumlah per grade (6/13/28/11/49) |
| 2 | procedure `update_suffix_email` dan `restore_suffix_email`, aman dipanggil dua kali (panggilan kedua mengubah 0 baris) |
| 3 | 7 perbedaan function dan procedure, dibuktikan dengan CALL vs SELECT, COMMIT di procedure vs function, DROP FUNCTION vs DROP PROCEDURE |
| 4 | procedure `naikkan_gaji_department` memanggil procedure `naikkan_gaji_employee` (diuji lalu di-ROLLBACK), function `profil_employee` memanggil `nama_lengkap` dan `salary_grade` |
| 5 | procedure `cetak_grade_department` memanggil function, function `rata_gaji_department` memanggil procedure `hitung_gaji_department` lewat parameter INOUT |

Data HR tidak berubah setelah semua soal: email dikembalikan, kenaikan gaji di-ROLLBACK.

## P10.2 Trigger (database `pemesanan`)

| Soal | Isi |
|---|---|
| 1 | tabel `produk` dan `pesanan`, function `fn_update_stok()` dan trigger `trg_update_stok`, uji INSERT/UPDATE/DELETE, lalu contoh stok jadi minus (-5) |
| 2 | solusi CHECK (`stok >= 0`) dan solusi IF-ELSE + `RAISE EXCEPTION 'Stok tidak mencukupi'`, masing-masing diuji untuk INSERT, UPDATE, DELETE |
| 3 | trigger memanggil function (harus `RETURNS TRIGGER`); trigger tidak bisa memanggil procedure langsung (`EXECUTE PROCEDURE` tetap mencari function), tapi bisa lewat `CALL` di dalam function trigger |

Di flowchart soal 2 syaratnya `stok > jumlah`; yang dipakai `>=` supaya sama dengan aturan CHECK (stok boleh habis jadi 0).
