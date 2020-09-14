// Author Andrii Nyzhnyk

fn main() {
    run_binary_search_arr();
    run_binary_search_vec();
}


fn run_binary_search_arr() {

    let arr:[i32; 7] = [1, 15, 22, 43, 168, 500, 502];

    let result_1 = binary_search_arr(&arr, 1);
    assert_eq!(result_1, 0);

    let result_2 = binary_search_arr(&arr, 15);
    assert_eq!(result_2, 1);

    let result_3 = binary_search_arr(&arr, 22);
    assert_eq!(result_3, 2);

    let result_4 = binary_search_arr(&arr, 43);
    assert_eq!(result_4, 3);

    let result_5 = binary_search_arr(&arr, 168);
    assert_eq!(result_5, 4);

    let result_6 = binary_search_arr(&arr, 500);
    assert_eq!(result_6, 5);

    let result_7 = binary_search_arr(&arr, 502);
    assert_eq!(result_7, 6);

    let result_8 = binary_search_arr(&arr, 888);
    assert_eq!(result_8, -1);
}

fn binary_search_arr(arr: &[i32], find: i32) -> i32 {
    let mut min: u32 = 0;
    let mut max: u32 = (arr.len() - 1) as u32;

    while min <= max {
        let mid: u32 = (min + max) / 2;
        let guess: i32 = arr[mid as usize];

        if guess == find {
            return mid as i32;
        } else if guess < find {
            min = mid + 1;
        } else {
            max = mid - 1;
        }
    }

    return -1;
}


fn run_binary_search_vec() {
    let v: Vec<i32> = vec![1, 15, 22, 43, 168, 500, 502];

    let result_1 = binary_search_vec(&v, 1);
    assert_eq!(result_1, 0);

    let result_2 = binary_search_vec(&v, 15);
    assert_eq!(result_2, 1);

    let result_3 = binary_search_vec(&v, 22);
    assert_eq!(result_3, 2);

    let result_4 = binary_search_vec(&v, 43);
    assert_eq!(result_4, 3);

    let result_5 = binary_search_vec(&v, 168);
    assert_eq!(result_5, 4);

    let result_6 = binary_search_vec(&v, 500);
    assert_eq!(result_6, 5);

    let result_7 = binary_search_vec(&v, 502);
    assert_eq!(result_7, 6);

    let result_8 = binary_search_vec(&v, 888);
    assert_eq!(result_8, -1);
}

fn binary_search_vec(v: &Vec<i32>, find: i32) -> i32 {
    let mut min: u32 = 0;
    let mut max: u32 = (v.len() - 1) as u32;

    while min <= max {
        let mid: u32 = (min + max) / 2;
        let guess: i32 = v[mid as usize];

        if guess == find {
            return mid as i32;
        } else if guess < find {
            min = mid + 1;
        } else {
            max = mid - 1;
        }
    }

    return -1;
}