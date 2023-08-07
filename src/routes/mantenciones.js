import { Router } from "express";
import { getMantencionesCaldera, getMantencionesCalefont } from "../controllers/mantenciones";

const router = Router();

/**
 * @swagger
 * tags:
 *      name: Mantenciones
 *          description: Mantenciones API
 * */

router.get('/mantenciones/caldera', getMantencionesCaldera);

/**
 * @swagger
 *      /mantenciones/caldera:
 *          get:
 *              summary: Carga la lista de mantenciones de caldera.
 *              tags: [Mantenciones]
 * */

router.get('/mantenciones/calefont', getMantencionesCalefont);

/**
 * @swagger
 *      /mantenciones/calefont:
 *          get:
 *              summary: Carga la lista de mantenciones de calefont.
 *              tags: [Mantenciones]
 * */
export default router;
