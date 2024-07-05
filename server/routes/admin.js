const express = require("express");
const adminRout = express.Router();
const admin = require("../middlewares/admin");
const { Product } = require("../models/product");

adminRout.post("/admin/add-products", admin, async (req, res) => {
  try {
    const { name, description, images, quantity, price, category } = req.body;
    let product = new Product({
      name,
      description,
      images,
      quantity,
      price,
      category,
    });
    product = await product.save();
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

adminRout.get("/admin/get-products", admin, async (req, res) => {
  try {
    const products = await Product.find({});
    return res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

adminRout.post("/admin/delete-product", admin, async (req, res) => {
  try {
    const { id } = req.body;
    let product = await Product.findByIdAndDelete(id);
    res.json(product);
  } catch (e) {
    console.error(e.message);
    res.status(500).json({ error: e.message });
  }
});

module.exports = adminRout;
