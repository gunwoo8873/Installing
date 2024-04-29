const http = require('http')
const express = require('express')
const app = express()

app.get('./Front/index.html', (req, res) => {
    res.send('Hello World!')
}).listen