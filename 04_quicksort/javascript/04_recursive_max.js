'use strict';

function max(list) {
  if (list.length === 2) {
    return list[0] > list[1] ? list[0] : list[1];
  }
  let sub_max = max(list.slice(1));
  return list[0] > sub_max ? list[0] : sub_max;
}

console.log(max([1, 5, 10, 25, 16, 1])); // 25





//max([1]);VM819:1 Uncaught RangeError: Maximum call stack size exceeded
/** my code
function max(arr){
	if(arr.length===1){
		return arr[0];
	}
	let maxNumber = max(arr.slice(1));
	return arr[0]>maxNumber ? arr[0] : maxNumber;
}


**/
