exports.response = (res, status = 200, message, results, pageInfo) => {
    const returnData = {
        success: true,
        message,
        results,
        pageInfo,
    };

    if (status >= 400) {
        returnData.success = false;
    }

    if (results !== null) {
        returnData.results = results;
    }
    return res.status(status).json(returnData);
};