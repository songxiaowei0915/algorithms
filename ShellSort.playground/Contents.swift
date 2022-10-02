import UIKit

typealias Criteria<T> = (T, T) -> Bool

func shellSort<T: Comparable>(_ coll: Array<T>, byGap: Int = 2, byCriteria: Criteria<T> = { $0 > $1}) -> Array<T> {
    guard coll.count > 1 else {
        return coll
    }
    
    var result = coll
    var gap = byGap
    while gap > 0 {
        for x in stride(from: gap, to: coll.count, by: gap) {
            var y = x
            var key = result[y]
         
            while y > 0 && byCriteria(result[y-gap],key) {
                result.swapAt(y, y-gap)
                y -= gap
            }
        }
        
        gap -= 1
    }
    return result
}

let a: Array<Int> = [2,40,4932,863,0,94,64,43]
let b = shellSort(a)
print(b)
let c = shellSort(a,byCriteria: < )
print(c)
