-- =====================================================
-- PROJECT: KIMIA FARMA BIG DATA ANALYTICS
-- FILE: 04_business_analysis.sql
-- PURPOSE: Analisis performa bisnis Kimia Farma
-- PERIOD: 2020 - 2023
-- SOURCE: kf_analisa
-- =====================================================


-- =====================================================
-- 1. RINGKASAN PERFORMA BISNIS KESELURUHAN
-- Tujuan: Mengetahui total transaksi, penjualan,
-- dan keuntungan selama periode analisis.
-- =====================================================

SELECT
  COUNT(transaction_id) AS total_transaksi,
  ROUND(SUM(nett_sales), 2) AS total_penjualan,
  ROUND(SUM(nett_profit), 2) AS total_keuntungan
FROM
  `rapid-hangar-513313-v4.kimia_farma.kf_analisa`;


-- =====================================================
-- 2. PERBANDINGAN PERFORMA BISNIS TAHUNAN
-- Tujuan: Membandingkan transaksi, penjualan,
-- dan keuntungan dari tahun 2020 sampai 2023.
-- =====================================================

SELECT
  EXTRACT(YEAR FROM date) AS tahun,
  COUNT(transaction_id) AS total_transaksi,
  ROUND(SUM(nett_sales), 2) AS total_penjualan,
  ROUND(SUM(nett_profit), 2) AS total_keuntungan
FROM
  `rapid-hangar-513313-v4.kimia_farma.kf_analisa`
GROUP BY
  tahun
ORDER BY
  tahun;


-- =====================================================
-- 3. TOP 10 CABANG BERDASARKAN JUMLAH TRANSAKSI
-- Tujuan: Mengetahui cabang dengan aktivitas transaksi
-- tertinggi selama periode analisis.
-- =====================================================

SELECT
  branch_id,
  branch_name,
  kota,
  provinsi,
  COUNT(transaction_id) AS total_transaksi
FROM
  `rapid-hangar-513313-v4.kimia_farma.kf_analisa`
GROUP BY
  branch_id,
  branch_name,
  kota,
  provinsi
ORDER BY
  total_transaksi DESC
LIMIT 10;


-- =====================================================
-- 4. TOP 10 CABANG BERDASARKAN TOTAL PENJUALAN
-- Tujuan: Mengetahui cabang dengan nilai nett sales
-- tertinggi selama periode analisis.
-- =====================================================

SELECT
  branch_id,
  branch_name,
  kota,
  provinsi,
  ROUND(SUM(nett_sales), 2) AS total_penjualan
FROM
  `rapid-hangar-513313-v4.kimia_farma.kf_analisa`
GROUP BY
  branch_id,
  branch_name,
  kota,
  provinsi
ORDER BY
  total_penjualan DESC
LIMIT 10;


-- =====================================================
-- 5. TOP 5 CABANG BERDASARKAN RATING
-- Tujuan: Menemukan cabang dengan rating cabang
-- tertinggi dan rating transaksi terendah.
-- =====================================================

SELECT
  branch_id,
  branch_name,
  kota,
  provinsi,
  ROUND(AVG(rating_cabang), 2) AS rata_rating_cabang,
  ROUND(AVG(rating_transaksi), 2) AS rata_rating_transaksi
FROM
  `rapid-hangar-513313-v4.kimia_farma.kf_analisa`
GROUP BY
  branch_id,
  branch_name,
  kota,
  provinsi
ORDER BY
  rata_rating_cabang DESC,
  rata_rating_transaksi ASC
LIMIT 5;


-- =====================================================
-- 6. TOTAL PROFIT BERDASARKAN PROVINSI
-- Tujuan: Menghitung total keuntungan dan jumlah
-- transaksi setiap provinsi untuk visualisasi Geo Map.
-- =====================================================

SELECT
  provinsi,
  ROUND(SUM(nett_profit), 2) AS total_profit,
  COUNT(transaction_id) AS total_transaksi
FROM
  `rapid-hangar-513313-v4.kimia_farma.kf_analisa`
GROUP BY
  provinsi
ORDER BY
  total_profit DESC;