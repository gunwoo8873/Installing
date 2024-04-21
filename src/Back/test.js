#!/usr/bin/env node
const http = require(`http`)
const server= http.createServer()

const url = require(`url`)
const net = require(`net`)

/**req = request, res = response */
/*
const main_server = http.createServer((req, res) => {

    res.writeHead(200, {'Content-Type': 'text/plain'})
    res.end('Hello World\n')
})

main_server.listen(8080, function() {
    console.log(`Http Server Running`);
})
*/

const test_server = server((req, res) => {
    const port = 8000
    .listen(port)
    
    /*
    const option = ``
    if (option === `listening`) {
        on(`${option}`, () => { console.log(`Server is running on port ${port}`) })
    }
    if (option === `err`) {
        on(`${option}`, (err) => { console.log(err) })
    }

    .on(`request`, (req, res) => {
        res.writeHead(200, {'Content-Type': 'text/plain'})
        res.end('Hello World\n')
    })
    .on(`close`, () => {
        console.log('Server is closed')
    })
    */

    res.writeHead(200, {'Content-Type': 'text/plain'})
    res.end('Hello World\n')
})

test_server.listen(8000, () => {
    test_server.on
})