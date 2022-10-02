import UIKit

typealias Criteria<T> = (T, T) -> Bool

func insertionSortOf<T: Comparable>(_ coll: Array<T>, byCriteria: Criteria<T> = { $0 < $1}) -> Array<T> {
    guard coll.count > 1 else {
        return coll
    }
    
    var result = coll
    
    for x in 1 ..< coll.count {
        var y = x
        var key = result[y]
     
        while y > 0 && byCriteria(result[y-1], key) {
            result.swapAt(y, y-1)
            y -= 1
        }
    }
    
    return result
}

let a: Array<Int> = [2,40,4932,863,0,94,64,43]
let b = insertionSortOf(a)
print(b)
let c = insertionSortOf(a,byCriteria: >)
print(c)
