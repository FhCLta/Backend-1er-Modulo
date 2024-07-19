const express = require('express');
const knex = require('knex');
require('dotenv').config();

const db = knex(require('./knexfile'));
console.log(db);
const app = express();
const port = 8000;

app.use(express.json());

// Endpoint para obtener todos los productos
app.get('/productos', async (req, res) => {
  try {
    const productos = await db.select('*').from('productos');
    res.json({
      msg: 'Productos obtenidos',
      productos,
    });
  } catch (error) {
    res.status(500).json({ msg: 'Error al obtener productos', error });
    console.log(error);
  }
});

//Endpoint para obtener obtener los clientes
app.get('/clientes', async (req, res)=> {
try{
   const clientes = await db.select('*').from('clientes');
   res.json({
    msg: 'Clientes Obtenidos',
    clientes,
   });

} catch (error) {
    res.status(500).json({ msg: 'Error al obtener productos', error });
    console.log(error);
}
});


// Endpoint para obtener un producto por ID
app.get('/productos/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const producto = await db('Productos').where({ ID: id }).first();
    if (producto) {
      res.json({
        msg: 'Producto obtenido',
        producto,
      });
    } else {
      res.status(404).json({ msg: 'Producto no encontrado' });
    }
  } catch (error) {
    res.status(500).json({ msg: 'Error al obtener producto', error });
  }
});

// Endpoint para crear un nuevo producto
app.post('/productos', async (req, res) => {
  const { Nombre, Descripción, Precio, SKU } = req.body;
  try {
    const [newProducto] = await db('Productos').insert({
      Nombre,
      Descripción,
      Precio,
      SKU,
    }).returning('*');
    res.status(201).json({
      msg: 'Producto creado',
      newProducto,
    });
  } catch (error) {
    res.status(500).json({ msg: 'Error al crear producto', error });
  }
});

// Endpoint para actualizar un producto
app.put('/productos/:id', async (req, res) => {
  const { id } = req.params;
  const { Nombre, Descripción, Precio, SKU } = req.body;
  try {
    const [updatedProducto] = await db('Productos')
      .where({ ID: id })
      .update({
        Nombre,
        Descripción,
        Precio,
        SKU,
      })
      .returning('*');
    if (updatedProducto) {
      res.json({
        msg: 'Producto actualizado',
        updatedProducto,
      });
    } else {
      res.status(404).json({ msg: 'Producto no encontrado' });
    }
  } catch (error) {
    res.status(500).json({ msg: 'Error al actualizar producto', error });
  }
});

// Endpoint para eliminar un producto
app.delete('/productos/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const deletedRows = await db('Productos').where({ ID: id }).del();
    if (deletedRows) {
      res.json({ msg: 'Producto eliminado' });
    } else {
      res.status(404).json({ msg: 'Producto no encontrado' });
    }
  } catch (error) {
    res.status(500).json({ msg: 'Error al eliminar producto', error });
  }
});

app.listen(port, () => {
  console.log(`Servidor corriendo en puerto ${port}`);
});
