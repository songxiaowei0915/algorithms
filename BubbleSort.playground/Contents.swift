import UIKit

typealias Criteria<T> = (T, T) -> Bool

func bubbleSortOf<T: Comparable> (_ coll: Array<T>, byCriteria: Criteria<T> = { $0 > $1 }) -> Array<T> {
    guard coll.count > 1 else {
        return coll
    }
    
    var result = coll
    for i in 0 ..< coll.count - 1 {
        for j in 0 ..< coll.count-1-i {
            if byCriteria(result[j], result[j+1]) {
                result.swapAt(j, j+1)
            }
        }
    }
    
    
    return result
}

let a = [9,4,6,3,434,65,493,2,4]
let b = bubbleSortOf(a)
print(b)
let c = bubbleSortOf(a, byCriteria:  < )
print(c)


