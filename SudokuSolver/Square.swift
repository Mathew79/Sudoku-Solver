//
//  Square.swift
//  SudokuSolver
//
//  Created by johnson mathew on 1/8/18.
//  Copyright © 2018 JM. All rights reserved.
//

import Cocoa

final class Square: CustomStringConvertible {
    var description: String{
        return "\(value)"
    }
    
    var value = 0
    var row : Array<Square> = []
    var box : Array<Square> = []
    var col : Array<Square> = []
    
    
    
    
    init(value : Int) {
        self.value = value
    }
    
    var possibleRowValues : [Int] = []
    var possibleColValues : [Int] = []
    
    var possibleRowValuesRefined : [Int] = []
    var possibleColValuesRefined : [Int] = []
    
    func missingValues(array : Array<Square>) -> [Int] {
        typealias initialValue = (Int,[Int])
        let initial : initialValue = (10, [])
        let x = array.sorted {  $0.value > $1.value }.reduce(into : initial) { (x, y)  in
            if x.0 != 0{
                for m in (y.value + 1)..<x.0{
                    x.1.append(m)
                }
            }
            x.0 = y.value
        }
        return x.1
        
    }
    
    func uniqueValues(missingRowValues row : Array<Int>,col : Array<Square>,box : Array<Square>) ->  Array<Int> {
        let countableSet = (box + col).flatMap { $0.value }.filter { $0 != 0}
        let unique = row.filter { !countableSet.contains($0) }
        return unique
    }
    
    func uniqueValues(array : Array<Int> , searchIn : Array<Int>) -> Array<Int>{
        return array.filter { !searchIn.contains($0) }
    }
    
    
    func collectPossibleValues() -> Void {
        if self.value == 0 {
            possibleRowValues = self.missingValues(array: row)
            possibleColValues = self.missingValues(array: col)
            
            possibleRowValuesRefined = RefinedValues(missingValues: possibleRowValues, item: self.col)
            
            possibleColValuesRefined = RefinedValues(missingValues: possibleColValues, item: self.row)
        }
        else{
            possibleRowValues.removeAll()
            possibleColValues.removeAll()
            possibleRowValuesRefined.removeAll()
            possibleColValuesRefined.removeAll()
        }
    }
    
    func RefinedValues(missingValues : Array<Int>,item : Array<Square>) -> Array<Int> {
        return self.uniqueValues(missingRowValues: missingValues, col: item, box: self.box)
    }
    
    func Resolve(processedLevel : Steps ) -> ResolveResult {
        if self.value != 0 {
            return .HasValue
        }
        else{
            switch processedLevel {
            case .first:
                if possibleRowValuesRefined.count == 1 {
                    self.value = possibleRowValuesRefined[0]
                    return .Resolved
                }
                if possibleColValuesRefined.count == 1 {
                    self.value = possibleColValuesRefined[0]
                    return .Resolved
                }
                return  .Conflict
            case .second,.third,.fourth:
                return .Conflict
            case .final:
                return .Failed
            }
        }
    }
}


extension Square : NSCopying{
    func copy(with zone: NSZone? = nil) -> Any {
        return Square(value: self.value)
    }
}
