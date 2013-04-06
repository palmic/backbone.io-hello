http = require 'http'
backboneio = require 'backbone.io'
socketio = require 'backbone.io/node_modules/socket.io'
fs = require 'fs'

index = fs.readFileSync 'index.html'

app = http.createServer((req, res) ->
	res.writeHead 200,
		"Content-Type": "text/html"
	res.end index
)
app.listen 3000

backend = backboneio.createBackend();
backend.use(backboneio.middleware.memoryStore())

io = backboneio.listen(app, mybackend: backend )

io.static.add('/client.io.js', { file: __dirname + '/client.js' });
