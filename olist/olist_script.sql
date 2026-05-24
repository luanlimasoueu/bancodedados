CREATE DATABASE olist;


CREATE TABLE olist_geolocation_dataset (
    geolocation_zip_code_prefix  VARCHAR(10)     NOT NULL,
    geolocation_lat              NUMERIC(18, 15) NOT NULL,
    geolocation_lng              NUMERIC(18, 15) NOT NULL,
    geolocation_city             VARCHAR(100)    NOT NULL,
    geolocation_state            CHAR(2)         NOT NULL
);


CREATE TABLE olist_order_customer_dataset (
    customer_id              UUID        NOT NULL,
    customer_unique_id       UUID        NOT NULL,
    customer_zip_code_prefix VARCHAR(10) NOT NULL,
    customer_city            VARCHAR(100),
    customer_state           CHAR(2)
);



CREATE TABLE olist_sellers_dataset (
    seller_id              UUID        NOT NULL,
    seller_zip_code_prefix VARCHAR(10) NOT NULL,
    seller_city            VARCHAR(100),
    seller_state           CHAR(2)
);

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
);

CREATE TABLE olist_orders_dataset (
    order_id                        UUID                        NOT NULL,
    customer_id                     UUID                        NOT NULL,
    order_status                    VARCHAR(30)                 NOT NULL,
    order_purchase_timestamp        TIMESTAMP WITHOUT TIME ZONE,
    order_approved_at               TIMESTAMP WITHOUT TIME ZONE,
    order_delivered_carrier_date    TIMESTAMP WITHOUT TIME ZONE,
    order_delivered_customer_date   TIMESTAMP WITHOUT TIME ZONE,
    order_estimated_delivery_date   TIMESTAMP WITHOUT TIME ZONE
);

CREATE TABLE olist_order_items_dataset (
    order_id             UUID           NOT NULL,
    order_item_id        SMALLINT       NOT NULL,
    product_id           UUID           NOT NULL,
    seller_id            UUID           NOT NULL,
    shipping_limit_date  TIMESTAMP WITHOUT TIME ZONE,
    price                NUMERIC(10, 2) NOT NULL,
    freight_value        NUMERIC(10, 2) NOT NULL
);


CREATE TABLE olist_order_payments_dataset (
    order_id              UUID           NOT NULL,
    payment_sequential    SMALLINT       NOT NULL,
    payment_type          VARCHAR(30)    NOT NULL,
    payment_installments  SMALLINT       NOT NULL DEFAULT 1,
    payment_value         NUMERIC(10, 2) NOT NULL
);


CREATE TABLE olist_order_reviews_dataset (
    review_id               UUID,
    order_id                UUID,
    review_score            SMALLINT,
    review_comment_title    VARCHAR(255),
    review_comment_message  TEXT,
    review_creation_date    TIMESTAMP,
    review_answer_timestamp TIMESTAMP
);


CREATE TABLE product_category_name_translation (
    product_category_name         VARCHAR(100),
    product_category_name_english VARCHAR(100)
);

COPY product_category_name_translation (product_category_name, product_category_name_english)
FROM 'seucaminho/product_category_name_translation.csv'
DELIMITER ','
CSV HEADER;


COPY olist_geolocation_dataset (geolocation_zip_code_prefix, geolocation_lat, geolocation_lng, geolocation_city, geolocation_state)
FROM 'seucaminho/olist_geolocation_dataset.csv'
DELIMITER ',' CSV HEADER;


COPY  olist_order_customer_dataset (customer_id, customer_unique_id, customer_zip_code_prefix, customer_city, customer_state)
FROM 'seucaminho/olist_order_customer_dataset.csv'
DELIMITER ',' 
CSV HEADER;


COPY olist_sellers_dataset (seller_id, seller_zip_code_prefix, seller_city, seller_state)
FROM 'seucaminho/olist_sellers_dataset.csv'
DELIMITER ',' CSV HEADER;


COPY olist_products_dataset (product_id, product_category_name, product_name_lenght, product_description_lenght, product_photos_qty, product_weight_g, product_length_cm, product_height_cm, product_width_cm)
FROM 'seucaminho/olist_products_dataset.csv'
DELIMITER ',' CSV HEADER;


COPY olist_orders_dataset (order_id, customer_id, order_status, order_purchase_timestamp, order_approved_at, order_delivered_carrier_date, order_delivered_customer_date, order_estimated_delivery_date)
FROM 'seucaminho/olist_orders_dataset.csv'
DELIMITER ',' CSV HEADER;


COPY olist_order_items_dataset (order_id, order_item_id, product_id, seller_id, shipping_limit_date, price, freight_value)
FROM 'seucaminho/olist_order_items_dataset.csv'
DELIMITER ',' CSV HEADER;


COPY olist_order_payments_dataset (order_id, payment_sequential, payment_type, payment_installments, payment_value)
FROM 'seucaminho/olist_order_payments_dataset.csv'
DELIMITER ',' CSV HEADER;


COPY  olist_order_reviews_dataset (review_id, order_id, review_score, review_comment_title, review_comment_message, review_creation_date, review_answer_timestamp)
FROM 'seucaminho/olist_order_reviews_dataset.csv'
DELIMITER ',' CSV HEADER;


select * from olist_order_reviews_dataset;

