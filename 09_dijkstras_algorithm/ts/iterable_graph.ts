export interface Graph<T> {
  [key: string]: T;
}

export class GraphIterable<T> implements Iterable<string> {
  private graph: Graph<T>;

  constructor(graph: Graph<T>) {
    this.graph = graph;
  }

  [Symbol.iterator](): Iterator<string> {
    const keys = Object.keys(this.graph);
    let index = 0;

    return {
      next: (): IteratorResult<string> => {
        if (index < keys.length) {
          return { value: keys[index++], done: false };
        } else {
          return { value: undefined, done: true };
        }
      },
    };
  }
}
