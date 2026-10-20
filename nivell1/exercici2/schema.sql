DROP TABLE IF EXISTS CustomerOrderLine;
DROP TABLE IF EXISTS CustomerOrder;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS PizzaCategory;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Shop;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Locality;
DROP TABLE IF EXISTS Province;

CREATE TABLE Province (
    province_id  INT AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(100) NOT NULL UNIQUE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE Locality (
    locality_id  INT AUTO_INCREMENT PRIMARY KEY,
    province_id  INT NOT NULL,
    name         VARCHAR(100) NOT NULL,

    CONSTRAINT fk_locality_province
        FOREIGN KEY (province_id)
        REFERENCES Province (province_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE Customer (
    customer_id  INT AUTO_INCREMENT PRIMARY KEY,
    locality_id  INT NOT NULL,
    first_name   VARCHAR(100) NOT NULL,
    surname      VARCHAR(150) NOT NULL,
    address      VARCHAR(255) NOT NULL,
    postcode     VARCHAR(15) NOT NULL,
    phone        VARCHAR(25) NOT NULL,

    CONSTRAINT fk_customer_locality
        FOREIGN KEY (locality_id)
        REFERENCES Locality (locality_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE Shop (
    shop_id      INT AUTO_INCREMENT PRIMARY KEY,
    locality_id  INT NOT NULL,
    address      VARCHAR(255) NOT NULL,
    postcode     VARCHAR(15) NOT NULL,

    CONSTRAINT fk_shop_locality
        FOREIGN KEY (locality_id)
        REFERENCES Locality (locality_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE Employee (
    employee_id  INT AUTO_INCREMENT PRIMARY KEY,
    shop_id      INT NOT NULL,
    first_name   VARCHAR(100) NOT NULL,
    surname      VARCHAR(150) NOT NULL,
    tax_id       VARCHAR(20) NOT NULL UNIQUE,
    phone        VARCHAR(25) NOT NULL,
    role         ENUM('cook', 'delivery_driver') NOT NULL,

    CONSTRAINT fk_employee_shop
        FOREIGN KEY (shop_id)
        REFERENCES Shop (shop_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE PizzaCategory (
    pizza_category_id  INT AUTO_INCREMENT PRIMARY KEY,
    name               VARCHAR(100) NOT NULL UNIQUE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE Product (
    product_id         INT AUTO_INCREMENT PRIMARY KEY,
    pizza_category_id  INT NULL,
    product_type       ENUM('pizza', 'burger', 'drink') NOT NULL,
    name               VARCHAR(100) NOT NULL,
    description        VARCHAR(500) NOT NULL,
    image              VARCHAR(255) NOT NULL,
    price              DECIMAL(10, 2) NOT NULL,

    -- MySQL does not allow referential actions on columns used in a CHECK constraint
    CONSTRAINT fk_product_pizza_category
        FOREIGN KEY (pizza_category_id)
        REFERENCES PizzaCategory (pizza_category_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,

    CONSTRAINT chk_product_pizza_category
        CHECK (
            (product_type = 'pizza' AND pizza_category_id IS NOT NULL)
            OR (product_type <> 'pizza' AND pizza_category_id IS NULL)
        )
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE CustomerOrder (
    customer_order_id        INT AUTO_INCREMENT PRIMARY KEY,
    customer_id              INT NOT NULL,
    shop_id                  INT NOT NULL,
    delivery_employee_id     INT NULL,
    customer_order_datetime  DATETIME NOT NULL,
    customer_order_type      ENUM('home_delivery', 'shop_collection') NOT NULL,
    total_price              DECIMAL(10, 2) NOT NULL,
    delivery_datetime        DATETIME NULL,

    CONSTRAINT fk_customer_order_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customer (customer_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_customer_order_shop
        FOREIGN KEY (shop_id)
        REFERENCES Shop (shop_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    -- MySQL does not allow referential actions on columns used in a CHECK constraint
    CONSTRAINT fk_customer_order_delivery_employee
        FOREIGN KEY (delivery_employee_id)
        REFERENCES Employee (employee_id)
        ON UPDATE RESTRICT
        ON DELETE RESTRICT,

    CONSTRAINT chk_customer_order_delivery
        CHECK (
            customer_order_type = 'home_delivery'
            OR (delivery_employee_id IS NULL AND delivery_datetime IS NULL)
        )
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE CustomerOrderLine (
    customer_order_line_id  INT AUTO_INCREMENT PRIMARY KEY,
    customer_order_id       INT NOT NULL,
    product_id              INT NOT NULL,
    quantity                INT NOT NULL,

    CONSTRAINT fk_customer_order_line_customer_order
        FOREIGN KEY (customer_order_id)
        REFERENCES CustomerOrder (customer_order_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_customer_order_line_product
        FOREIGN KEY (product_id)
        REFERENCES Product (product_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT chk_customer_order_line_quantity
        CHECK (quantity > 0)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
