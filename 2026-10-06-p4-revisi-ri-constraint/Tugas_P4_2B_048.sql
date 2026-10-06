-- DDL PostgreSQL Aplikasi Perpustakaan Kampus, Tugas P4 SBD, Ghaisan Khoirul Badruzaman (251524048)
-- Dibangun dari model yang sama dengan Tugas_P4_2B_048.pdm, diuji di PostgreSQL 18.6

create table akun (
   id_akun                      SERIAL         not null,
   email                        VARCHAR(100)   not null,
   kata_sandi_hash              VARCHAR(255)   not null,
   status_akun                  VARCHAR(12)    not null default 'AKTIF'
      constraint ck_akun_status_akun check (status_akun in ('AKTIF', 'NONAKTIF', 'DIBLOKIR')),
   dibuat_pada                  TIMESTAMP      not null,
   login_terakhir               TIMESTAMP      null,
   constraint pk_akun primary key (id_akun),
   constraint ak1_akun unique (email)
);

create table anggota (
   id_akun                      INT4           not null,
   id_anggota                   SERIAL         not null,
   nomor_anggota                VARCHAR(20)    not null,
   nomor_identitas_kampus       VARCHAR(30)    not null,
   nama_anggota                 VARCHAR(100)   not null,
   jenis_anggota                VARCHAR(12)    not null
      constraint ck_anggota_jenis_anggota check (jenis_anggota in ('MAHASISWA', 'DOSEN', 'TENDIK')),
   alamat_jalan                 VARCHAR(150)   null,
   alamat_kota                  VARCHAR(50)    null,
   alamat_kode_pos              VARCHAR(10)    null,
   tanggal_daftar               DATE           not null,
   masa_aktif_sampai            DATE           null,
   status_anggota               VARCHAR(12)    not null default 'AKTIF'
      constraint ck_anggota_status_anggota check (status_anggota in ('AKTIF', 'DITANGGUHKAN', 'BERAKHIR')),
   constraint pk_anggota primary key (id_anggota),
   constraint ak1_anggota unique (nomor_anggota),
   constraint ak2_anggota unique (nomor_identitas_kampus),
   constraint uq_anggota_akun unique (id_akun)
);

create table telepon_anggota (
   id_anggota                   INT4           not null,
   nomor_telepon                VARCHAR(20)    not null,
   jenis_telepon                VARCHAR(8)     not null default 'PONSEL'
      constraint ck_telepon_anggota_jenis_telepon check (jenis_telepon in ('PONSEL', 'RUMAH', 'KANTOR')),
   utama                        BOOL           not null default false,
   constraint pk_telepon_anggota primary key (id_anggota, nomor_telepon)
);

create table petugas (
   id_akun                      INT4           not null,
   id_petugas                   SERIAL         not null,
   nip                          VARCHAR(20)    not null,
   nama_petugas                 VARCHAR(100)   not null,
   tingkat_akses                VARCHAR(15)    not null default 'OPERATOR'
      constraint ck_petugas_tingkat_akses check (tingkat_akses in ('OPERATOR', 'ADMINISTRATOR', 'KEPALA')),
   status_petugas               VARCHAR(10)    not null default 'AKTIF'
      constraint ck_petugas_status_petugas check (status_petugas in ('AKTIF', 'NONAKTIF')),
   constraint pk_petugas primary key (id_petugas),
   constraint ak1_petugas unique (nip),
   constraint uq_petugas_akun unique (id_akun)
);

create table penerbit (
   id_penerbit                  SERIAL         not null,
   nama_penerbit                VARCHAR(100)   not null,
   kota_penerbit                VARCHAR(50)    null,
   diarsipkan_pada              TIMESTAMP      null,
   constraint pk_penerbit primary key (id_penerbit),
   constraint ak1_penerbit unique (nama_penerbit)
);

create table kategori (
   id_kategori                  SERIAL         not null,
   kode_kategori                VARCHAR(10)    not null,
   nama_kategori                VARCHAR(60)    not null,
   diarsipkan_pada              TIMESTAMP      null,
   constraint pk_kategori primary key (id_kategori),
   constraint ak1_kategori unique (kode_kategori)
);

