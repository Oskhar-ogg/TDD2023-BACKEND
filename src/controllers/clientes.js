import {connection} from '../basedd.js';

export const getClientes = async (req, res) => {
    try {
        const db = await connection();
        const [rows] = await db.query('SELECT * FROM cliente JOIN comuna ON cliente.comuna_id = comuna.comuna_id');
        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({error: 'Internal Server Error'});
    }
    }
export const deleteCliente = async (req, res) => {
    try {
        const db = await connection();
        await db.query('DELETE FROM clientes WHERE cliente_id = ?', [req.params.id]);
        res.json({message: 'Cliente eliminado correctamente'});
    } catch (error) {
        console.error(error);
        res.status(500).json({error: 'Internal Server Error'});
    }
    }

export const saveCliente = async (req, res) => {
    try {
        const db = await connection();
        await db.query('INSERT INTO cliente SET ?', [req.body]);
        res.json({message: 'Cliente guardado correctamente'});
    } catch (error) {
        console.error(error);
        res.status(500).json({error: 'Internal Server Error'});
    }
    }

export const getClienteHistoricoCaldera = async (req, res) => {
    try {
        const db = await connection();
        const [rows] = await db.query('SELECT * FROM cliente C JOIN Mantenimiento_historico_caldera M ON C.cliente_nombre = M.cliente_nombre');
        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({error: 'Internal Server Error'});
    }
    }
    
export const getClienteHistoricoCalefont = async (req, res) => {
    try {
        const db = await connection();
        const [rows] = await db.query('SELECT * FROM cliente C JOIN Mantenimiento_historico_calefont M ON C.cliente_nombre = M.cliente_nombre');
        res.json(rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({error: 'Internal Server Error'});
    }
    }

    
    
