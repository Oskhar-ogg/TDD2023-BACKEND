import { Router } from "express";
import {getClientes, deleteCliente} from '../controllers/clientes.js';

const router = Router();

router.get('/clientes', getClientes);
router.delete('/clientes/:id', deleteCliente);

export default router;