import { Router } from "express";
import {
  getMantencionesCaldera,
  saveMantencionesCaldera,
  getMantencionesCalefont,
  saveMantencionesCalefont,
} from "../controllers/mantenciones";

const router = Router();

/**
 * @swagger
 * tags:
 *   name: Mantenciones
 *   description: Ruta de Mantenciones
 */

router.get('/mantenciones/caldera', getMantencionesCaldera);

/**
 * @swagger
 * /mantenciones/calefont:
 *   get:
 *     summary: Obtiene todas las mantenciones de calefont
 *     tags: [Mantenciones]
 */

router.get('/mantenciones/calefont', getMantencionesCalefont);

/**
 * @swagger
 * /mantenciones/caldera:
 *   get:
 *     summary: Obtiene todas las mantenciones de caldera
 *     tags: [Mantenciones]
 */

router.post('/mantenciones/caldera', saveMantencionesCaldera);

/**
 * @swagger
 * /mantenciones/calefont:
 *   post:
 *     summary: Crea una nueva mantencion de calefont
 *     tags: [Mantenciones]
 */

router.post('/mantenciones/calefont', saveMantencionesCalefont);

export default router;