create table penulis (
   id_penulis                   SERIAL         not null,
   nama_penulis                 VARCHAR(100)   not null,
   jenis_penulis                VARCHAR(10)    not null default 'INDIVIDU'
      constraint ck_penulis_jenis_penulis check (jenis_penulis in ('INDIVIDU', 'LEMBAGA')),
   diarsipkan_pada              TIMESTAMP      null,
   constraint pk_penulis primary key (id_penulis)
);

create table buku (
   id_penerbit                  INT4           not null,
   id_kategori                  INT4           not null default 0,
   id_buku                      SERIAL         not null,
   isbn                         VARCHAR(17)    null,
   judul                        VARCHAR(200)   not null,
   anak_judul                   VARCHAR(200)   null,
   edisi                        VARCHAR(30)    null,
   tahun_terbit                 INT2           null
      constraint ck_buku_tahun_terbit check (tahun_terbit >= 1000),
   bahasa                       VARCHAR(30)    null,
   jumlah_halaman               INT2           null
      constraint ck_buku_jumlah_halaman check (jumlah_halaman >= 1),
   diarsipkan_pada              TIMESTAMP      null,
   constraint pk_buku primary key (id_buku),
   constraint ak1_buku unique (isbn)
);

create table buku_penulis (
   id_buku                      INT4           not null,
   id_penulis                   INT4           not null,
   peran                        VARCHAR(12)    not null default 'PENULIS'
      constraint ck_buku_penulis_peran check (peran in ('PENULIS', 'EDITOR', 'PENERJEMAH', 'ILUSTRATOR')),
   urutan                       INT2           not null default 1
      constraint ck_buku_penulis_urutan check (urutan >= 1),
   constraint pk_buku_penulis primary key (id_buku, id_penulis, peran)
);

create table eksemplar_buku (
   id_buku                      INT4           not null,
   id_eksemplar                 SERIAL         not null,
   barcode                      VARCHAR(30)    not null,
   lokasi_rak                   VARCHAR(30)    not null,
   kondisi                      VARCHAR(10)    not null default 'LAYAK'
      constraint ck_eksemplar_buku_kondisi check (kondisi in ('LAYAK', 'PERBAIKAN', 'RUSAK', 'HILANG')),
   status_inventaris            VARCHAR(10)    not null default 'AKTIF'
      constraint ck_eksemplar_buku_status_inventaris check (status_inventaris in ('AKTIF', 'DITARIK')),
   tanggal_pengadaan            DATE           null,
   constraint pk_eksemplar_buku primary key (id_eksemplar),
   constraint ak1_eksemplar_buku unique (barcode)
);

create table kebijakan_peminjaman (
   id_kebijakan                 SERIAL         not null,
   nomor_versi                  INT2           not null
      constraint ck_kebijakan_peminjaman_nomor_versi check (nomor_versi >= 1),
   maks_pinjam_aktif            INT2           not null default 3
      constraint ck_kebijakan_peminjaman_maks_pinjam_aktif check (maks_pinjam_aktif >= 1),
   durasi_pinjam_hari           INT2           not null default 14
      constraint ck_kebijakan_peminjaman_durasi_pinjam_hari check (durasi_pinjam_hari >= 1),
   tarif_denda_harian           NUMERIC(12,2)  not null default 500
      constraint ck_kebijakan_peminjaman_tarif_denda_harian check (tarif_denda_harian >= 0),
   maks_denda_per_detail        NUMERIC(12,2)  not null default 25000
      constraint ck_kebijakan_peminjaman_maks_denda_per_detail check (maks_denda_per_detail >= 0),
   maks_perpanjangan            INT2           not null default 2
      constraint ck_kebijakan_peminjaman_maks_perpanjangan check (maks_perpanjangan >= 0),
   durasi_perpanjangan_hari     INT2           not null default 7
      constraint ck_kebijakan_peminjaman_durasi_perpanjangan_hari check (durasi_perpanjangan_hari >= 1),
   batas_ambil_reservasi_jam    INT2           not null default 48
      constraint ck_kebijakan_peminjaman_batas_ambil_reservasi_jam check (batas_ambil_reservasi_jam >= 1),
   berlaku_mulai                TIMESTAMP      not null,
   berlaku_sampai               TIMESTAMP      null,
   keterangan                   VARCHAR(255)   null,
   constraint pk_kebijakan_peminjaman primary key (id_kebijakan),
   constraint ak1_kebijakan_peminjaman unique (nomor_versi),
   constraint ck_kebijakan_masa_berlaku check (berlaku_sampai IS NULL OR berlaku_sampai > berlaku_mulai)
);

