import { Router } from "express";
import { getMantencionesCaldera, getMantencionesCalefont } from "../controllers/mantenciones";

const router = Router();

/**
 * @swagger
 * tags:
 *      name: Mantenciones
 *      description: Ruta de Mantenciones
 * 
 */

router.get('/mantenciones/caldera', getMantencionesCaldera);

/**
 * @swagger
 * /mantenciones/calefont:
 *      get:
 *         summary: Obtiene todas las mantenciones de calefont
 *        tags: [Mantenciones]
 * 
 * 
 */

router.get('/mantenciones/calefont', getMantencionesCalefont);

/**
 * @swagger
 * /mantenciones/caldera:
 *     get:
 *        summary: Obtiene todas las mantenciones de caldera
 *      tags: [Mantenciones]
 * 
*/


export default router;
