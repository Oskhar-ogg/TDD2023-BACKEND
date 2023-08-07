import { Router } from "express";
import { getMantencionesCaldera, getMantencionesCalefont } from "../controllers/mantenciones";

const router = Router();


router.get('/mantenciones/caldera', getMantencionesCaldera);


router.get('/mantenciones/calefont', getMantencionesCalefont);

export default router;
