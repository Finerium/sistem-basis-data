# P9.1 Latihan DML dan P9.2 Introduction to PL/SQL

Dua tugas praktikum Pertemuan 9 dari Pak Djoko (Teams): "[2B] P9.1 DML - Latihan Tambahan DML" dengan deadline Rabu
4 November 2026 23.59, dan "[2B] P9.2 - Introduction to PL/SQL" dengan deadline Minggu 8 November 2026 23.59. Keduanya
multiple submissions.

## Isi folder

```
T9.1_2B_048.pdf    lembar jawaban P9.1 (template dosen, 15 halaman)
T9.1_2B_048.docx   template P9.1 yang sudah diisi
T9.2_2B_048.pdf    lembar jawaban P9.2 (template dosen, 13 halaman)
T9.2_2B_048.docx   template P9.2 yang sudah diisi
```

## P9.1 Latihan DML

Sepuluh soal query di schema HR (database `hr`), semuanya dijalankan di PostgreSQL 18.6:

| Latihan | Isi | Hasil |
|---|---|---|
| 1 | manager (punya bawahan) yang bukan manager tertinggi | 17 baris |
| 2 | employee dengan departemen, kota, negara, region (LEFT JOIN berantai) | 107 baris |
| 3 | total pendapatan = salary + salary x COALESCE(commission_pct, 0) | 107 baris |
| 4 | nama lengkap dan email + `@polban.ac.id` | 107 baris |
| 5 | nama employee dan managernya (self join), masa kerja lebih dari 3 tahun | 106 baris |
| 6 | jenis pekerjaan tanpa duplikasi (DISTINCT) | 19 jenis |
| 7 | department 50 yang tidak dipimpin manager 100 (`IS DISTINCT FROM`) | 40 baris |
| 8 | atasan dengan minimal 5 bawahan, rasio rata gaji bawahan terhadap gaji atasan dan kategorinya | 14 atasan |
| 9 | laporan anomali empat jenis temuan dengan UNION ALL | 35 temuan |
| 10 | riwayat job_history dibanding posisi sekarang dan jenis perpindahannya | 10 baris |

## P9.2 Introduction to PL/SQL

Schema HR di database `hr` (sama dengan P6 dan P7) dipakai lagi. Tiga soal dikerjakan dengan blok anonim `DO $$ ... $$`
PL/pgSQL di PostgreSQL 18.6:

| Soal | Isi | Hasil |
|---|---|---|
| 1a | `take_home_pay` = `COALESCE(salary * commission_pct, salary)` disimpan ke variabel lalu `RAISE NOTICE` | ID 120 = 8000, percobaan tambahan ID 145 = 5600 |
| 1b | Outer Block dengan Inner Block #1 dan #2 yang sejajar, nama variabel sama persis, satu query per blok (`ARRAY_AGG ... ORDER BY` bersama `MIN`/`MAX`) | TJ Olson 2.100 dan Steven King 24.000; tanpa President/VP: John Russell 14.000; tanpa Clerk: Diana Lorentz 4.200; outer tetap TJ Olson dan Steven King |
| 2 | seluruh employee ditampung ke variabel `employees[]` lalu `FOREACH ... LOOP` | 107 baris |
| 3 | sama dengan soal 2 ditambah `IF salary >= 10000 AND job_id <> 'ST_CLERK' ... ELSE` | 19 ditampilkan, 88 dilewati, cocok dengan `COUNT(*)` |

Soal 1b sekaligus menunjukkan scope variabel: variabel di inner block bernilai NULL sebelum diisi walaupun namanya sama
dengan variabel outer (shadowing), dan isi variabel outer tidak berubah setelah inner block selesai.

## Screenshot

Semua query dan blok dijalankan lewat psql (3 November 2026), screenshot layar penuh dengan jam di menu bar. Untuk output yang
lebih panjang dari satu layar (P9.1 latihan 2, 3, 4, 5, 9 dan P9.2 soal 1b, 2) ada dua screenshot: syntax beserta awal output, lalu bagian akhir
output.
