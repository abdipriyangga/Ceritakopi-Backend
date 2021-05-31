exports.response = (res, status, success, message, results) => {
    return res.status(status).json({
        success,
        message,
        results
    });
};