import { Router } from "express";
import {getClientes, deleteCliente} from '../controllers/clientes.js';

const router = Router();

/**
 * @swagger
 * tags:
 *     name: Clientes
 *    description: Clientes API
 * */

router.get('/clientes', getClientes);

/**
 * @swagger
 * /clientes:
 * get:
 * summary: Carga la lista de clientes.
 * tags: [Clientes]
 * */

router.delete('/clientes/:id', deleteCliente);

/**
 * @swagger
 * /clientes/{id}:
 * delete:
 * summary: Elimina un cliente.
 * tags: [Clientes]
 * parameters:
 *     - in: path
 *      name: id
 *     schema:
 *     type: integer
 *    required: true
 *   description: El id del cliente
 * responses:
 * 200:
 * description: El cliente fue eliminado correctamente
 * 404:
 * description: El cliente no existe
 * 500: 
 * description: Error interno del servidor
 * */

export default router;