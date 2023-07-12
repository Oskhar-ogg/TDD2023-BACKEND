import { connection } from "../basedd";

export const getAgenda = async (req, res) => {
  try {
    const db = await connection();
    const [rows] = await db.query("SELECT * FROM agenda");
    res.json(rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
};

export const getAgendas = async (req, res) => {
  try {
    const db = await connection();
    const [rows] = await db.query("SELECT * FROM agenda WHERE agenda_id = ?", [req.params.id]);
    res.json(rows[0]);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
};

export const saveAgenda = async (req, res) => {
  try {
    const db = await connection();
    const [result] = await db.query("INSERT INTO agenda SET ?", [req.body]);
    res.json({
      id: result.insertId,
      ...req.body,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
};

export const updateAgenda = async (req, res) => {
  try {
    const db = await connection();
    const [result] = await db.query("UPDATE agenda SET ? WHERE agenda_id = ?", [req.body, req.params.id]);
    res.json({
      message: "Agenda updated",
      ...req.body,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
};

export const deleteAgenda = async (req, res) => {
  try {
    const db = await connection();
    const [result] = await db.query("DELETE FROM agenda WHERE agenda_id = ?", [req.params.id]);
    res.json(result);
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: "Internal Server Error" });
  }
};
