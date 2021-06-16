const multer = require('multer');
const path = require('path');

const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, path.join(process.cwd(), 'public', 'images'));
    }, 
    filename: function(req, file, cb) {
        const nameFormat = `img-${Date.now()}${path.extname(
            file.originalname
        )}`;
        cb(null, nameFormat);
    }
});

module.exports = multer({storage});