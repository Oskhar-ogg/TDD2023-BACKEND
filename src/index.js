import app from "./app";
import bodyParser from "body-parser";

app.use(bodyParser.json());


// Resto del código del servidor...

app.listen(5000, () => {
  console.log('Servidor listo y escuchando en el puerto 5000');
});
