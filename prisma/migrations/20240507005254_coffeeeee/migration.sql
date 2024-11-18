-- DropForeignKey
ALTER TABLE `orderdetail` DROP FOREIGN KEY `OrderDetail_coffee_id_fkey`;

-- DropForeignKey
ALTER TABLE `orderdetail` DROP FOREIGN KEY `OrderDetail_order_id_fkey`;

-- AddForeignKey
ALTER TABLE `orderDetail` ADD CONSTRAINT `orderDetail_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `orderList`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `orderDetail` ADD CONSTRAINT `orderDetail_coffee_id_fkey` FOREIGN KEY (`coffee_id`) REFERENCES `coffee`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
