import {connection} from '../basedd.js';

export const getMantencionesCaldera = async (req, res) => {
    try {
        const db = await connection();
        const [rows] = await db.query('SELECT * FROM mantenimiento_caldera');
        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({error: 'Internal Server Error'});
    }
    }

export const getMantencionesCalefont = async (req, res) => {
    try {
        const db = await connection();
        const [rows] = await db.query('SELECT * FROM mantenimiento_calefont');
        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({error: 'Internal Server Error'});
    }
    }