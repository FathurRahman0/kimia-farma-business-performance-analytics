
# Kimia Farma Business Performance Analytics 2020–2023

## 1. Gambaran Proyek

Kimia Farma Business Performance Analytics 2020–2023 merupakan proyek analisis data yang dilakukan untuk mengevaluasi kinerja bisnis Kimia Farma selama periode 2020 hingga 2023.

Proyek ini memanfaatkan data transaksi, produk, persediaan, dan kantor cabang untuk memperoleh informasi mengenai aktivitas transaksi, penjualan, estimasi keuntungan, serta performa kantor cabang.

Proses pengolahan dan analisis data dilakukan menggunakan **Google BigQuery** dengan bahasa SQL. Selanjutnya, hasil analisis divisualisasikan menggunakan **Looker Studio** dalam bentuk dashboard interaktif.

## 2. Tujuan Proyek

Proyek ini memiliki beberapa tujuan, yaitu:

- Menganalisis kinerja bisnis Kimia Farma selama periode 2020–2023.
- Mengetahui jumlah transaksi, total penjualan bersih, dan estimasi keuntungan bersih.
- Mengidentifikasi cabang dengan jumlah transaksi dan penjualan tertinggi.
- Menganalisis rating transaksi dan rating kantor cabang.
- Mengetahui persebaran keuntungan berdasarkan provinsi.
- Menyajikan hasil analisis dalam bentuk dashboard interaktif.

## 3. Tools yang Digunakan

| Tools           | Kegunaan                                                |
| --------------- | ------------------------------------------------------- |
| Google BigQuery | Pengolahan dan analisis data dalam skala besar          |
| SQL             | Validasi, transformasi, penggabungan, dan analisis data |
| Looker Studio   | Pembuatan dashboard dan visualisasi data                |
| GitHub          | Penyimpanan kode SQL dan dokumentasi proyek             |

## 4. Dataset

Proyek ini menggunakan empat dataset utama yang disediakan dalam kegiatan Project-Based Internship Kimia Farma.

| Nama Dataset             | Keterangan                   |
| ------------------------ | ---------------------------- |
| `kf_final_transaction` | Data transaksi pelanggan     |
| `kf_product`           | Data informasi produk        |
| `kf_inventory`         | Data persediaan produk       |
| `kf_kantor_cabang`     | Data informasi kantor cabang |

Data yang digunakan mencakup periode **2020–2023**.

Dalam proses pembuatan tabel analisis akhir, data transaksi digabungkan dengan data produk dan kantor cabang menggunakan SQL JOIN. Sementara itu, data persediaan digunakan sebagai dataset pendukung dan tidak digabungkan ke tabel analisis akhir agar tidak menyebabkan penggandaan baris transaksi akibat perbedaan tingkat detail data.

## 5. Tahapan Pengolahan Data

Pengolahan data dilakukan melalui beberapa tahapan berikut:

### 5.1 Import Dataset

Mengimpor empat dataset ke Google BigQuery agar dapat dikelola dan dianalisis menggunakan SQL.

### 5.2 Validasi Data

Melakukan pemeriksaan kualitas dan konsistensi data, meliputi:

- Pemeriksaan data duplikat.
- Pemeriksaan kelengkapan data.
- Pemeriksaan kesesuaian hubungan antar tabel.
- Pemeriksaan konsistensi harga transaksi dengan informasi harga produk.
- Pemeriksaan rentang tanggal transaksi.

### 5.3 Transformasi Data

Melakukan transformasi data untuk mempersiapkan informasi yang dibutuhkan dalam proses analisis bisnis.

### 5.4 Penggabungan Data

Menggabungkan tabel transaksi, produk, dan kantor cabang menggunakan SQL JOIN untuk menghasilkan informasi yang saling terhubung.

### 5.5 Pembuatan Tabel Analisis

Membuat tabel analisis akhir dengan nama `kf_analisa` sebagai dasar untuk melakukan analisis bisnis.

Tabel analisis akhir menghasilkan:

- **Jumlah baris:** 672.458
- **Jumlah kolom:** 17

Beberapa informasi yang terdapat dalam tabel tersebut meliputi tanggal transaksi, nama cabang, kota, provinsi, nama produk, harga aktual, persentase diskon, penjualan bersih, estimasi keuntungan bersih, dan rating.

## 6. Analisis Bisnis

Analisis bisnis dilakukan menggunakan enam query SQL utama untuk memperoleh informasi mengenai kinerja perusahaan.

### 6.1 Ringkasan Kinerja Bisnis

Menampilkan ringkasan keseluruhan kinerja bisnis, meliputi total transaksi, total penjualan bersih, dan estimasi keuntungan bersih.

### 6.2 Performa Bisnis Tahunan

Menganalisis perkembangan jumlah transaksi, penjualan bersih, dan estimasi keuntungan bersih berdasarkan tahun selama periode 2020–2023.

### 6.3 10 Cabang dengan Jumlah Transaksi Tertinggi

Mengidentifikasi sepuluh kantor cabang dengan jumlah transaksi terbanyak.

### 6.4 10 Cabang dengan Penjualan Bersih Tertinggi

Mengidentifikasi sepuluh kantor cabang yang menghasilkan nilai penjualan bersih tertinggi.

### 6.5 Analisis Rating Cabang

Menganalisis dan membandingkan rating kantor cabang berdasarkan rating cabang dan rating transaksi.

### 6.6 Persebaran Keuntungan Berdasarkan Provinsi

Menganalisis distribusi estimasi keuntungan bersih untuk mengetahui provinsi dengan kontribusi keuntungan tertinggi.

## 7. Hasil Analisis

Berdasarkan hasil pengolahan dan analisis data, diperoleh beberapa hasil utama sebagai berikut:

### 7.1 Ringkasan Kinerja Bisnis

