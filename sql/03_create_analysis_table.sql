
-- =====================================================
-- PROJECT: KIMIA FARMA DATA ANALYST
-- BAGIAN 3: CREATE ANALYSIS TABLE (REVISI)
-- =====================================================

CREATE OR REPLACE TABLE
`rapid-hangar-513313-v4.kimia_farma.kf_analisa`
AS

SELECT
    -- DATA TRANSAKSI
    t.transaction_id,
    t.date,
    t.branch_id,

    -- IDENTITAS CABANG
    CONCAT(
        c.kota, ' - ', CAST(c.branch_id AS STRING)
    ) AS nama_cabang,

    -- DATA KANTOR CABANG
    c.branch_name,
    c.kota,
    c.provinsi,
    c.rating AS rating_cabang,

    -- DATA CUSTOMER DAN PRODUK
    t.customer_name,
    t.product_id,
    p.product_name,

    -- HARGA DAN DISKON
    t.price AS actual_price,
    t.discount_percentage,

    -- PERSENTASE GROSS LABA
    CASE
        WHEN t.price <= 50000 THEN 0.10
        WHEN t.price <= 100000 THEN 0.15
        WHEN t.price <= 300000 THEN 0.20
        WHEN t.price <= 500000 THEN 0.25
        ELSE 0.30
    END AS persentase_gross_laba,

    -- NETT SALES
    ROUND(
        t.price * (1 - t.discount_percentage), 2
    ) AS nett_sales,

    -- NETT PROFIT
    ROUND(
        t.price * (1 - t.discount_percentage) *
        CASE
            WHEN t.price <= 50000 THEN 0.10
            WHEN t.price <= 100000 THEN 0.15
            WHEN t.price <= 300000 THEN 0.20
            WHEN t.price <= 500000 THEN 0.25
            ELSE 0.30
        END,
        2
    ) AS nett_profit,

    -- RATING TRANSAKSI
    t.rating AS rating_transaksi

FROM
    `rapid-hangar-513313-v4.kimia_farma.kf_final_transaction` t

JOIN
    `rapid-hangar-513313-v4.kimia_farma.kf_product` p
    ON t.product_id = p.product_id

JOIN
    `rapid-hangar-513313-v4.kimia_farma.kf_kantor_cabang` c
    ON t.branch_id = c.branch_id;
