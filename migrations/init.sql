CREATE TABLE IF NOT EXISTS item (
   id INT NOT NULL AUTO_INCREMENT,
   name VARCHAR(256) NOT NULL,
   description VARCHAR(512) NOT NULL,
   price DECIMAL(6,2) NOT NULL,
   updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
   created_at TIMESTAMP NOT NULL DEFAULT NOW(),

   PRIMARY KEY (id)
);

INSERT INTO item (name, description, price)
VALUES('Layflat Photo Album', 'Drawing on time-honored binding techniques, the Layflat Album features ultra-thick pages that lay flat when open for seamless panoramic impact.', 149.00),
      ('Hardcover Photo Book', 'An archival-quality photo book printed on 100% recycled pages and complete with a customizable dust jacket.', 69.00),
      ('Baby Book', 'A one-of-a-kind, interactive photo journal filled with thoughtful prompts to help document baby’s first years. Celebrated for its timeless design and premium materials, each baby book includes a unique code for a free set of Everyday Prints.', 99.00),
      ('Everyday Print Set', 'With their high-quality look and feel, these textured, matte prints are designed to honor the everyday.', 9.00),
      ('Ultra-Thick Signature Prints', 'Inspired by the lost art of signing our work, we set out to create a print that felt like a museum quality mat and premium print – all in one. The result: an ultra thick print with a textured matte eggshell finish.', 30.00),
      ('Gallery Frames', 'Premium paper, an ultra-thick mat, and a range of sophisticated cuts elevate this museum-quality display crafted from real hardwood. The Gallery Frame includes a high-resolution, archival giclée print and arrives ready to hang in your choice of four classic finishes.', 69.00),
      ('Modern Metal Frames', 'Put meaningful moments front and center in a simple, elevated frame that makes the ideal centerpiece or gallery-wall addition. Handcrafted in the USA, the Modern Metal Frame arrives ready to hang, featuring your choice of three premium finishes and an archival-quality giclée print.', 69.00);

CREATE TABLE IF NOT EXISTS cart (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    item_id INT NOT NULL,
    count SMALLINT NOT NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    created_at TIMESTAMP NOT NULL DEFAULT NOW(),

    PRIMARY KEY (id),

    FOREIGN KEY (item_id)
        REFERENCES item(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    INDEX cart_user_id_idx (item_id)
);
