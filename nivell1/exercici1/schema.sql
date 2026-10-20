DROP TABLE IF EXISTS SaleLine;
DROP TABLE IF EXISTS Sale;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Glasses;
DROP TABLE IF EXISTS Brand;
DROP TABLE IF EXISTS Supplier;

CREATE TABLE Supplier (
    supplier_id    INT AUTO_INCREMENT PRIMARY KEY,
    name           VARCHAR(100) NOT NULL,
    street         VARCHAR(150) NOT NULL,
    street_number  VARCHAR(10) NOT NULL,
    floor          VARCHAR(20),
    door           VARCHAR(10),
    city           VARCHAR(100) NOT NULL,
    postcode       VARCHAR(15) NOT NULL,
    country        VARCHAR(60) NOT NULL,
    phone          VARCHAR(25) NOT NULL,
    fax            VARCHAR(25),
    tax_id         VARCHAR(20) NOT NULL UNIQUE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE Brand (
    brand_id     INT AUTO_INCREMENT PRIMARY KEY,
    name         VARCHAR(100) NOT NULL,
    supplier_id  INT NOT NULL,

    CONSTRAINT fk_brand_supplier
        FOREIGN KEY (supplier_id)
        REFERENCES Supplier (supplier_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE Glasses (
    glasses_id           INT AUTO_INCREMENT PRIMARY KEY,
    brand_id             INT NOT NULL,
    frame_type           ENUM('rimless', 'acetate', 'metal') NOT NULL,
    frame_colour         VARCHAR(40) NOT NULL,
    lens_1_prescription  DECIMAL(5, 2) NOT NULL,
    lens_1_colour        VARCHAR(40) NOT NULL,
    lens_2_prescription  DECIMAL(5, 2) NOT NULL,
    lens_2_colour        VARCHAR(40) NOT NULL,
    price                DECIMAL(10, 2) NOT NULL,

    CONSTRAINT fk_glasses_brand
        FOREIGN KEY (brand_id)
        REFERENCES Brand (brand_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE Customer (
    customer_id           INT AUTO_INCREMENT PRIMARY KEY,
    referrer_customer_id  INT NULL,
    name                  VARCHAR(150) NOT NULL,
    postal_address        VARCHAR(255) NOT NULL,
    phone                 VARCHAR(25) NOT NULL,
    email                 VARCHAR(254) NOT NULL,
    registration_date     DATE NOT NULL,

    CONSTRAINT fk_customer_referrer
        FOREIGN KEY (referrer_customer_id)
        REFERENCES Customer (customer_id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE Employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name        VARCHAR(150) NOT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE Sale (
    sale_id      INT AUTO_INCREMENT PRIMARY KEY,
    customer_id  INT NOT NULL,
    sale_date    DATE NOT NULL,

    CONSTRAINT fk_sale_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customer (customer_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE SaleLine (
    sale_line_id    INT AUTO_INCREMENT PRIMARY KEY,
    sale_id         INT NOT NULL,
    glasses_id      INT NOT NULL,
    employee_id     INT NOT NULL,
    quantity        INT NOT NULL,
    unit_price_eur  DECIMAL(10, 2) NOT NULL,

    CONSTRAINT fk_sale_line_sale
        FOREIGN KEY (sale_id)
        REFERENCES Sale (sale_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_sale_line_glasses
        FOREIGN KEY (glasses_id)
        REFERENCES Glasses (glasses_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_sale_line_employee
        FOREIGN KEY (employee_id)
        REFERENCES Employee (employee_id)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;
