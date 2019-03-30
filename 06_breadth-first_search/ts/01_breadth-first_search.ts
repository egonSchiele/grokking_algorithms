interface Graph<T> {
    [key: string]: T[]
};

function personIsSeller(name: string): boolean {
    return name.endsWith('m');
}

const graph: Graph<string> = {};
graph.you = ['alice', 'bob', 'claire'];
graph.bob = ['anuj', 'peggy'];
graph.alice = ['peggy'];
graph.claire = ['thom', 'jonny'];
graph.anuj = [];
graph.peggy = [];
graph.thom = [];
graph.jonny = [];

function search(name: string): boolean {
    let searchQueue = graph[name];
    // This array is how you keep track of which people you've searched before.
    const searched = [];

    while(searchQueue.length > 0) {
        const person = searchQueue.shift();
        // Only search this person if you haven't already searched them
        if (!searched.includes(person)) {
            if (personIsSeller(person)) {
                console.log(`${person} is a mango seller!`);
                return true;
            } else {
                searchQueue = searchQueue.concat(graph[person]);
                // Marks this person as searched
                searched.push(person);
            }
        }
    }

    return false;
};

search('you');