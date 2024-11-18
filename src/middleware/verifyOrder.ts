import { NextFunction, Request, Response } from 'express'
import Joi from 'joi'

const orderDetailSchema = Joi.object({
    //order_id: Joi.number().required(),
    coffee_id: Joi.number().required(),
    price: Joi.number().min(1).required(),
    quantity: Joi.number().min(1).required(),
})

const addDataSchema = Joi.object({
    customerName: Joi.string().required(),
    order_type: Joi.string().required(),
    order_date: Joi.string().required(),
    orderDetail: Joi.array().items(orderDetailSchema).min(1).required(),
})

export const verifyAddOrder = (request: Request, response: Response, next: NextFunction) => {
    const { error } = addDataSchema.validate(request.body, { abortEarly: false })

    if (error) {
        return response.status(400).json({
            status: false,
            message: error.details.map(it => it.message).join()
        })
    }
    return next()
}
