exports.codeTransaction = (prefix, id) => {
    const date = new Date();
    return `${prefix}/${date.getDate()}${date.getMonth() + 1}${date.getFullYear()}/${id}`;
};