create table peminjaman (
   id_anggota                   INT4           not null,
   id_petugas                   INT4           not null,
   id_kebijakan                 INT4           not null,
   id_peminjaman                SERIAL         not null,
   nomor_transaksi              VARCHAR(20)    not null,
   waktu_pinjam                 TIMESTAMP      not null,
   catatan                      VARCHAR(255)   null,
   constraint pk_peminjaman primary key (id_peminjaman),
   constraint ak1_peminjaman unique (nomor_transaksi)
);

create table detail_peminjaman (
   id_peminjaman                INT4           not null,
   id_eksemplar                 INT4           not null,
   id_petugas                   INT4           null,
   id_detail                    SERIAL         not null,
   jatuh_tempo                  TIMESTAMP      not null,
   status_detail                VARCHAR(12)    not null default 'AKTIF'
      constraint ck_detail_peminjaman_status_detail check (status_detail in ('AKTIF', 'DIKEMBALIKAN', 'DITUTUP')),
   waktu_selesai                TIMESTAMP      null,
   kondisi_saat_kembali         VARCHAR(10)    null
      constraint ck_detail_peminjaman_kondisi_saat_kembali check (kondisi_saat_kembali in ('LAYAK', 'PERBAIKAN', 'RUSAK', 'HILANG')),
   alasan_penutupan             VARCHAR(255)   null,
   constraint pk_detail_peminjaman primary key (id_detail),
   constraint ck_detail_selesai check ((status_detail = 'AKTIF' AND waktu_selesai IS NULL) OR (status_detail <> 'AKTIF' AND waktu_selesai IS NOT NULL AND id_petugas IS NOT NULL)),
   constraint ck_detail_ditutup check (status_detail <> 'DITUTUP' OR alasan_penutupan IS NOT NULL)
);

create table perpanjangan (
   id_detail                    INT4           not null,
   id_akun                      INT4           not null,
   perpanjangan_ke              INT2           not null
      constraint ck_perpanjangan_perpanjangan_ke check (perpanjangan_ke >= 1),
   jatuh_tempo_lama             TIMESTAMP      not null,
   jatuh_tempo_baru             TIMESTAMP      not null,
   waktu_perpanjangan           TIMESTAMP      not null,
   constraint pk_perpanjangan primary key (id_detail, perpanjangan_ke),
   constraint ck_perpanjangan_tanggal check (jatuh_tempo_baru > jatuh_tempo_lama)
);

create table reservasi (
   id_anggota                   INT4           not null,
   id_buku                      INT4           not null,
   id_kebijakan                 INT4           not null,
   id_eksemplar                 INT4           null,
   id_detail                    INT4           null,
   id_reservasi                 SERIAL         not null,
   waktu_pengajuan              TIMESTAMP      not null,
   status_reservasi             VARCHAR(12)    not null default 'MENUNGGU'
      constraint ck_reservasi_status_reservasi check (status_reservasi in ('MENUNGGU', 'SIAP', 'DIPENUHI', 'KADALUWARSA', 'DIBATALKAN')),
   waktu_siap                   TIMESTAMP      null,
   batas_ambil                  TIMESTAMP      null,
   waktu_selesai                TIMESTAMP      null,
   constraint pk_reservasi primary key (id_reservasi),
   constraint uq_reservasi_detail unique (id_detail),
   constraint ck_reservasi_status check ((status_reservasi = 'MENUNGGU' AND id_eksemplar IS NULL AND batas_ambil IS NULL AND id_detail IS NULL) OR (status_reservasi = 'SIAP' AND id_eksemplar IS NOT NULL AND batas_ambil IS NOT NULL AND id_detail IS NULL) OR (status_reservasi = 'DIPENUHI' AND id_detail IS NOT NULL) OR (status_reservasi IN ('KADALUWARSA', 'DIBATALKAN') AND id_detail IS NULL))
);

