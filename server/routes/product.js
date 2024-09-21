const express = require("express");
const productRouter = express.Router();
const { Product } = require("../models/product");
const auth = require("../middlewares/auth");
const ratingSchema = require("../models/rating");

productRouter.get("/api/products", async (req, res) => {
  try {
    console.log(req.query.category);
    const products = await Product.find({ category: req.query.category });
    return res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

productRouter.get("/api/products/search/:name", async (req, res) => {
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

productRouter.post("/api/rate-products", auth, async (req, res) => {
  try {
    const { id, rating } = req.body;
    let product = await Product.findById(id);

    if (!product) {
      return res.status(404).json({ message: "Product not found" });
    }

    for (let i = 0; i < product.ratings.length; i++) {
      if (product.ratings[i].userId == req.user) {
        product.ratings.splice(i, 1);
        break;
      }
    }

    var newRating = {
      userId: req.user,
      rating,
    };
    product.ratings.push(newRating);
    product = await product.save();
    return res.json(product);
  } catch (e) {
    console.error(e); // Log the error to understand what's wrong
    res.status(500).json({ error: e.message });
  }
});

productRouter.get("/api/deal-of-day", async (req, res) => {
  try {
    let products = await Product.find({});
    products = products.sort((a, b) => {
      let aSum = 0;
      let bSum = 0;

      for (let i = 0; i < b.ratings.length; i++) {
        bSum += b.ratings[i].rating;
      }

      for (let i = 0; i < a.ratings.length; i++) {
        aSum += a.ratings[i].rating;
      }
      return aSum < bSum ? 1 : -1;
    });
    res.json(products[0]);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

productRouter.get("/api/price-drop", async (req, res) => {
  try {
    let products = await Product.find({});

    products.sort((a, b) => {
      return a.price - b.price;
    });

    if (products.length === 0) {
      throw new Error("No products found");
    }

    res.json(products[0]);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = productRouter;
