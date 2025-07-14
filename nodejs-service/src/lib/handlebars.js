const helpers = require("./helpers");

helpers.ifEquals = function (arg1, arg2, options) {
    if (options.fn) {
        if (arg1 == arg2) {
            return options.fn(this);
        }
        return options.inverse(this);
    } else return arg1 == arg2;
};
helpers.checklength = function (arg1, arg2, options) {
    if (options.fn) {
        if (arg1.length > arg2) {
            return options.fn(this);
        }
        return options.inverse(this);
    } else return arg1.length > arg2;
};
helpers.subStr = function (str) {
    return str.substring(0, 44);
}
helpers.count = function (carrito, id) {
    return (carrito[id] || 0);
};
helpers.subtotal = function (carrito, id, precio) {
    return Math.round((carrito[id] * precio) * 100) / 100;
};
helpers.eq = (a, b) => a == b;
module.exports = helpers;