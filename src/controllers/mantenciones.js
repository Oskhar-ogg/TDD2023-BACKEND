import {connection} from '../basedd.js';

export const getMantencionesCaldera = async (req, res) => {
    try {
        const db = await connection();
        const [rows] = await db.query('SELECT * FROM Mantenimiento_historico_caldera JOIN cliente');
        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({error: 'Internal Server Error'});
    }
    }

export const getMantencionesCalefont = async (req, res) => {
    try {
        const db = await connection();
        const [rows] = await db.query('SELECT * FROM Mantenimiento__historico_calefont JOIN cliente');
        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({error: 'Internal Server Error'});
    }
    }