const express = require("express");
const path = require("path");
const app = express();
const PORT = 3000;

app.use(express.static(path.join(__dirname, "public")));
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.post("/login", (req, res) => {
    const { username, password } = req.body;
    // For demo purposes, just echo back
    res.json({username, password})
});

app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
});
