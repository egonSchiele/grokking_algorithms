function greet2(name: string): void {
    console.log('how are you, ' + name + '?');
}

function bye(): void {
    console.log('ok bye!');
}

function greet(name: string): void {
    console.log('hello, ' + name + '!');
    greet2(name);
    console.log('getting ready to say bye...');
    bye();
}

greet('adit');
