
-- =====================================================
-- PROJECT: KIMIA FARMA DATA ANALYST
-- BAGIAN 2: DATA TRANSFORMATION
-- TUJUAN:
-- 1. Menggabungkan data transaksi, produk, dan cabang.
-- 2. Menghitung persentase gross laba.
-- 3. Menghitung nett sales.
-- 4. Menghitung nett profit.
-- =====================================================


-- 1. JOIN TIGA TABEL
-- Menggabungkan transaksi dengan informasi produk dan cabang.

SELECT
    t.transaction_id,
    t.date,
    t.branch_id,
    c.branch_name,
    c.kota,
    c.provinsi,
    c.rating AS rating_cabang,
    t.customer_name,
    t.product_id,
    p.product_name,
    t.price AS actual_price,
    t.discount_percentage,
    t.rating AS rating_transaksi
FROM
    `rapid-hangar-513313-v4.kimia_farma.kf_final_transaction` AS t
LEFT JOIN
    `rapid-hangar-513313-v4.kimia_farma.kf_product` AS p
    ON t.product_id = p.product_id
LEFT JOIN
    `rapid-hangar-513313-v4.kimia_farma.kf_kantor_cabang` AS c
    ON t.branch_id = c.branch_id
LIMIT 10;


-- 2. MENGHITUNG PERSENTASE GROSS LABA
-- Menentukan margin berdasarkan harga produk.

SELECT
    transaction_id,
    price AS actual_price,
    CASE
        WHEN price <= 50000 THEN 0.10
        WHEN price <= 100000 THEN 0.15
        WHEN price <= 300000 THEN 0.20
        WHEN price <= 500000 THEN 0.25
        ELSE 0.30
    END AS persentase_gross_laba
FROM
    `rapid-hangar-513313-v4.kimia_farma.kf_final_transaction`
LIMIT 10;


-- 3. MENGHITUNG NETT SALES
-- Menghitung penjualan setelah dikurangi diskon.

SELECT
    transaction_id,
    price AS actual_price,
    discount_percentage,
    ROUND(price * (1 - discount_percentage), 2) AS nett_sales
FROM
    `rapid-hangar-513313-v4.kimia_farma.kf_final_transaction`
LIMIT 10;


-- 4. MENGHITUNG NETT PROFIT
-- Menghitung keuntungan berdasarkan nett sales dan gross margin.

SELECT
    transaction_id,
    price AS actual_price,
    discount_percentage,
    ROUND(price * (1 - discount_percentage), 2) AS nett_sales,
    CASE
        WHEN price <= 50000 THEN 0.10
        WHEN price <= 100000 THEN 0.15
        WHEN price <= 300000 THEN 0.20
        WHEN price <= 500000 THEN 0.25
        ELSE 0.30
    END AS persentase_gross_laba,
    ROUND(
        price * (1 - discount_percentage) *
        CASE
            WHEN price <= 50000 THEN 0.10
            WHEN price <= 100000 THEN 0.15
            WHEN price <= 300000 THEN 0.20
            WHEN price <= 500000 THEN 0.25
            ELSE 0.30
        END,
        2
    ) AS nett_profit
FROM
    `rapid-hangar-513313-v4.kimia_farma.kf_final_transaction`
LIMIT 10;