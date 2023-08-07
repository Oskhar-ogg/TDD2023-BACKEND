import {connection} from '../basedd.js';

export const getClientes = async (req, res) => {
    try {
        const db = await connection();
        const [rows] = await db.query('SELECT * FROM cliente');
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
    
    
