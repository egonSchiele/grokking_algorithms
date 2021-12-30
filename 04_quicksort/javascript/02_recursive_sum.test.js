"use strict";

const { sumRecursive } = require("./02_recursive_sum");

describe("functions work properly", () => {

    test("sumRecursive works properly", () => {
        expect(sumRecursive([1,2,3])).toEqual(6);
    });
});