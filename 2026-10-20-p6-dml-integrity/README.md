# P6 Integrity Constraint dan Introduction to DML

Dua tugas praktikum Pertemuan 6 dari Pak Djoko (Teams "[2B] P6.1 Integrity Constraint" dan "[2B] P6.2 Introduction
to Data Manipulation Language"). Deadline keduanya Senin 26 Oktober 2026 23.59 (Teams), multiple submissions.

## Isi folder

```
Tugas_P6.1_2B_048.pdf    laporan P6.1 Integrity Constraint (11 halaman)
Tugas_P6.2_2B_048.pdf    lembar jawaban P6.2 Introduction to DML (template dosen, 68 halaman)
Tugas_P6.2_2B_048.docx   versi Word dari lembar jawaban P6.2
```

## P6.1 Integrity Constraint

Tabel `students` (student_id, first_name, last_name, email, gender, place_of_birth, date_of_birth, gpa) di
database `kampus`. Isi laporan:

1. Business rules BR01 sampai BR07 (NIM 9 digit, nama depan wajib, email wajib dan unik, gender, tempat dan tanggal
   lahir, IPK 0.00 sampai 4.00).
2. `CREATE TABLE students` dengan constraint bernama dan hasil `\d students`.
3. Rule gender: `CHECK (gender IN ('M', 'F'))` ditambah NOT NULL.
4. Pemetaan constraint ke domain constraint (NULL dan CHECK), key constraint, dan entity integrity constraint.
5. Enam percobaan INSERT dan UPDATE: data valid, gender, NOT NULL, CHECK, PRIMARY KEY dan UNIQUE, primary key NULL.
   Setiap percobaan diberi penjelasan berhasil atau gagal. Semuanya berhasil, data yang salah ditolak dan data yang
   benar tetap masuk.
6. Kesimpulan.

## P6.2 Introduction to DML

Schema HR dari modb.pro/db/100650 diimport ke database `hr`, lalu materi slide P6 dipraktikkan urut dari SELECT,
alias, ORDER BY, DISTINCT, LIMIT, WHERE, fungsi teks, tanggal, konversi, CASE, matematika, agregat, GROUP BY, sampai
INSERT, UPDATE, DELETE, dan transaksi (61 latihan). Syntax Oracle di slide disesuaikan ke PostgreSQL, misalnya
`FROM DUAL`, `DESC`, `ROWNUM`, `NVL`, `DECODE`, `ADD_MONTHS`, `NEXT_DAY`, dan `LAST_DAY`.

Tiga pertanyaan di akhir:

| No | Pertanyaan | Cara |
|---|---|---|
| 1 | persen selisih gaji maksimum dan minimum tiap jabatan terhadap gaji maksimum (`jobs`) | `(max_salary - min_salary) / max_salary * 100` |
| 2 | masa kerja semua pegawai, urut senior ke junior (`employees`) | `AGE(CURRENT_DATE, hire_date)`, `ORDER BY hire_date` |
| 3 | status Retired kalau masa kerja >= 30 tahun, Active kalau < 30 (`employees`) | `CASE` dengan `INTERVAL '30 years'` |

Pertanyaan 2 dan 3 menghasilkan 111 baris karena 4 pegawai dari latihan INSERT (996 sampai 999) masih ada di tabel.
Hal ini ditulis di keterangannya.

## Screenshot

Semua query dijalankan di PostgreSQL 18.6 lewat psql (21 Oktober 2026). Screenshot diambil layar penuh dengan jam di
menu bar: 8 untuk P6.1 dan 68 untuk P6.2. Pak Djoko membolehkan output tampil sebagian asal syntax kelihatan utuh,
jadi untuk hasil yang lebih panjang dari satu layar, layar digulung ke atas supaya query dan baris awal hasilnya
kelihatan.
