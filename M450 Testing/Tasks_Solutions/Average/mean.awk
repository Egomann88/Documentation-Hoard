{
    sum += $1
    cnt += 1
}

END {
    print sum / cnt
}
