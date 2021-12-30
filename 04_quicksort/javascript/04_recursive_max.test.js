"use strict";

const { max } = require("./04_recursive_max");

describe("functions work properly", () => {

    test("sumRecursive works properly", () => {
        expect(max([1,2,3])).toEqual(3);
    });
});