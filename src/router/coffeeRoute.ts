import express from "express";
import {
  createCoffee,
  dropCoffee,
  getAllCoffee,
  updateCoffee,
} from "../controller/coffeeController";
import { verifyAddCoffee, verifyEditCoffee } from "../middleware/verifyCoffee";
import uploadFile from "../middleware/uploadImagecoffee";
import { verifyToken } from "../middleware/authorization";

const app = express();

app.use(express.json());

app.get(`/`, [verifyToken], getAllCoffee);
app.post(`/`, [verifyToken, uploadFile.single("image"),verifyAddCoffee], createCoffee);
app.put(`/:id`, [verifyToken, uploadFile.single("image"),verifyEditCoffee], updateCoffee);
app.delete(`/:id`, [verifyToken], dropCoffee);

export default app;
