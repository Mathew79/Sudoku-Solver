//
//  Functions.swift
//  SudokuSolver
//
//  Created by johnson mathew on 1/8/18.
//  Copyright © 2018 JM. All rights reserved.
//

import Cocoa

func == (left: Array<Int>, right: Array<Int>) -> Bool {
    if left.count != right.count {return false}
    var result = true
    for l in left {
        result = result && right.contains(l)
        if result == false {return false }
    }
    return result
}

prefix operator ^
prefix func ^<T>(rhs : Array<Array<T>>) -> Array<Array<T>> where T : NSCopying {
    var table : Array<Array<T>> = []
    for items in rhs {
        var row : Array<T> = []
        for item in items{
            row.append((item.copy(with: nil) as? T)!)
        }
        table.append(row)
    }
    return table
}

func findSubset(arrays : Array<Array<Int>>) -> Array<Int>{
    var searchWith : Array<Int> = []
    var count : Int?
    outer : for startIndex in 0..<arrays.count {
        if let c = count , c < arrays.count && c == searchWith.count { return searchWith}
        
        searchWith = arrays[startIndex]
        count = 0
        if searchWith.count < arrays.count {
            for index in 0..<arrays.count {
                if searchWith == arrays[index]{
                    count? += 1
                }
            }
        }
    }
    
    return ([])
}



func substractIfNotEqual(array : Array<Int>, substractWith : Array<Int>) -> Array<Int>{
    if array != substractWith {
        return array.filter { !substractWith.contains($0)}
    }
    return array
}


func getNonRepeatingElements(arrays : Array<Array<Int>>) -> Array<Int>{
    let numbers = arrays.flatMap {$0}
    let numbersCount = numbers.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    return numbersCount.filter{$1 == 1}.map {$0.key}
}


func shrink(array : Array<Int>, iffoundAny values : Array<Int>) -> Array<Int> {
    for value in values {
        if array.contains(value) {
            return [value]
        }
    }
    return array
}


enum ResolveResult{
    case Resolved,Conflict,HasValue,Failed
}

enum GameStatus{
    case Success,Failed,Invalid,InActive
}

enum Steps{
    case first,second,third,fourth,final
    
    mutating func Next(){
        switch self {
        case .first:
            self = .second
            break;
        case .second:
            self = .third
        case .third:
            self = .fourth
        case .fourth:
            self = .final
        case .final:
            break
        }
    }
}


var diggingLevel = 0
let queue = DispatchQueue(label: "serialQueue")
var cancel = false

func missingValues(array : Array<Int>) -> [Int] {
    typealias initialValue = (Int,[Int])
    let initial : initialValue = (10, [])
    let x = array.sorted {  $0 > $1 }.reduce(initial) { (x, y) -> initialValue in
        var M = x.1
        if x.0 != 0{
            for m in (y + 1)..<x.0{
                M.append(m)
            }
        }
        return  (y,M)
    }
    return x.1
}
