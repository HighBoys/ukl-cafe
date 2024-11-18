-- CreateTable
CREATE TABLE `Admin` (
    `adminID` INTEGER NOT NULL AUTO_INCREMENT,
    `namaAdmin` VARCHAR(191) NOT NULL DEFAULT '',
    `emailAdmin` VARCHAR(191) NOT NULL DEFAULT '',
    `passwordAdmin` VARCHAR(191) NOT NULL DEFAULT '',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`adminID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cust` (
    `idcust` INTEGER NOT NULL AUTO_INCREMENT,
    `namaCust` VARCHAR(191) NOT NULL DEFAULT '',
    `emailCust` VARCHAR(191) NOT NULL DEFAULT '',
    `passwordCust` VARCHAR(191) NOT NULL DEFAULT '',
    `notelepon` VARCHAR(191) NOT NULL DEFAULT '',
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idcust`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `penerbangan` (
    `idp` INTEGER NOT NULL AUTO_INCREMENT,
    `tujuan` VARCHAR(191) NOT NULL DEFAULT '',
    `tanggal` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `harga` INTEGER NOT NULL DEFAULT 0,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updateAt` DATETIME(3) NOT NULL,

    PRIMARY KEY (`idp`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `transaksi` (
    `idt` INTEGER NOT NULL AUTO_INCREMENT,
    `idp` INTEGER NOT NULL DEFAULT 0,
    `idcust` INTEGER NOT NULL DEFAULT 0,
    `tanggal` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `total_bayar` INTEGER NOT NULL DEFAULT 0,

    PRIMARY KEY (`idt`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `detail_transaksi` (
    `id_detail_transaksi` INTEGER NOT NULL AUTO_INCREMENT,
    `idt` INTEGER NOT NULL DEFAULT 0,
    `nama_penumpang` VARCHAR(191) NOT NULL DEFAULT '',
    `baris_kursi` VARCHAR(191) NOT NULL DEFAULT '',
    `nomer_kursi` VARCHAR(191) NOT NULL DEFAULT '',

    PRIMARY KEY (`id_detail_transaksi`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `transaksi` ADD CONSTRAINT `transaksi_idcust_fkey` FOREIGN KEY (`idcust`) REFERENCES `cust`(`idcust`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `transaksi` ADD CONSTRAINT `transaksi_idp_fkey` FOREIGN KEY (`idp`) REFERENCES `penerbangan`(`idp`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `detail_transaksi` ADD CONSTRAINT `detail_transaksi_idt_fkey` FOREIGN KEY (`idt`) REFERENCES `transaksi`(`idt`) ON DELETE RESTRICT ON UPDATE CASCADE;
