/*
  Warnings:

  - The primary key for the `admin` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `adminID` on the `admin` table. All the data in the column will be lost.
  - You are about to drop the column `emailAdmin` on the `admin` table. All the data in the column will be lost.
  - You are about to drop the column `namaAdmin` on the `admin` table. All the data in the column will be lost.
  - You are about to drop the column `passwordAdmin` on the `admin` table. All the data in the column will be lost.
  - You are about to drop the column `updateAt` on the `admin` table. All the data in the column will be lost.
  - You are about to drop the `cust` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `detail_transaksi` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `penerbangan` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `transaksi` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `id` to the `Admin` table without a default value. This is not possible if the table is not empty.
  - Added the required column `updatedAt` to the `Admin` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `detail_transaksi` DROP FOREIGN KEY `detail_transaksi_idt_fkey`;

-- DropForeignKey
ALTER TABLE `transaksi` DROP FOREIGN KEY `transaksi_idcust_fkey`;

-- DropForeignKey
ALTER TABLE `transaksi` DROP FOREIGN KEY `transaksi_idp_fkey`;

-- AlterTable
ALTER TABLE `admin` DROP PRIMARY KEY,
    DROP COLUMN `adminID`,
    DROP COLUMN `emailAdmin`,
    DROP COLUMN `namaAdmin`,
    DROP COLUMN `passwordAdmin`,
    DROP COLUMN `updateAt`,
    ADD COLUMN `email` VARCHAR(191) NOT NULL DEFAULT '',
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD COLUMN `name` VARCHAR(191) NOT NULL DEFAULT '',
    ADD COLUMN `password` VARCHAR(191) NOT NULL DEFAULT '',
    ADD COLUMN `updatedAt` DATETIME(3) NOT NULL,
    ADD PRIMARY KEY (`id`);

-- DropTable
DROP TABLE `cust`;

-- DropTable
DROP TABLE `detail_transaksi`;

-- DropTable
DROP TABLE `penerbangan`;

-- DropTable
DROP TABLE `transaksi`;

-- CreateTable
CREATE TABLE `Coffee` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL DEFAULT '',
    `price` DOUBLE NOT NULL DEFAULT 0,
    `size` VARCHAR(191) NOT NULL DEFAULT '',
    `image` VARCHAR(191) NOT NULL DEFAULT '',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderDetail` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `quantity` INTEGER NOT NULL DEFAULT 0,
    `price` DOUBLE NOT NULL DEFAULT 0,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `order_id` INTEGER NOT NULL DEFAULT 0,
    `coffee_id` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderList` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customerName` VARCHAR(191) NOT NULL DEFAULT '',
    `order_type` VARCHAR(191) NOT NULL DEFAULT '',
    `order_date` VARCHAR(191) NOT NULL DEFAULT '',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `OrderDetail` ADD CONSTRAINT `OrderDetail_order_id_fkey` FOREIGN KEY (`order_id`) REFERENCES `OrderList`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderDetail` ADD CONSTRAINT `OrderDetail_coffee_id_fkey` FOREIGN KEY (`coffee_id`) REFERENCES `Coffee`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
