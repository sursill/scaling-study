const http = require('node:http')
const fs = require('node:fs')
const path = require('node:path')

STORAGE_DIR = './storage/app/'

http
  .createServer(function (req, res) {
    const url = req.url
    const fileName = url+'.txt'
    const filePath = path.join(STORAGE_DIR, fileName)
    const instanceId = process.env.INSTANCE_ID

    console.debug(`Writing new file to: ${filePath}`)

    fs.writeFile(filePath, url, (err) => {
      console.error(err)
    })

    const responseObj = {
      file: { filePath, fileName },
      instanceId,
    }

    res.writeHead(200, {'Content-Type': 'application/json'})
    res.write(JSON.stringify(responseObj));
    res.end()
  })
  .listen(8080)
