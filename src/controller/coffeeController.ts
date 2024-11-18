import { PrismaClient } from "@prisma/client";
import { Request, Response } from "express";
import { BASE_URL } from "../global";
import fs from "fs";

const prisma = new PrismaClient({ errorFormat: "pretty" });

export const createCoffee = async (request: Request, response: Response) => {
  try {
    const { name, price, size } = request.body;

    let filename = "";
    if (request.file) filename = request.file.filename;

    const newCoffee = await prisma.coffee.create({
      data: { name, price: Number(price), size, image: filename },
    });

    return response
      .json({
        status: true,
        data: newCoffee,
        message: `New Coffee has created`,
      })
      .status(200);
  } catch (error) {
    return response
      .json({
        status: false,
        message: `There is an error. ${error}`,
      })
      .status(400);
  }
};

export const getAllCoffee = async (request: Request, response: Response) => {
  try {
    const { search } = request.query;
    const allCoffee = await prisma.coffee.findMany({
      where: {
        OR: [
          { name: { contains: search?.toString() || "" } },
          { size: { contains: search?.toString() || "" } },
        ],
      },
    });
    return response
      .json({
        status: true,
        data: allCoffee,
        message: `Coffee has retrieved`,
      })
      .status(200);
  } catch (error) {
    return response
      .json({
        status: false,
        message: `There is an error. ${error}`,
      })
      .status(400);
  }
};

export const updateCoffee = async (request: Request, response: Response) => {
  try {
    const { id } = request.params;
    const { name, price, size } = request.body;

    const findCoffee = await prisma.coffee.findFirst({
      where: { id: Number(id) },
    });
    if (!findCoffee)
      return response
        .status(200)
        .json({ status: false, message: `coffee is not found` });

    let filename = findCoffee.image;
    if (request.file) {
      filename = request.file.filename;
      let path = `${BASE_URL}/public/coffee-image/${findCoffee.image}`;
      let exists = fs.existsSync(path);
      if (exists && findCoffee.image !== ``) fs.unlinkSync(path);
    }

    const updatedCoffee = await prisma.coffee.update({
      data: {
        name: name || findCoffee.name,
        price: price ? Number(price) : findCoffee.price,
        size: size || findCoffee.size,
        image: filename,
      },
      where: { id: Number(id) },
    });

    return response
      .json({
        status: true,
        data: updatedCoffee,
        message: `coffee has updated`,
      })
      .status(200);
  } catch (error) {
    return response
      .json({
        status: false,
        message: `There is an error. ${error}`,
      })
      .status(400);
  }
};

export const dropCoffee = async (request: Request, response: Response) => {
  try {
    const { id } = request.params;

    const findCoffee = await prisma.coffee.findFirst({
      where: { id: Number(id) },
    });
    if (!findCoffee)
      return response
        .status(200)
        .json({ status: false, message: `Egg is not found` });

    let path = `${BASE_URL}/public/coffee-image/${findCoffee.image}`;
    let exists = fs.existsSync(path);
    if (exists && findCoffee.image !== ``) fs.unlinkSync(path);

    const deletedCoffee = await prisma.coffee.delete({
      where: { id: Number(id) },
    });
    return response
      .json({
        status: true,
        data: deletedCoffee,
        message: `coffee has deleted`,
      })
      .status(200);
  } catch (error) {
    return response
      .json({
        status: false,
        message: `There is an error. ${error}`,
      })
      .status(400);
  }
};
