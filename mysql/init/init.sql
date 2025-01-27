CREATE TABLE `products` (
  `product_id` varchar(10) NOT NULL,
  `product_name` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sales_data` (
  `tid` int NOT NULL AUTO_INCREMENT,
  `timestamp` datetime DEFAULT NULL,
  `productId` varchar(45) DEFAULT NULL,
  `productName` varchar(45) DEFAULT NULL,
  `storeId` varchar(45) DEFAULT NULL,
  `customerId` varchar(45) DEFAULT NULL,
  `customerAge` int DEFAULT NULL,
  `unitPrice` float DEFAULT NULL,
  `quantiry` int DEFAULT NULL,
  `total` float DEFAULT NULL,
  PRIMARY KEY (`tid`),
  UNIQUE KEY `tid_UNIQUE` (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `products` (`product_id`, `product_name`, `category`, `unit_price`) VALUES 
    ('P_102','Samsung S24','Smart Phone',1200),
    ('P_105','Dell XBook 7','Laptops',2300),
    ('P_216','Lenovo X1','Latops',2400);