create table denda (
   id_detail                    INT4           not null,
   id_denda                     SERIAL         not null,
   hari_terlambat               INT4           not null
      constraint ck_denda_hari_terlambat check (hari_terlambat >= 1),
   tarif_harian                 NUMERIC(12,2)  not null
      constraint ck_denda_tarif_harian check (tarif_harian >= 0),
   nominal                      NUMERIC(12,2)  not null
      constraint ck_denda_nominal check (nominal >= 0),
   waktu_ditetapkan             TIMESTAMP      not null,
   constraint pk_denda primary key (id_denda),
   constraint uq_denda_detail unique (id_detail),
   constraint ck_denda_hitungan check (nominal > 0 AND nominal <= hari_terlambat * tarif_harian)
);

create table pembayaran (
   id_denda                     INT4           not null,
   id_petugas                   INT4           not null,
   id_pembayaran                SERIAL         not null,
   nominal_bayar                NUMERIC(12,2)  not null
      constraint ck_pembayaran_nominal_bayar check (nominal_bayar >= 0),
   waktu_bayar                  TIMESTAMP      not null,
   metode_bayar                 VARCHAR(10)    not null
      constraint ck_pembayaran_metode_bayar check (metode_bayar in ('TUNAI', 'TRANSFER', 'QRIS')),
   status_pembayaran            VARCHAR(6)     not null default 'SAH'
      constraint ck_pembayaran_status_pembayaran check (status_pembayaran in ('SAH', 'BATAL')),
   alasan_batal                 VARCHAR(255)   null,
   waktu_batal                  TIMESTAMP      null,
   constraint pk_pembayaran primary key (id_pembayaran),
   constraint ck_pembayaran_nominal check (nominal_bayar > 0),
   constraint ck_pembayaran_batal check ((status_pembayaran = 'SAH' AND alasan_batal IS NULL AND waktu_batal IS NULL) OR (status_pembayaran = 'BATAL' AND alasan_batal IS NOT NULL AND waktu_batal IS NOT NULL))
);

create table notifikasi (
   id_anggota                   INT4           not null,
   id_detail                    INT4           null,
   id_reservasi                 INT4           null,
   id_notifikasi                SERIAL         not null,
   kunci_kejadian               VARCHAR(100)   not null,
   jenis_notifikasi             VARCHAR(25)    not null
      constraint ck_notifikasi_jenis_notifikasi check (jenis_notifikasi in ('PENGINGAT_JATUH_TEMPO', 'TERLAMBAT', 'RESERVASI_SIAP', 'RESERVASI_KADALUWARSA', 'DENDA_BARU')),
   judul_notifikasi             VARCHAR(150)   not null,
   isi_notifikasi               TEXT           not null,
   status_kirim                 VARCHAR(10)    not null default 'MENUNGGU'
      constraint ck_notifikasi_status_kirim check (status_kirim in ('MENUNGGU', 'TERKIRIM', 'GAGAL')),
   jumlah_percobaan             INT2           not null default 0
      constraint ck_notifikasi_jumlah_percobaan check (jumlah_percobaan >= 0),
   dibuat_pada                  TIMESTAMP      not null,
   terkirim_pada                TIMESTAMP      null,
   constraint pk_notifikasi primary key (id_notifikasi),
   constraint ak1_notifikasi unique (kunci_kejadian),
   constraint ck_notifikasi_konteks check (id_detail IS NULL OR id_reservasi IS NULL),
   constraint ck_notifikasi_terkirim check (status_kirim <> 'TERKIRIM' OR terkirim_pada IS NOT NULL)
);

