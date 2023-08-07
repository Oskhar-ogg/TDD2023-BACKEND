import {connection} from '../basedd.js';

export const getMantencionesCaldera = async (req, res) => {
    try {
        const db = await connection();
        const [rows] = await db.query('SELECT * FROM Mantenimiento_historico_caldera');
        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({error: 'Internal Server Error'});
    }
    }
export const saveMantencionesCaldera = async (req, res) => {
    try {
        const db = await connection();
        const [rows] = await db.query('INSERT INTO Mantenimiento_historico_caldera SET ?', [req.body]);
        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({error: 'Internal Server Error'});
    }
    }

export const getMantencionesCalefont = async (req, res) => {
    try {
        const db = await connection();
        const [rows] = await db.query('SELECT * FROM Mantenimiento_historico_calefont');
        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({error: 'Internal Server Error'});
    }
    }

export const saveMantencionesCalefont = async (req, res) => {
    try {
        const db = await connection();
        const [rows] = await db.query('INSERT INTO Mantenimiento_historico_calefont SET ?', [req.body]);
        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({error: 'Internal Server Error'});
    }
    }
        