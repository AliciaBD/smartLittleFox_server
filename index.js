const express = require("express");
const app = express();
const db = require("./database");
const cors = require("cors");
const utils = require("./functions/utils");

const port = process.env.PORT || 5000;

//Middleware
app.use(express.json());
app.use(cors());

app.get("/lessons", async (req, res) => {
  try {
    const data = await db.query("SELECT * FROM lessons");
    res.json(data.rows);
  } catch (err) {
    console.error(err.message);
  }
});

app.get("/lessons/:lesson_id", async (req, res) => {
  const lesson_id = req.params.lesson_id;
  try {
    const data = await db.query(
      "SELECT id, word, lesson_id FROM vocabulary WHERE lesson_id=$1",
      [lesson_id]
    );
    const newData = await utils.translateArray(data.rows, "es");
    res.json(newData);
  } catch (err) {
    console.error(err.message);
  }
});

app.get("*", async (req, res) => {
  try {
    const data = await db.query("SELECT * FROM lessons");
    res.json(data.rows);
  } catch (err) {
    console.error(err.message);
  }
});

app.listen(port, (err) => {
  if (err) return console.error("error in connection", err.stack);
  console.log(`Connected to port ${port}`);
});
