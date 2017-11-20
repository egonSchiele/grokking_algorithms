const max = (list) => {
  if (list.length === 2) {
    return list[0] > list[1] ? list[0] : list[1];
  }
  const subMax = max(list.slice(1));
  return list[0] > subMax ? list[0] : subMax;
};

console.log(max([1, 5, 10, 25, 16, 1])); // 25
