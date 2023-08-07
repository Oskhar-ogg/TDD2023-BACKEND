import { Router } from "express";
import {getClientes, deleteCliente} from '../controllers/clientes.js';

const router = Router();


/**
 * @swagger
 * tags:
 *     name: Clientes
 *    description: Ruta de Clientes
 */

router.get('/clientes', getClientes);

/** 
 * @swagger
 * /clientes:
 *    get:
 *      summary: Obtiene todos los clientes
 *   tags: [Clientes]
 * 
*/

router.delete('/clientes/:id', deleteCliente);

/** 
 * @swagger
 * /clientes/{id}:
 *   delete:
 *     summary: Elimina un cliente
 *    tags: [Clientes]
 */

export default router;