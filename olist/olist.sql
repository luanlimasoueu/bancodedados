-- Conecte na database olist antes de continuar

-- https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce

-- =========================================
-- TABELA DE CLIENTES
-- =========================================

-- =========================================
-- CRIAR DATABASE
-- =========================================

CREATE DATABASE olist_transations;

CREATE TABLE olist_geolocation_dataset (
    geolocation_zip_code_prefix  VARCHAR(10)     NOT NULL,
    geolocation_lat              NUMERIC(18, 15) NOT NULL,
    geolocation_lng              NUMERIC(18, 15) NOT NULL,
    geolocation_city             VARCHAR(100)    NOT NULL,
    geolocation_state            CHAR(2)         NOT NULL
)

-- ============================================================
-- 2. CUSTOMERS
-- ============================================================

CREATE TABLE olist_order_customer_dataset (
    customer_id              UUID        NOT NULL,
    customer_unique_id       UUID        NOT NULL,
    customer_zip_code_prefix VARCHAR(10) NOT NULL,
    customer_city            VARCHAR(100),
    customer_state           CHAR(2)
)


-- ============================================================
-- 3. SELLERS
-- ============================================================

CREATE TABLE olist_sellers_dataset (
    seller_id              UUID        NOT NULL,
    seller_zip_code_prefix VARCHAR(10) NOT NULL,
    seller_city            VARCHAR(100),
    seller_state           CHAR(2)
    --PRIMARY KEY (seller_id),
    --FOREIGN KEY (seller_zip_code_prefix)
        --REFERENCES olist_geolocation_dataset (geolocation_zip_code_prefix)
        --ON UPDATE CASCADE ON DELETE RESTRICT
)

-- ============================================================
-- 4. PRODUCT CATEGORY TRANSLATION
-- ============================================================
---CREATE TABLE product_category_name_translation (
    ---product_category_name         VARCHAR(100) NOT NULL,
    ---product_category_name_english VARCHAR(100) NOT NULL
---)

-- ============================================================
-- 5. PRODUCTS
-- ============================================================
CREATE TABLE olist_products_dataset (
    product_id                 UUID         NOT NULL,
    product_category_name      VARCHAR(100),
    product_name_lenght        INTEGER,
    product_description_lenght INTEGER,
    product_photos_qty         SMALLINT,
    product_weight_g           NUMERIC(10, 2),
    product_length_cm          NUMERIC(8, 2),
    product_height_cm          NUMERIC(8, 2),
    product_width_cm           NUMERIC(8, 2)
)


-- ============================================================
-- 6. ORDERS
-- ============================================================

CREATE TABLE olist_orders_dataset (
    order_id                        UUID                        NOT NULL,
    customer_id                     UUID                        NOT NULL,
    order_status                    VARCHAR(30)                 NOT NULL,
    order_purchase_timestamp        TIMESTAMP WITHOUT TIME ZONE,
    order_approved_at               TIMESTAMP WITHOUT TIME ZONE,
    order_delivered_carrier_date    TIMESTAMP WITHOUT TIME ZONE,
    order_delivered_customer_date   TIMESTAMP WITHOUT TIME ZONE,
    order_estimated_delivery_date   TIMESTAMP WITHOUT TIME ZONE
)

-- ============================================================
-- 7. ORDER ITEMS
-- ============================================================
CREATE TABLE olist_order_items_dataset (
    order_id             UUID           NOT NULL,
    order_item_id        SMALLINT       NOT NULL,
    product_id           UUID           NOT NULL,
    seller_id            UUID           NOT NULL,
    shipping_limit_date  TIMESTAMP WITHOUT TIME ZONE,
    price                NUMERIC(10, 2) NOT NULL,
    freight_value        NUMERIC(10, 2) NOT NULL
)



-- ============================================================
-- 8. ORDER PAYMENTS
-- ============================================================
CREATE TABLE olist_order_payments_dataset (
    order_id              UUID           NOT NULL,
    payment_sequential    SMALLINT       NOT NULL,
    payment_type          VARCHAR(30)    NOT NULL,
    payment_installments  SMALLINT       NOT NULL DEFAULT 1,
    payment_value         NUMERIC(10, 2) NOT NULL
)


-- ============================================================
-- 9. ORDER REVIEWS
-- ============================================================
DROP TABLE IF EXISTS olist_order_reviews_dataset;

-- CRIAR TABELA NOVA
CREATE TABLE olist_order_reviews_dataset (
    review_id               UUID,
    order_id                UUID,
    review_score            SMALLINT,
    review_comment_title    VARCHAR(255),
    review_comment_message  TEXT,
    review_creation_date    TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);


DROP TABLE IF EXISTS product_category_name_translation ;

-- CRIAR TABELA
CREATE TABLE product_category_name_translation (
    product_category_name         VARCHAR(100),
    product_category_name_english VARCHAR(100)
);

-- PRIMARY KEY
ALTER TABLE product_category_name_translation
    ADD PRIMARY KEY (product_category_name);

-- FOREIGN KEY (products → category translation)
ALTER TABLE olist_products_dataset
    ADD FOREIGN KEY (product_category_name)
    REFERENCES product_category_name_translation (product_category_name);
	

---select * from olist_order_reviews_dataset

ALTER TABLE olist_geolocation_dataset
    ADD PRIMARY KEY (geolocation_zip_code_prefix);


ALTER TABLE olist_order_customer_dataset
    ADD PRIMARY KEY (customer_id);

ALTER TABLE olist_sellers_dataset
    ADD PRIMARY KEY (seller_id);

--ALTER TABLE product_category_name_translation
--    ADD PRIMARY KEY (product_category_name);

ALTER TABLE olist_products_dataset
    ADD PRIMARY KEY (product_id);

ALTER TABLE olist_orders_dataset
    ADD PRIMARY KEY (order_id);

ALTER TABLE olist_order_items_dataset
    ADD PRIMARY KEY (order_id, order_item_id);

ALTER TABLE olist_order_payments_dataset
    ADD PRIMARY KEY (order_id, payment_sequential);

ALTER TABLE olist_order_reviews_dataset
    ADD PRIMARY KEY (review_id);



-- customers → geolocation
ALTER TABLE olist_order_customer_dataset
    ADD FOREIGN KEY (customer_zip_code_prefix)
    REFERENCES olist_geolocation_dataset (geolocation_zip_code_prefix);

-- sellers → geolocation
ALTER TABLE olist_sellers_dataset
    ADD FOREIGN KEY (seller_zip_code_prefix)
    REFERENCES olist_geolocation_dataset (geolocation_zip_code_prefix);

-- orders → customers
ALTER TABLE olist_orders_dataset
    ADD FOREIGN KEY (customer_id)
    REFERENCES olist_order_customer_dataset (customer_id);

-- order items → orders
ALTER TABLE olist_order_items_dataset
    ADD FOREIGN KEY (order_id)
    REFERENCES olist_orders_dataset (order_id);

-- order items → products
ALTER TABLE olist_order_items_dataset
    ADD FOREIGN KEY (product_id)
    REFERENCES olist_products_dataset (product_id);

-- order items → sellers
ALTER TABLE olist_order_items_dataset
    ADD FOREIGN KEY (seller_id)
    REFERENCES olist_sellers_dataset (seller_id);

-- payments → orders
ALTER TABLE olist_order_payments_dataset
    ADD FOREIGN KEY (order_id)
    REFERENCES olist_orders_dataset (order_id);

-- reviews → orders
ALTER TABLE olist_order_reviews_dataset
    ADD FOREIGN KEY (order_id)
    REFERENCES olist_orders_dataset (order_id);



