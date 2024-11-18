import express from "express";
import cors from "cors";
import adminRoute from "./router/adminRoute";
import coffeeRoute from "./router/coffeeRoute"
import orderRoute from "./router/orderRoute";

const app = express()
const PORT: Number = 8000

app.use(cors())

app.use(`/admin`, adminRoute)
app.use(`/coffee`, coffeeRoute)
app.use(`/order`, orderRoute)


app.listen(PORT, () => console.log(`server coffee run on port ${PORT}`))