| Indikator                               |           Hasil |
| --------------------------------------- | --------------: |
| Total Transaksi                         |         672.458 |
| Total Penjualan Bersih                  | Rp321,17 miliar |
| Estimasi Keuntungan Bersih              |  Rp91,21 miliar |
| Tahun dengan Penjualan Bersih Tertinggi |            2022 |
| Provinsi dengan Keuntungan Tertinggi    |      Jawa Barat |
| Keuntungan Jawa Barat                   |  Rp26,94 miliar |

### 7.2 Performa Bisnis Tahunan

Berikut merupakan hasil analisis kinerja bisnis berdasarkan tahun:

| Tahun | Jumlah Transaksi | Penjualan Bersih |
| ----- | ---------------: | ---------------: |
| 2020  |          168.651 |   Rp80,44 miliar |
| 2021  |          167.697 |   Rp80,04 miliar |
| 2022  |          168.642 |   Rp80,58 miliar |
| 2023  |          167.468 |   Rp80,12 miliar |

Berdasarkan hasil tersebut, tahun 2022 menjadi periode dengan penjualan bersih tertinggi, yaitu sekitar Rp80,58 miliar.

### 7.3 Performa Berdasarkan Provinsi

Provinsi Jawa Barat menjadi wilayah dengan estimasi keuntungan bersih tertinggi, yaitu sekitar Rp26,94 miliar.

### 7.4 Performa Kantor Cabang

Analisis dilakukan untuk mengetahui cabang dengan jumlah transaksi, penjualan bersih, dan rating tertinggi. Hasilnya dapat digunakan untuk membandingkan performa antar kantor cabang.

**Catatan Perhitungan Keuntungan:**

Nilai `nett_profit` merupakan estimasi keuntungan yang dihitung dengan mengalikan penjualan bersih (`nett_sales`) dengan persentase gross profit margin berdasarkan kategori harga produk sesuai ketentuan proyek. Nilai tersebut bukan angka laba aktual yang berasal dari laporan keuangan perusahaan.

## 8. Dashboard Visualisasi

Hasil analisis divisualisasikan menggunakan Looker Studio dalam bentuk dashboard interaktif.

Dashboard ini menyajikan beberapa informasi utama, yaitu:

- Rata-rata rating transaksi.
- Total penjualan bersih.
- Total transaksi.
- Estimasi keuntungan bersih.
- 10 cabang dengan jumlah transaksi tertinggi.
- 10 cabang dengan penjualan bersih tertinggi.
- Tren penjualan bersih tahunan.
- 5 cabang dengan rating tertinggi.
- Persebaran keuntungan berdasarkan provinsi.
- Tabel detail hasil analisis.

### Tautan Dashboard

[datastudio.google.com/reporting/883e78f0-fa80-4561-8dd0-0e64a40155d8](https://datastudio.google.com/reporting/883e78f0-fa80-4561-8dd0-0e64a40155d8)

### Pratinjau Dashboard

![Dashboard_Kimia_Farma](dashboard/Dashboard_Kimia_Farma.png)

## 9. Struktur Repository

Berikut merupakan struktur penyimpanan proyek di GitHub:

```text
Kimia-Farma-Business-Performance-Analytics-2020-2023/
│
├── README.md
│
├── dashboard/
│   └── Dashboard_Kimia_Farma.png
│
├── data/
│   └── raw/
│       ├── kf_final_transaction.csv
│       ├── kf_inventory.csv
│       ├── kf_kantor_cabang.csv
│       └── kf_product.csv
│
├── presentation/
│   └── Kimia_Farma_Business_Performance_Analytics.pdf
│
├── sql/
│   ├── 01_data_validation.sql
│   ├── 02_data_transformation.sql
│   ├── 03_create_analysis_table.sql
│   └── 04_business_analysis.sql
│
└── video/
```

## 10. Dokumentasi dan Presentasi

Dokumentasi proyek dapat diakses melalui beberapa bagian berikut:

- **Dashboard:** [datastudio.google.com/reporting/883e78f0-fa80-4561-8dd0-0e64a40155d8](https://datastudio.google.com/reporting/883e78f0-fa80-4561-8dd0-0e64a40155d8)
- **Presentasi Proyek:** Tersedia pada folder `presentation/` di repository GitHub.
- **Query SQL:** Tersedia pada folder `sql/` di repository GitHub.
- **Video Penjelasan Proyek:** [Tonton Video di Sini](MASUKKAN_LINK_VIDEO_YOUTUBE)

## 11. Kesimpulan

Melalui proyek Kimia Farma Business Performance Analytics 2020–2023, data bisnis berhasil diolah dan dianalisis menggunakan Google BigQuery dan SQL untuk menghasilkan informasi mengenai transaksi, penjualan bersih, estimasi keuntungan bersih, serta performa kantor cabang.

Berdasarkan hasil analisis, terdapat 672.458 transaksi dengan total penjualan bersih sebesar Rp321,17 miliar dan estimasi keuntungan bersih sebesar Rp91,21 miliar. Tahun 2022 menjadi periode dengan penjualan bersih tertinggi, sedangkan Jawa Barat merupakan provinsi dengan estimasi keuntungan bersih tertinggi.

Hasil analisis tersebut kemudian divisualisasikan menggunakan Looker Studio dalam bentuk dashboard interaktif sehingga informasi kinerja bisnis dapat dipahami dengan lebih mudah dan digunakan sebagai bahan pendukung pengambilan keputusan.

---

## Informasi Proyek

**Nama Proyek:** Kimia Farma Business Performance Analytics 2020–2023
**Dibuat oleh:** Fathur Rahman
**Periode Analisis:** 2020–2023
**Teknologi:** Google BigQuery, SQL, Looker Studio, dan GitHub
