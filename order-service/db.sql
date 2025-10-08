CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'created', -- created, paid, ready, prepared
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'pending', -- pending, completed, failed
    transaction_id VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    price DECIMAL(10,2) NOT NULL
);

CREATE TABLE inventory_reservations (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL REFERENCES products(id),
    quantity INT NOT NULL,
    status VARCHAR(50) DEFAULT 'reserved', -- reserved, released
    created_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE barista_orders (
    id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'waiting', -- waiting, prepared, delivered
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE notifications (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    order_id INT,
    message TEXT NOT NULL,
    status VARCHAR(50) DEFAULT 'pending', -- pending, sent, failed
    created_at TIMESTAMP DEFAULT NOW(),
    sent_at TIMESTAMP
);