create table log_audit (
   id_akun                      INT4           null,
   id_log                       SERIAL         not null,
   waktu_kejadian               TIMESTAMP      not null,
   jenis_pelaku                 VARCHAR(10)    not null
      constraint ck_log_audit_jenis_pelaku check (jenis_pelaku in ('PENGGUNA', 'SYSTEM')),
   aksi                         VARCHAR(30)    not null,
   nama_objek                   VARCHAR(50)    not null,
   id_objek                     VARCHAR(50)    not null,
   data_lama                    TEXT           null,
   data_baru                    TEXT           null,
   alamat_ip                    VARCHAR(45)    null,
   constraint pk_log_audit primary key (id_log),
   constraint ck_log_pelaku check ((jenis_pelaku = 'SYSTEM' AND id_akun IS NULL) OR (jenis_pelaku = 'PENGGUNA' AND id_akun IS NOT NULL))
);

alter table anggota add constraint fk_anggota_r22 foreign key (id_akun)
   references akun (id_akun) on delete restrict on update cascade;
alter table telepon_anggota add constraint fk_telepon_anggota_r28 foreign key (id_anggota)
   references anggota (id_anggota) on delete cascade on update cascade;
alter table petugas add constraint fk_petugas_r23 foreign key (id_akun)
   references akun (id_akun) on delete restrict on update cascade;
alter table buku add constraint fk_buku_r01 foreign key (id_penerbit)
   references penerbit (id_penerbit) on delete restrict on update cascade;
alter table buku add constraint fk_buku_r02 foreign key (id_kategori)
   references kategori (id_kategori) on delete set default on update cascade;
alter table buku_penulis add constraint fk_buku_penulis_r04 foreign key (id_buku)
   references buku (id_buku) on delete cascade on update cascade;
alter table buku_penulis add constraint fk_buku_penulis_r05 foreign key (id_penulis)
   references penulis (id_penulis) on delete restrict on update cascade;
alter table eksemplar_buku add constraint fk_eksemplar_buku_r03 foreign key (id_buku)
   references buku (id_buku) on delete restrict on update cascade;
alter table peminjaman add constraint fk_peminjaman_r06 foreign key (id_anggota)
   references anggota (id_anggota) on delete restrict on update cascade;
alter table peminjaman add constraint fk_peminjaman_r07 foreign key (id_petugas)
   references petugas (id_petugas) on delete restrict on update cascade;
alter table peminjaman add constraint fk_peminjaman_r08 foreign key (id_kebijakan)
   references kebijakan_peminjaman (id_kebijakan) on delete restrict on update cascade;
alter table detail_peminjaman add constraint fk_detail_peminjaman_r09 foreign key (id_peminjaman)
   references peminjaman (id_peminjaman) on delete cascade on update cascade;
alter table detail_peminjaman add constraint fk_detail_peminjaman_r10 foreign key (id_eksemplar)
   references eksemplar_buku (id_eksemplar) on delete restrict on update cascade;
alter table detail_peminjaman add constraint fk_detail_peminjaman_r11 foreign key (id_petugas)
   references petugas (id_petugas) on delete restrict on update cascade;
alter table perpanjangan add constraint fk_perpanjangan_r12 foreign key (id_detail)
   references detail_peminjaman (id_detail) on delete cascade on update cascade;
alter table perpanjangan add constraint fk_perpanjangan_r13 foreign key (id_akun)
   references akun (id_akun) on delete restrict on update cascade;
alter table reservasi add constraint fk_reservasi_r14 foreign key (id_anggota)
   references anggota (id_anggota) on delete cascade on update cascade;
alter table reservasi add constraint fk_reservasi_r15 foreign key (id_buku)
   references buku (id_buku) on delete restrict on update cascade;
alter table reservasi add constraint fk_reservasi_r16 foreign key (id_kebijakan)
   references kebijakan_peminjaman (id_kebijakan) on delete restrict on update cascade;
alter table reservasi add constraint fk_reservasi_r17 foreign key (id_eksemplar)
   references eksemplar_buku (id_eksemplar) on delete set null on update cascade;
alter table reservasi add constraint fk_reservasi_r18 foreign key (id_detail)
   references detail_peminjaman (id_detail) on delete restrict on update cascade;
