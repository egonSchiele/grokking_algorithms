interface HashTable<T> {
    [key: string]: T;
}

const book: HashTable<number> = {};

book['apple'] = 0.67;
book['milk'] = 1.49;
book['avocado'] = 1.49;

console.log(book); // { apple: 0.67, milk: 1.49, avocado: 1.49 }