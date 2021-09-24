require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const socket = require('./src/helpers/middlewares/socket');

const app = express();
const port = process.env.PORT || '8090';
const mainRouter = require('./src/routes/index');
const server = require('http').createServer(app);
const io = require('socket.io')(server, {
  cors: {
    origin: 'https://cerita-kopi.netlify.app/'
  }
});

io.on('connection', () => {
  console.log('socket connection is running')
});

app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(process.env.APP_UPLOAD_ROUTE, express.static('public/images'))
app.use(socket(io));

server.listen(port, () => {
  console.log(`Server running on port : ${port}`);
});

app.use('/', mainRouter);
module.exports = app;