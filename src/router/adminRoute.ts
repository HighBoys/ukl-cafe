import express from "express";
import { authentication, createAdmin, dropAdmin, getAdmin, updateAdmin } from "../controller/adminController";
import { verifyAddAdmin, verifyAuthentication,  } from "../middleware/verifyAdmin";
import { verifyToken } from "../middleware/authorization";

const app = express()

app.use(express.json())

app.get(`/`,verifyToken, getAdmin)
app.post(`/`,verifyToken, createAdmin)
app.put(`/:id`,verifyToken, updateAdmin)
app.delete(`/:id`,verifyToken, dropAdmin)
app.post(`/auth`,verifyAuthentication, authentication)

export default app
