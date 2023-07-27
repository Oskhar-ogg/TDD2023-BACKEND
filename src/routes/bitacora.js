import  { Router } from 'express';
import { getBitacora, getBitacoraCount, getBitacoras, saveBitacora, updateBitacora, deleteBitacora, MontoBitacora, MontoMesBitacora } from '../controllers/bitacora';

const router = Router()
/** 
 * @swagger
 * tags:
 *  name: Bitacoras
 *  description: Bitacora API
 * 
 *    
*/


router.get('/bitacora/', getBitacora)
/**
 * @swagger
 * /bitacora:
 *      get:
 *          summary: Carga la lista de bitaácoras
 *          tags: [Bitacoras] 
 */


router.get('/bitacora/count', getBitacoraCount)

/**
 * @swagger
 * /bitacora/count:
 *      get:
 *          summary: Suma la cantidad total de bitácoras ingresadas.
 *          tags: [Bitacoras]
 */

router.get('/bitacora/:id', getBitacoras)

/**
 * @swagger
 * /bitacora/{id}:
 *       get:
 *          summary: Obtiene una bitácora por id.
 *          tags: [Bitacoras]
 */

router.get('/bitacora/total', MontoBitacora)

/**
 * @swagger
 * /bitacora/total:
 *     get:
 *         summary: Obtiene el monto total ganado de los trabajos realizados.
 *         tags: [Bitacoras]
*/

router.get('/bitacora/mes', MontoMesBitacora)

/**
 * @swagger
 * /bitacora/mes:
 *    get:
 *       summary: Obtiene el monto total ganado de los trabajos realizados en el mes actual.
 *       tags: [Bitacoras]
 * 
*/

router.post('/bitacora/', saveBitacora)

/**
 * @swagger
 * /bitacora:
 *      post:
 *          summary:  Guarda una nueva bitácora.
 *          tags: [Bitacoras]
 */

router.put('/bitacora/:id', updateBitacora)
/**
 * @swagger
 * /bitacora:
 *      put:
 *          summary: Actualiza el contenido. de una bitácora.
 *          tags: [Bitacoras]
 */


router.delete('/bitacora/:id', deleteBitacora)
/**
 * @swagger
 * /bitacora:
 *      delete:
 *          summary: Borra una bitácora seleccionada
 *          tags: [Bitacoras]
 */

export default router;