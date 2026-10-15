# Teori Pertemuan 6: Latihan Aljabar Relasional

Latihan di slide terakhir `Topik3_relationalModel(ppt).pdf` (slide 94), dari Dr. Ade Chandra Nugraha.
Dikerjakan tulis tangan, dikumpulkan langsung di meja dosen paling lambat Jumat 16 Okt 2026 pukul 11.00.

`Latihan_Topik3_Aljabar_Relasional_048.pdf` berisi jawaban 8 soal dalam aljabar relasional, satu halaman,
buat disalin ke kertas. Skemanya skema bank dari buku Silberschatz (loan, borrower, account, depositor)
karena soalnya memakai nama relasi itu.

| No | Soal singkat | Operasi |
|---|---|---|
| 1 | loan di atas $1200 | selection |
| 2 | loan_number untuk loan di atas $1200 | selection lalu projection |
| 3 | loan di atas $1200 atau di bawah $75 | selection dengan OR |
| 4 | nasabah punya loan, account, atau keduanya | union |
| 5 | nasabah punya loan dan account | intersection |
| 6 | nasabah punya loan di cabang Riverside | natural join, selection, projection |
| 7 | nomor 6 tapi tidak punya account sama sekali | nomor 6 dikurangi (set difference) depositor |
| 8 | saldo account terbesar | aggregate MAX |
