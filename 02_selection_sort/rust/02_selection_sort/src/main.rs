fn main() {
    let v_1: Vec<i32> = vec![0, -10, 10, -4, -5];
    let sorted_vec_1 = selection_sort_vec(&v_1);

    assert_eq!(sorted_vec_1, [-10, -5, -4, 0, 10]);



    let v_2: Vec<i32> = vec![3, 2, 1];
    let sorted_vec_2 = selection_sort_vec(&v_2);

    assert_eq!(sorted_vec_2, [1, 2, 3]);
}


fn selection_sort_vec(v: &Vec<i32>) -> Vec<i32>{
    let mut input_vector: Vec<i32> = v.clone();
    let mut sorted_vector: Vec<i32> = Vec::new();

    for _ in v.iter() {
        let smallest_element_with_index = find_smallest_element_into_vec(&input_vector);
        sorted_vector.push(input_vector[smallest_element_with_index]);
        input_vector.swap_remove(smallest_element_with_index);
    }

    return sorted_vector;
}


fn find_smallest_element_into_vec(v: &Vec<i32>) -> usize {
    let mut smallest: &i32 = &v[0];
    let mut smallest_element_with_index: usize = 0;

    for (pos, elem) in v.iter().enumerate() {
        if elem < smallest {
            smallest = elem;
            smallest_element_with_index = pos;
        }
    }

    return smallest_element_with_index;
}