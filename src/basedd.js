import mysql from 'mysql2/promise';
import { configuracion } from './config.js';

export const connection = async () => {
   return await mysql.createConnection(configuracion);
};
