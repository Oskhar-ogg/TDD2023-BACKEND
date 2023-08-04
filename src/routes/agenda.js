import { Router } from 'express';
import { getAgenda, getAgendas, saveAgenda, updateAgenda, deleteAgenda } from '../controllers/agenda';

const router = Router();

/**
 * @swagger
 * tags:
 *   name: Agenda
 *   description: Agenda API
 */

router.get('/agenda/', getAgenda);

/**
 * @swagger
 * /agenda:
 *   get:
 *     summary: Carga la lista de agendas.
 *     tags: [Agenda]
 */

router.get('/agenda/:id', getAgendas);

/**
 * @swagger
 * /agenda/{id}:
 *  get:
 *   summary: Carga una agenda por id.
 *   tags: [Agenda]
*/

router.post('/agenda/', saveAgenda);

/**
 * @swagger
 * /agenda:
 *   post:
 *     summary: Guarda una  cita en agenda.
 *     tags: [Agenda]
 */

router.put('/agenda/:id', updateAgenda);

/**
 * @swagger
 * /agenda:
 *   put:
 *     summary: Actualiza una cita en agenda por id.
 *     tags: [Agenda]
 */

router.delete('/agenda/:id', deleteAgenda);

/**
 * @swagger
 * /agenda:
 *   delete:
 *     summary: Borra una cita de agenda por id.
 *     tags: [Agenda]
 */

export default router;
