import express from "express";
import { verifyAddOrder } from "../middleware/verifyOrder";
import { createOrder, dropOrder, getAllOrder } from "../controller/orderController";

const app = express()

app.use(express.json())
app.get(`/`, getAllOrder)
app.post(`/`, [verifyAddOrder], createOrder)
app.delete(`/`, dropOrder)

export default app