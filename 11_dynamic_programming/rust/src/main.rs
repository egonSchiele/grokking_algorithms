use std::cmp;

fn build_dp_table<T>(table1: &[T], table2: &[T]) -> Vec<Vec<u64>> {
    let mut dp_table = vec![];
    for i in 0..table1.len() {
        dp_table.push(vec![]);
        for _ in 0..table2.len() {
            dp_table[i].push(0);
        }
    }

    dp_table
}

fn longest_common_substring<T: Eq>(table1: &[T], table2: &[T]) -> Vec<Vec<u64>> {
    let mut dp_table = build_dp_table(table1, table2);

    for (i, c1) in table1.into_iter().enumerate() {
        for (j, c2) in table2.into_iter().enumerate() {
            if c1 == c2 {
                dp_table[i][j] =
                    dp_table[i.checked_sub(1).unwrap_or(0)][j.checked_sub(1).unwrap_or(0)] + 1;
            } else {
                dp_table[i][j] = 0;
            }
        }
    }

    dp_table
}

fn longest_common_subsequence<T: Eq>(table1: &[T], table2: &[T]) -> Vec<Vec<u64>> {
    let mut dp_table = build_dp_table(table1, table2);

    for (i, c1) in table1.into_iter().enumerate() {
        for (j, c2) in table2.into_iter().enumerate() {
            if c1 == c2 {
                dp_table[i][j] =
                    dp_table[i.checked_sub(1).unwrap_or(0)][j.checked_sub(1).unwrap_or(0)] + 1;
            } else {
                dp_table[i][j] = cmp::max(
                    dp_table[i.checked_sub(1).unwrap_or(0)][j],
                    dp_table[i][j.checked_sub(1).unwrap_or(0)],
                );
            }
        }
    }

    dp_table
}

fn main() {
    let dp_table_blue = ['b', 'l', 'u', 'e'];
    let dp_table_clues = ['c', 'l', 'u', 'e', 's'];

    println!("Longest substring:");
    for line in longest_common_substring(&dp_table_blue, &dp_table_clues) {
        println!("{:?}", line)
    }

    println!("Longest subsequence:");
    for line in longest_common_subsequence(&dp_table_blue, &dp_table_clues) {
        println!("{:?}", line)
    }
}
