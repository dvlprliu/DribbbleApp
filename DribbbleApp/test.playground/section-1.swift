// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

func hasAnyMatch(list:Int[], operation:(n:Int) -> Bool ) -> Bool {
    
    for item in list {
        if operation(n: item) {
            return true
        }
    }
    
    return false
}

hasAnyMatch([28,283,12,4], {(n:Int) -> Bool in
    
        return n < 10
    
    })

var a = 1;
var b = a++
var c = ++a