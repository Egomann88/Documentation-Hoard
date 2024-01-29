{
    counts[$1]++
}

END {
    max_count = 0

    for (number in counts) {
        if (counts[number] > max_count) {
            max_count = counts[number]
        }
    }

    for (number in counts) {
        if (counts[number] == max_count) {
            print number
        }
    }
}