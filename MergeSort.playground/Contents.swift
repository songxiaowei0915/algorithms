import UIKit

typealias Criteria<T> = (T, T) -> Bool

func merge<T: Comparable>(leftArr: Array<T> , rightArr: Array<T>, byCriteria: Criteria<T>) -> Array<T>
{
    var result = [T]()
    var left = leftArr
    var right = rightArr
    
    while (left.count > 0 && right.count > 0) {
        if byCriteria(left[0], right[0]) {
            result.append(left.removeFirst());
        } else {
            result.append(right.removeFirst());
        }
    }

    while left.count > 0 {
        result.append(left.removeFirst());
    }

    while right.count > 0 {
        result.append(right.removeFirst());
    }

    return result;
}

func mergeSort<T: Comparable>(_ coll: Array<T>, byCriteria: Criteria<T> = { $0 > $1 }) ->Array<T>  {
    
    
    let len = coll.count;
    if(len < 2) {
        return coll;
    }
    let arr = coll
    let middle = Int(floor(Double(len / 2)))
    let left = Array(arr[0 ..< middle])
    let right = Array(arr[middle ..< coll.count])
    
    return merge(leftArr: mergeSort(left), rightArr: mergeSort(right), byCriteria: byCriteria);
}


let a = [9,4,6,3,434,65,493,2,4]
let b = mergeSort(a)
print(b)
let c = mergeSort(a, byCriteria:  < )
print(c)
