-- =====================================================
-- PROJECT: KIMIA FARMA BIG DATA ANALYTICS
-- FILE: 01_data_validation.sql
-- PURPOSE: Memvalidasi kualitas dan konsistensi data
-- PERIODE: 2020 - 2023
-- =====================================================

-- 1. Mengecek jumlah transaksi
SELECT
  COUNT(*) AS total_transaksi
FROM
  `rapid-hangar-513313-v4.kimia_farma.kf_final_transaction`;

-- 2. Mengecek relasi antara transaksi dan produk
SELECT
  COUNT(*) AS produk_tidak_cocok
FROM
  `rapid-hangar-513313-v4.kimia_farma.kf_final_transaction` t
LEFT JOIN
  `rapid-hangar-513313-v4.kimia_farma.kf_product` p
  ON
    t.product_id = p.product_id
WHERE
  p.product_id IS NULL;

-- 3. Mengecek relasi antara transaksi dan cabang
SELECT
  COUNT(*) AS cabang_tidak_cocok
FROM
  `rapid-hangar-513313-v4.kimia_farma.kf_final_transaction` t
LEFT JOIN
  `rapid-hangar-513313-v4.kimia_farma.kf_kantor_cabang` c
  ON
    t.branch_id = c.branch_id
WHERE
  c.branch_id IS NULL;

-- 4. Mengecek duplikasi ID produk
SELECT
  product_id,
  COUNT(*) AS jumlah
FROM
  `rapid-hangar-513313-v4.kimia_farma.kf_product`
GROUP BY
  product_id
HAVING
  COUNT(*) > 1;

-- 5. Mengecek duplikasi ID cabang
SELECT
  branch_id,
  COUNT(*) AS jumlah
FROM
  `rapid-hangar-513313-v4.kimia_farma.kf_kantor_cabang`
GROUP BY
  branch_id
HAVING
  COUNT(*) > 1;

-- 6. Mengecek duplikasi ID transaksi
SELECT
  transaction_id,
  COUNT(*) AS jumlah
FROM
  `rapid-hangar-513313-v4.kimia_farma.kf_final_transaction`
GROUP BY
  transaction_id
HAVING
  COUNT(*) > 1
LIMIT 10;

-- 7. Mengecek data kosong pada kolom transaksi
SELECT
  COUNTIF(transaction_id IS NULL) AS transaksi_kosong,
  COUNTIF(date IS NULL) AS tanggal_kosong,
  COUNTIF(branch_id IS NULL) AS cabang_kosong,
  COUNTIF(customer_name IS NULL) AS customer_kosong,
  COUNTIF(product_id IS NULL) AS produk_kosong,
  COUNTIF(price IS NULL) AS harga_kosong,
  COUNTIF(discount_percentage IS NULL) AS diskon_kosong,
  COUNTIF(rating IS NULL) AS rating_kosong
FROM
  `rapid-hangar-513313-v4.kimia_farma.kf_final_transaction`;

-- 8. Memeriksa rentang harga dan diskon
SELECT
  MIN(price) AS harga_terendah,
  MAX(price) AS harga_tertinggi,
  MIN(discount_percentage) AS diskon_terendah,
  MAX(discount_percentage) AS diskon_tertinggi,
  AVG(price) AS rata_rata_harga
FROM
  `rapid-hangar-513313-v4.kimia_farma.kf_final_transaction`;

-- 9. Mengecek kesesuaian harga transaksi dan harga produk
SELECT
  COUNT(*) AS total_harga_tidak_cocok
FROM
  `rapid-hangar-513313-v4.kimia_farma.kf_final_transaction` t
JOIN
  `rapid-hangar-513313-v4.kimia_farma.kf_product` p
  ON
    t.product_id = p.product_id
WHERE
  t.price != p.price;

-- 10. Mengecek periode transaksi
SELECT
  MIN(date) AS tanggal_awal,
  MAX(date) AS tanggal_akhir,
  COUNT(DISTINCT EXTRACT(YEAR FROM date)) AS jumlah_tahun
FROM
  `rapid-hangar-513313-v4.kimia_farma.kf_final_transaction`;
