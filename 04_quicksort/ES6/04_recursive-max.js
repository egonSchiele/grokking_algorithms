const max = ([head, second, ...tail]) => {
  if (head === undefined) {
    return null;
  }

  if (second === undefined) {
    return head;
  }

  if (head < second) {
    head = second;
  }

  return max([head, ...tail]);
};

console.log(max([1, 5, 10, 25, 16, 1])); // 25