alter table denda add constraint fk_denda_r19 foreign key (id_detail)
   references detail_peminjaman (id_detail) on delete restrict on update cascade;
alter table pembayaran add constraint fk_pembayaran_r20 foreign key (id_denda)
   references denda (id_denda) on delete restrict on update cascade;
alter table pembayaran add constraint fk_pembayaran_r21 foreign key (id_petugas)
   references petugas (id_petugas) on delete restrict on update cascade;
alter table notifikasi add constraint fk_notifikasi_r24 foreign key (id_anggota)
   references anggota (id_anggota) on delete cascade on update cascade;
alter table notifikasi add constraint fk_notifikasi_r26 foreign key (id_detail)
   references detail_peminjaman (id_detail) on delete set null on update cascade;
alter table notifikasi add constraint fk_notifikasi_r27 foreign key (id_reservasi)
   references reservasi (id_reservasi) on delete set null on update cascade;
alter table log_audit add constraint fk_log_audit_r25 foreign key (id_akun)
   references akun (id_akun) on delete no action on update cascade;

create unique index uq_detail_eksemplar_aktif on detail_peminjaman (id_eksemplar) where status_detail = 'AKTIF';
create unique index uq_reservasi_aktif_per_buku on reservasi (id_anggota, id_buku) where status_reservasi IN ('MENUNGGU', 'SIAP');
create unique index uq_reservasi_eksemplar_siap on reservasi (id_eksemplar) where status_reservasi = 'SIAP';
create unique index uq_telepon_utama on telepon_anggota (id_anggota) where utama;

-- index untuk kolom foreign key yang belum tercakup primary key atau unique (dipakai saat cek RI dan join)
create index ix_buku_id_penerbit on buku (id_penerbit);
create index ix_buku_id_kategori on buku (id_kategori);
create index ix_buku_penulis_id_penulis on buku_penulis (id_penulis);
create index ix_eksemplar_buku_id_buku on eksemplar_buku (id_buku);
create index ix_peminjaman_id_anggota on peminjaman (id_anggota);
create index ix_peminjaman_id_petugas on peminjaman (id_petugas);
create index ix_peminjaman_id_kebijakan on peminjaman (id_kebijakan);
create index ix_detail_peminjaman_id_peminjaman on detail_peminjaman (id_peminjaman);
create index ix_detail_peminjaman_id_eksemplar on detail_peminjaman (id_eksemplar);
create index ix_detail_peminjaman_id_petugas on detail_peminjaman (id_petugas);
create index ix_perpanjangan_id_akun on perpanjangan (id_akun);
create index ix_reservasi_id_anggota on reservasi (id_anggota);
create index ix_reservasi_id_buku on reservasi (id_buku);
create index ix_reservasi_id_kebijakan on reservasi (id_kebijakan);
create index ix_reservasi_id_eksemplar on reservasi (id_eksemplar);
create index ix_pembayaran_id_denda on pembayaran (id_denda);
create index ix_pembayaran_id_petugas on pembayaran (id_petugas);
create index ix_notifikasi_id_anggota on notifikasi (id_anggota);
create index ix_notifikasi_id_detail on notifikasi (id_detail);
create index ix_notifikasi_id_reservasi on notifikasi (id_reservasi);
create index ix_log_audit_id_akun on log_audit (id_akun);

-- index untuk pola query aplikasi
create index ix_buku_judul on buku (judul);
create index ix_detail_jatuh_tempo_aktif on detail_peminjaman (jatuh_tempo) where status_detail = 'AKTIF';
create index ix_reservasi_antrean on reservasi (id_buku, waktu_pengajuan) where status_reservasi = 'MENUNGGU';
create index ix_notifikasi_belum_kirim on notifikasi (dibuat_pada) where status_kirim = 'MENUNGGU';
create index ix_log_audit_waktu on log_audit (waktu_kejadian);
create index ix_peminjaman_waktu on peminjaman (waktu_pinjam);

-- data awal wajib: tujuan ON DELETE SET DEFAULT relasi R02
insert into kategori (id_kategori, kode_kategori, nama_kategori) values (0, '000', 'Karya Umum');

