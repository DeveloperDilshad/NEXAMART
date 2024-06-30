const express = require("express");
const productRouter = express.Router();
const Product = require("../models/product");
const auth = require("../middlewares/auth");

productRouter.get("/api/products", auth, async (req, res) => {
  try {
    console.log(req.query.category);
    const products = await Product.find({ category: req.query.category });
    return res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

productRouter.get("/api/products/search/:name", auth, async (req, res) => {
  try {
    console.log(req.params.name);
    const products = await Product.find({
      name: { $regex: req.params.name, $options: "i" },
    });
    return res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = productRouter;
