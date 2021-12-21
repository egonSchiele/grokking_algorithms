"use strict";

const { selectionSort } = require("./01_selection_sort");

describe("selectionSort", function () {
    it("sorts an unsorted array", function () {
        expect(selectionSort([5, 3, 6, 2, 10])[0]).toBe(2);
        expect(selectionSort([5, 3, 6, 2, 10])[4]).toBe(10);
    });

    it("works with an already sorted array", function () {
        expect(selectionSort([5, 3, 6, 2, 10])[0]).toBe(2);
        expect(selectionSort([5, 3, 6, 2, 10])[4]).toBe(10);
    });

    it("works with an empty array", function () {
        expect(selectionSort([]).length).toBe(0);
    });
});