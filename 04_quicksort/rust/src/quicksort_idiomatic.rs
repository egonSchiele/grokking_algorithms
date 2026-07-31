pub fn quicksort<T: Ord>(list: &mut [T]) {
    if list.len() < 2 {
        return;
    }

    let pivot_index = partition(list);

    let (left, right) = list.split_at_mut(pivot_index);

    quicksort(left);
    quicksort(&mut right[1..]); // right[0] is the pivot, already placed
}

fn partition<T: Ord>(list: &mut [T]) -> usize {
    let pivot_index = list.len() - 1;
    let mut i = 0;

    for j in 0..pivot_index {
        if list[j] <= list[pivot_index] {
            list.swap(i, j);
            i += 1;
        }
    }

    list.swap(i, pivot_index);
    i
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn empty_list() {
        let mut list: Vec<i32> = vec![];
        quicksort(&mut list);
        assert_eq!(list, Vec::<i32>::new());
    }

    #[test]
    fn single_element() {
        let mut list = vec![42];
        quicksort(&mut list);
        assert_eq!(list, vec![42]);
    }

    #[test]
    fn already_sorted() {
        let mut list = vec![1, 2, 3, 4, 5];
        quicksort(&mut list);
        assert_eq!(list, vec![1, 2, 3, 4, 5]);
    }

    #[test]
    fn reverse_sorted() {
        let mut list = vec![5, 4, 3, 2, 1];
        quicksort(&mut list);
        assert_eq!(list, vec![1, 2, 3, 4, 5]);
    }

    #[test]
    fn with_duplicates() {
        let mut list = vec![3, 1, 3, 2, 1];
        quicksort(&mut list);
        assert_eq!(list, vec![1, 1, 2, 3, 3]);
    }

    #[test]
    fn general_case() {
        let mut list = vec![9, 5, 1, 8, 3, 7, 2, 6, 4];
        quicksort(&mut list);
        assert_eq!(list, vec![1, 2, 3, 4, 5, 6, 7, 8, 9]);
    }

    #[test]
    fn all_equal_elements() {
        let mut list = vec![7, 7, 7, 7];
        quicksort(&mut list);
        assert_eq!(list, vec![7, 7, 7, 7]);
    }

    #[test]
    fn works_with_strings() {
        let mut list = vec!["banana", "apple", "cherry"];
        quicksort(&mut list);
        assert_eq!(list, vec!["apple", "banana", "cherry"]);
    }
}
