import { Router } from "express";
import { getClientes, deleteCliente, getClienteHistoricoCaldera, getClienteHistoricoCalefont } from '../controllers/clientes.js';

const router = Router();

/**
 * @swagger
 * tags:
 *   name: Clientes
 *   description: Ruta de Clientes
 */

router.get('/clientes', getClientes);

/** 
 * @swagger
 * /clientes:
 *   get:
 *     summary: Obtiene todos los clientes
 *     tags: [Clientes]
 */

router.get('/clientes/calderas', getClienteHistoricoCaldera);

/** 
 * @swagger
 * /clientes:
 *   get:
 *     summary: Obtiene el historico de mantenciones realizadas a la caldera del cliente
 *     tags: [Clientes]
 */

router.get('/clientes/calefonts', getClienteHistoricoCalefont);

/** 
 * @swagger
 * /clientes:
 *   get:
 *     summary: Obtiene el historico de mantenciones realizadas al calefont del cliente
 *     tags: [Clientes]
 */

router.delete('/clientes/:id', deleteCliente);

/** 
 * @swagger
 * /clientes/{id}:
 *   delete:
 *     summary: Elimina un cliente
 *     tags: [Clientes]
 */

export default router;
