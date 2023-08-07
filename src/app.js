import express from 'express';
import morgan from 'morgan';
import cors from 'cors';
import bitacoraRoutes from './routes/bitacora';
import agendaRoutes from './routes/agenda';
import clienteRoutes from './routes/cliente';
import mantencionesRoutes from './routes/mantenciones';
import { swaggerOptions } from './swaggerOpt.js';

import swaggerJSDoc from 'swagger-jsdoc';
import swaggerUI from 'swagger-ui-express';



const specs = swaggerJSDoc(swaggerOptions);


const app = express();
app.use(cors());
app.use(express.json());
app.use(morgan('dev'));
app.use(bitacoraRoutes)
app.use(agendaRoutes)
app.use(clienteRoutes)
app.use(mantencionesRoutes)
app.use('/docs/', swaggerUI.serve, swaggerUI.setup(specs));

export default app;
