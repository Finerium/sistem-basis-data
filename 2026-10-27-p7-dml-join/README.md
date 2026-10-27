# P7 DML: Join Tables

Tugas praktikum Pertemuan 7 dari Pak Djoko (Teams "[2B] P7 DML - JOIN Tables"). Deadline Selasa 3 November 2026
23.59 (Teams), multiple submissions.

## Isi folder

```
Tugas_P7_2B_048.pdf    lembar jawaban (format template P6.2 dari dosen, 43 halaman)
Tugas_P7_2B_048.docx   versi Word dari lembar jawaban
```

## Isi lembar jawaban

Schema HR yang sudah diimport di Praktikum 6 (database `hr`) dipakai lagi. Materi slide Pertemuan 7 dipraktikkan urut
dalam 42 latihan:

| Latihan | Bagian slide |
|---|---|
| 1 sampai 4 | masuk database hr, hapus data percobaan P6 (996 sampai 999), jumlah baris tiap tabel, tabel employees dan departments |
| 5 sampai 11 | join dengan WHERE (Cartesian product 2889 baris, tanpa dan dengan alias, urutan dibalik) dan 3 pertanyaan diskusi |
| 12 sampai 16 | INNER JOIN, perbandingan waktu dengan EXPLAIN ANALYZE, USING, NATURAL JOIN (32 baris) |
| 17 sampai 25 | LEFT JOIN (122 baris), outer join Oracle `(+)`, RIGHT JOIN (107), FULL JOIN (123) |
| 26 sampai 30 | join tiga tabel dan self join (pegawai dan atasannya) |
| 31 sampai 36 | UNION, UNION ALL, INTERSECT, EXCEPT (pengganti MINUS), UNION versus JOIN |
| 37 sampai 42 | join dengan fungsi bawaan, perangkap ORDER BY kolom teks, GROUP BY, ilustrasi tab1 dan tab2 |

Syntax Oracle di slide disesuaikan ke PostgreSQL: `(+)` jadi `LEFT JOIN`, `MINUS` jadi `EXCEPT`, `CONCAT` bersarang,
format `Day` jadi `FMDay`, dan `L999,999.99` jadi `'Rp' || TO_CHAR(...)`. Syntax `(+)` dan `MINUS` dicoba dulu apa
adanya supaya error PostgreSQL-nya kelihatan.

Catatan dari hasil percobaan: saran slide `COALESCE(CONCAT(m.first_name, ' ', m.last_name), '-')` di PostgreSQL tidak
menghasilkan `-`, karena `CONCAT` menganggap NULL sebagai string kosong dan hasilnya satu spasi. Yang berhasil
`COALESCE(m.first_name || ' ' || m.last_name, '-')`.

## Screenshot

Semua query dijalankan di PostgreSQL 18.6 lewat psql (27 Oktober 2026). Ada 42 screenshot layar penuh dengan jam di
menu bar, satu per latihan. Hasil yang lebih panjang dari satu layar difoto dengan layar digulung ke atas, supaya query
dan baris awal hasilnya kelihatan (Pak Djoko membolehkan output tampil sebagian asal syntax kelihatan utuh).
