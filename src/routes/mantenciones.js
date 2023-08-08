import { Router } from "express";
import {
  getMantencionesCaldera,
  saveMantencionesCaldera,
  getMantencionesCalefont,
  saveMantencionesCalefont,
  getMantenimientoCalderaCliente,
  getMantenimientoCalefontCliente,
} from "../controllers/mantenciones";

const router = Router();

/**
 * @swagger
 * tags:
 *   name: Mantenciones
 *   description: Ruta de Mantenciones
 */

router.get('/mantenciones/caldera/', getMantencionesCaldera);

/**
 * @swagger
 * /mantenciones/caldera:
 *   get:
 *     summary: Obtiene todas las mantenciones de caldera
 *     tags: [Mantenciones]
 */

router.get('/mantenciones/calefont/', getMantencionesCalefont);

/**
 * @swagger
 * /mantenciones/calefont:
 *   get:
 *     summary: Obtiene todas las mantenciones de calefont
 *     tags: [Mantenciones]
 */

router.post('/mantenciones/caldera', saveMantencionesCaldera);

/**
 * @swagger
 * /mantenciones/caldera:
 *   post:
 *     summary: Crea una nueva mantencion de calefont
 *     tags: [Mantenciones]
 */

router.post('/mantenciones/calefont', saveMantencionesCalefont);

/**
 * @swagger
 * /mantenciones/calefont:
 *   post:
 *     summary: Crea una nueva mantencion de calefont
 *     tags: [Mantenciones]
 */


router.get('/mantenciones/caldera/:id', getMantenimientoCalderaCliente);

/** 
 * @swagger
 * /mantenciones/caldera/{id}:
 *   get:
 *     summary: Obtiene todas las mantenciones de caldera de un cliente
 *     tags: [Mantenciones]
*/
router.get('/mantenciones/calefont/:id', getMantenimientoCalefontCliente);

/**
 * @swagger
 * /mantenciones/calefont/{id}:
 *   get:
 *     summary: Obtiene todas las mantenciones de calefont de un cliente
 *     tags: [Mantenciones]
*/

export default router;


