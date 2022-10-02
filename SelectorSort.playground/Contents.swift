import UIKit

typealias Criteria<T> = (T, T) -> Bool

func selectionSortOf<T: Comparable>(_ coll: Array<T>, byCriteria: Criteria<T> = { $0 > $1}) -> Array<T> {
    guard coll.count > 1 else {
        return coll
    }
    
    var result = coll
    
    for i in 0 ..< coll.count-1 {
        var index = i
        var key = result[index]
        var y = i + 1
        while y < coll.count  {
            if byCriteria(key, result[y]) {
                index = y
                key = result[index]
            }
            y += 1
        }
        
        result.swapAt(i, index)
    }
    
    return result
}

var a = [34,53,3,5,2,7,98,2]
var b = selectionSortOf(a)
print(b)
var c = selectionSortOf(a, byCriteria: < )
print(c)
