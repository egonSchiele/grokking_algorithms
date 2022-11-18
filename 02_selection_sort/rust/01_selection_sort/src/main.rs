// Swaps elements in an array
fn swap<T: Copy>(list: &mut [T], index_a: usize, index_b: usize) {
    let tmp = list[index_a];
    list[index_a] = list[index_b];
    list[index_b] = tmp;
}

fn selection_sort<T: PartialOrd + Copy>(list: &mut [T]) {
    for i in 0..list.len() {
        for j in (i+1)..list.len() {
            if list[j] > list[i] {
                swap(list, i, j);
            }
        }
    }
}

fn main() {
    let list = &mut [156, 141, 35, 94, 88, 61, 111];
    print!("{:?} => ", list);
    selection_sort(list);
    print!("{:?}\n", list);
}

#[cfg(test)]
mod test {
    use super::selection_sort;

    #[test]
    fn sort_unsigned_list() {
        let mut list : [u8; 7] = [156, 141, 35, 94, 88, 61, 111];
        let list_sorted : [u8; 7] = [156, 141, 111, 94, 88, 61, 35];
        selection_sort(&mut list);

        assert_eq!(list, list_sorted);
    }

    #[test]
    fn sort_signed_list() {
        let mut list : [i32; 10] = [75, 85, -26, 61, 20, -40, -72, 30, -27, 58];
        let list_sorted : [i32; 10] = [85, 75, 61, 58, 30, 20, -26, -27, -40, -72];
        selection_sort(&mut list);

        assert_eq!(list, list_sorted);
    }

    #[test]
    fn sort_strings() {
        let mut list : [&str; 7] = ["Radiohead", "Kishore Kumar", "The Black Keys",
            "Neutral Milk Hotel", "Beck", "The Strokes", "Wilco"
        ];
        let list_sorted : [&str; 7] = ["Wilco", "The Strokes", "The Black Keys", 
            "Radiohead", "Neutral Milk Hotel", "Kishore Kumar", "Beck"
        ];
        selection_sort(&mut list);

        assert_eq!(list, list_sorted);
    }

    #[test]
    fn sorts_an_empty_list() {
        let mut list : [u8; 0] = [];
        let list_sorted : [u8; 0] = [];
        selection_sort(&mut list);

        assert_eq!(list, list_sorted);
    }
}