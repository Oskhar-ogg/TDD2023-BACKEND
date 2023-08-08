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
      'INSERT INTO bitacora  (bitacora_title, bitacora_description, bitacora_estado, bitacora_valor_cobrado, bitacora_fecha, tecnico_id) VALUES ( ?, ?, ?, ?, ?, ?)',
      [req.body.bitacora_title, req.body.bitacora_description, req.body.bitacora_estado, req.body.bitacora_valor_cobrado, req.body.bitacora_fecha, req.body.tecnico_id]
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
      'UPDATE bitacora SET bitacora_title = ?, bitacora_description = ?, bitacora_estado = ? bitacora_valor_cobrado = ? WHERE bitacora_id = ?',
      [req.body.bitacora_title, req.body.bitacora_description, req.body.bitacora_estado, req.body.bitacora_valor_cobrado, req.params.bitacora_id]
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

export const MontoMesBitacora = async (req, res) => {
  try {
    const connect = await connection();
    
    // Ejecutar las declaraciones SET
    await connect.query('SET @fecha_actual = CURDATE()');
    await connect.query('SET @fecha_inicio = DATE_SUB(@fecha_actual, INTERVAL 1 MONTH)');
    await connect.query('SET @fecha_fin = @fecha_actual');
    
    // Consulta final
    const [rows] = await connect.query('SELECT SUM(bitacora_valor_cobrado) FROM bitacora WHERE bitacora_estado = "Finalizado" AND bitacora_fecha BETWEEN @fecha_inicio AND @fecha_fin');
    
    res.json(rows[0]['SUM(bitacora_valor_cobrado)']);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
}

export const MontoBitacora = async (req, res) => {
  try {
    const connect = await connection();
    
    // Consulta
    const [rows] = await connect.query('SELECT SUM(bitacora_valor_cobrado) FROM bitacora');
    
    res.json(rows[0]['SUM(bitacora_valor_cobrado)']);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
}

