import { connection } from '../basedd.js';

export const getBitacora = async (req, res) => {
  try {
    const db = await connection();
    const [rows] = await db.query('SELECT * FROM bitacora');
    res.json(rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

export const getBitacoras = async (req, res) => {
  try {
    const connect = await connection();
    const [rows] = await connect.query('SELECT * FROM bitacora WHERE bitacora_id = ?', [req.params.id]);
    console.log(rows);
    res.json(rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

export const getBitacoraCount = async (req, res) => {
  try {
    const connect = await connection();
    const [rows] = await connect.query('SELECT COUNT(*) FROM bitacora');
    res.json(rows[0]['COUNT(*)']);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

export const saveBitacora = async (req, res) => {
  try {
    console.log(req.body); // Agregar esta línea para verificar los datos recibidos
    const connect = await connection();
    const [results] = await connect.query(
      'INSERT INTO bitacora  (bitacora_title, bitacora_description, bitacora_estado, bitacora_pago, bitacora_valor_cobrado, bitacora_foto, bitacora_fecha) VALUES ( ?, ?, ?, ?, ?, ?, ?)',
      [req.body.bitacora_title, req.body.bitacora_description, req.body.bitacora_estado, req.body.bitacora_pago, req.body.bitacora_valor_cobrado, req.body.bitacora_foto, req.body.bitacora_fecha]
    );
    
    res.json({
      id: results.insertId,
      ...req.body,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

export const updateBitacora = async (req, res) => {
  try {
    const connect = await connection();
    await connect.query(
      'UPDATE bitacora SET bitacora_title = ?, bitacora_description = ?, bitacora_estado = ?, bitacora_pago = ?, bitacora_valor_cobrado = ? WHERE bitacora_id = ?',
      [req.body.bitacora_title, req.body.bitacora_description, req.body.bitacora_estado, req.body.bitacora_pago, req.body.bitacora_valor_cobrado, req.params.bitacora_id]
    );

    res.sendStatus(204);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};

export const deleteBitacora = async (req, res) => {
  try {
    const connect = await connection();
    const result = await connect.query('DELETE FROM bitacora WHERE bitacora_id = ?', [req.params.id]);
    res.status(204).json({}); // No content
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
};
