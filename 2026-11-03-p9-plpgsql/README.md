# P9.2 Introduction to PL/SQL

Tugas praktikum Pertemuan 9.2 dari Pak Djoko (Teams "[2B] P9.2 - Introduction to PL/SQL"). Deadline Minggu 8 November
2026 23.59 (Teams), multiple submissions.

## Isi folder

```
T9.2_2B_048.pdf    lembar jawaban (template dosen, 13 halaman)
T9.2_2B_048.docx   template dosen yang sudah diisi
```

## Isi lembar jawaban

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

Semua blok dijalankan lewat psql (3 November 2026), screenshot layar penuh dengan jam di menu bar. Untuk output yang
lebih panjang dari satu layar (soal 1b dan soal 2) ada dua screenshot: syntax beserta awal output, lalu bagian akhir
output.
