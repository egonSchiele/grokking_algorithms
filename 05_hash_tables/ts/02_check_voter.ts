interface HashTable<T> {
    [key: string]: T;
}

const voted: HashTable<boolean> = {};

function check_voter(name: string): void {
    if (voted[name]) {
        console.log('kick them out!');
    } else {
        voted[name] = true;
        console.log('let them vote!');
    }
}

check_voter("tom"); // let them vote!
check_voter("mike"); // let them vote!
check_voter("mike"); // kick them out!