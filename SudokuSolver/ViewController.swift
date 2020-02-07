//
//  ViewController.swift
//  SudokuSolver
//
//  Created by johnson mathew on 1/7/18.
//  Copyright © 2018 JM. All rights reserved.
//

import Cocoa


final class ViewController: NSViewController {
    @IBOutlet weak var t00: NSTextField!
    @IBOutlet weak var t01: NSTextField!
    @IBOutlet weak var t02: NSTextField!
    @IBOutlet weak var t03: NSTextField!
    @IBOutlet weak var t04: NSTextField!
    @IBOutlet weak var t05: NSTextField!
    @IBOutlet weak var t06: NSTextField!
    @IBOutlet weak var t07: NSTextField!
    @IBOutlet weak var t08: NSTextField!
    
    @IBOutlet weak var t10: NSTextField!
    @IBOutlet weak var t11: NSTextField!
    @IBOutlet weak var t12: NSTextField!
    @IBOutlet weak var t13: NSTextField!
    @IBOutlet weak var t14: NSTextField!
    @IBOutlet weak var t15: NSTextField!
    @IBOutlet weak var t16: NSTextField!
    @IBOutlet weak var t17: NSTextField!
    @IBOutlet weak var t18: NSTextField!
    
    @IBOutlet weak var t20: NSTextField!
    @IBOutlet weak var t21: NSTextField!
    @IBOutlet weak var t22: NSTextField!
    @IBOutlet weak var t23: NSTextField!
    @IBOutlet weak var t24: NSTextField!
    @IBOutlet weak var t25: NSTextField!
    @IBOutlet weak var t26: NSTextField!
    @IBOutlet weak var t27: NSTextField!
    @IBOutlet weak var t28: NSTextField!
    
    @IBOutlet weak var t30: NSTextField!
    @IBOutlet weak var t31: NSTextField!
    @IBOutlet weak var t32: NSTextField!
    @IBOutlet weak var t33: NSTextField!
    @IBOutlet weak var t34: NSTextField!
    @IBOutlet weak var t35: NSTextField!
    @IBOutlet weak var t36: NSTextField!
    @IBOutlet weak var t37: NSTextField!
    @IBOutlet weak var t38: NSTextField!
    
    @IBOutlet weak var t40: NSTextField!
    @IBOutlet weak var t41: NSTextField!
    @IBOutlet weak var t42: NSTextField!
    @IBOutlet weak var t43: NSTextField!
    @IBOutlet weak var t44: NSTextField!
    @IBOutlet weak var t45: NSTextField!
    @IBOutlet weak var t46: NSTextField!
    @IBOutlet weak var t47: NSTextField!
    @IBOutlet weak var t48: NSTextField!
    
    @IBOutlet weak var t50: NSTextField!
    @IBOutlet weak var t51: NSTextField!
    @IBOutlet weak var t52: NSTextField!
    @IBOutlet weak var t53: NSTextField!
    @IBOutlet weak var t54: NSTextField!
    @IBOutlet weak var t55: NSTextField!
    @IBOutlet weak var t56: NSTextField!
    @IBOutlet weak var t57: NSTextField!
    @IBOutlet weak var t58: NSTextField!
    
    @IBOutlet weak var t60: NSTextField!
    @IBOutlet weak var t61: NSTextField!
    @IBOutlet weak var t62: NSTextField!
    @IBOutlet weak var t63: NSTextField!
    @IBOutlet weak var t64: NSTextField!
    @IBOutlet weak var t65: NSTextField!
    @IBOutlet weak var t66: NSTextField!
    @IBOutlet weak var t67: NSTextField!
    @IBOutlet weak var t68: NSTextField!
    
    @IBOutlet weak var t70: NSTextField!
    @IBOutlet weak var t71: NSTextField!
    @IBOutlet weak var t72: NSTextField!
    @IBOutlet weak var t73: NSTextField!
    @IBOutlet weak var t74: NSTextField!
    @IBOutlet weak var t75: NSTextField!
    @IBOutlet weak var t76: NSTextField!
    @IBOutlet weak var t77: NSTextField!
    @IBOutlet weak var t78: NSTextField!
    
    @IBOutlet weak var t80: NSTextField!
    @IBOutlet weak var t81: NSTextField!
    @IBOutlet weak var t82: NSTextField!
    @IBOutlet weak var t83: NSTextField!
    @IBOutlet weak var t84: NSTextField!
    @IBOutlet weak var t85: NSTextField!
    @IBOutlet weak var t86: NSTextField!
    @IBOutlet weak var t87: NSTextField!
    @IBOutlet weak var t88: NSTextField!
    
    @IBOutlet weak var statusLabel: NSTextField!
    
    
    
    var gameStatus : GameStatus = GameStatus.Invalid
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        for field  in view.subviews {
            if field.isMember(of: NSTextField.self) {
                field.layer?.backgroundColor = NSColor.white.cgColor
            }
        }
    }
    
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func buttonCLick(_ sender: NSButton) {
        cancel = false //If true thread will be cancelled
        
        for field  in view.subviews {
            if field.isMember(of: NSTextField.self) {
                if (field as! NSTextField).intValue != 0 {
                    field.layer?.backgroundColor = NSColor.gray.cgColor
                }
            }
        }
        
        
        let theBoard : Array<Array<Int>> =                                          [[Int(t00.intValue),Int(t01.intValue),Int(t02.intValue),Int(t03.intValue),Int(t04.intValue),Int(t05.intValue),Int(t06.intValue),Int(t07.intValue),Int(t08.intValue)],[Int(t10.intValue),Int(t11.intValue),Int(t12.intValue),Int(t13.intValue),Int(t14.intValue),Int(t15.intValue),Int(t16.intValue),Int(t17.intValue),Int(t18.intValue)],[Int(t20.intValue),Int(t21.intValue),Int(t22.intValue),Int(t23.intValue),Int(t24.intValue),Int(t25.intValue),Int(t26.intValue),Int(t27.intValue),Int(t28.intValue)],[Int(t30.intValue),Int(t31.intValue),Int(t32.intValue),Int(t33.intValue),Int(t34.intValue),Int(t35.intValue),Int(t36.intValue),Int(t37.intValue),Int(t38.intValue)],[Int(t40.intValue),Int(t41.intValue),Int(t42.intValue),Int(t43.intValue),Int(t44.intValue),Int(t45.intValue),Int(t46.intValue),Int(t47.intValue),Int(t48.intValue)],[Int(t50.intValue),Int(t51.intValue),Int(t52.intValue),Int(t53.intValue),Int(t54.intValue),Int(t55.intValue),Int(t56.intValue),Int(t57.intValue),Int(t58.intValue)],[Int(t60.intValue),Int(t61.intValue),Int(t62.intValue),Int(t63.intValue),Int(t64.intValue),Int(t65.intValue),Int(t66.intValue),Int(t67.intValue),Int(t68.intValue)],[Int(t70.intValue),Int(t71.intValue),Int(t72.intValue),Int(t73.intValue),Int(t74.intValue),Int(t75.intValue),Int(t76.intValue),Int(t77.intValue),Int(t78.intValue)],[Int(t80.intValue),Int(t81.intValue),Int(t82.intValue),Int(t83.intValue),Int(t84.intValue),Int(t85.intValue),Int(t86.intValue),Int(t87.intValue),Int(t88.intValue)]]
        
        
        
        let animation : () -> CAAnimation = { () -> CAAnimation in
            let animation = CABasicAnimation.init(keyPath: "backgroundColor")
            animation.fromValue = NSColor.blue.cgColor
            animation.toValue = NSColor.white.cgColor
            animation.duration = 1.0
            animation.autoreverses = true
            animation.repeatCount = .infinity
            return animation
        }
        
        for field  in view.subviews {
            if let f = field as? NSTextField , f.intValue == 0{
                f.layer?.add(animation(), forKey: "backgroundColor")
            }
        }
        
        
        statusLabel.setValue("In progress!!", forKey: "stringValue")
        
        _ = start(theBoard: theBoard, updateUi: { [weak self] (newBoard :Array<Array<Square>>)  in
            guard let safeSelf = self else { return }
            var index = 0
            for array in newBoard {
                for square in array {
                    if (square.value != 0){
                        if  let field =  safeSelf.view.subviews[index] as? NSTextField ,  field.intValue == 0 {
                            field.setValue(square.value, forKey: "intValue")
                            field.layer?.removeAllAnimations()
                            field.layer?.backgroundColor = NSColor.orange.cgColor
                        }
                    }
                    index += 1
                }
            }
            }, completed: {[weak self] status  in
                guard let safeSelf = self else {return }
                switch status{
                case .Invalid:
                    safeSelf.statusLabel.setValue("Invalid", forKey: "stringValue")
                    break
                case .Success:
                    safeSelf.statusLabel.setValue("Done", forKey: "stringValue")
                    break
                case .Failed:
                    safeSelf.statusLabel.setValue("Failed", forKey: "stringValue")
                    break
                case .InActive:
                    break
                }
                
                for field  in safeSelf.view.subviews {
                    if let f = field as? NSTextField{
                        f.layer?.removeAllAnimations()
                    }
                }
        })
    }
    
    
    
    @IBAction func sample1(_ sender: Any) {
        loadSample(group:   [[0, 0, 5, 0, 0, 7, 0, 0, 1],
                             [0, 6, 0, 0, 9, 0, 0, 8, 0],
                             [3, 0, 0, 6, 0, 0, 5, 0, 0],
                             [8, 0, 0, 5, 0, 0, 1, 0, 0],
                             [0, 5, 0, 0, 8, 0, 0, 2, 0],
                             [0, 0, 1, 0, 0, 4, 0, 0, 8],
                             [0, 0, 6, 0, 0, 1, 0, 0, 3],
                             [0, 1, 0, 0, 6, 0, 0, 4, 0],
                             [7, 0, 0, 2, 0, 0, 9, 0, 0]])
    }
    
    @IBAction func sample2(_ sender: Any) {
        loadSample(group:   [[0, 0, 5, 3, 0, 0, 0, 0, 0],
                             [8, 0, 0, 0, 0, 0, 0, 2, 0],
                             [0, 7, 0, 0, 1, 0, 5, 0, 0],
                             [4, 0, 0, 0, 0, 5, 3, 0, 0],
                             [0, 1, 0, 0, 7, 0, 0, 0, 6],
                             [0, 0, 3, 2, 0, 0, 0, 8, 0],
                             [0, 6, 0, 5, 0, 0, 0, 0, 9],
                             [0, 0, 4, 0, 0, 0, 0, 3, 0],
                             [0, 0, 0, 0, 0, 9, 7, 0, 0]])
    }
    
    @IBAction func sample3(_ sender: Any) {
        loadSample(group: [[0, 0, 0, 3, 4, 0, 0, 0, 0],
                           [6, 0, 0, 0, 0, 1, 0, 4, 0],
                           [7, 0, 4, 0, 0, 5, 1, 0, 0],
                           [8, 0, 0, 0, 6, 0, 0, 1, 5],
                           [0, 2, 0, 0, 0, 0, 4, 0, 7],
                           [5, 0, 0, 0, 0, 0, 0, 0, 3],
                           [0, 0, 0, 9, 0, 0, 0, 0, 0],
                           [0, 0, 7, 0, 5, 3, 0, 0, 0],
                           [0, 0, 0, 4, 1, 0, 5, 2, 0]])
    }
    
    @IBAction func sample4(_ sender: Any) {
        loadSample(group:   [[8, 0, 0, 0, 0, 0, 0, 0, 0],
                             [0, 0, 3, 6, 0, 0, 0, 0, 0],
                             [0, 7, 0, 0, 9, 0, 2, 0, 0],
                             [0, 5, 0, 0, 0, 7, 0, 0, 0],
                             [0, 0, 0, 0, 4, 5, 7, 0, 0],
                             [0, 0, 0, 1, 0, 0, 0, 3, 0],
                             [0, 0, 1, 0, 0, 0, 0, 6, 8],
                             [0, 0, 8, 5, 0, 0, 0, 1, 0],
                             [0, 9, 0, 0, 0, 0, 4, 0, 0]])
    }
    
    @IBAction func clear(_ sender: Any?) {
        cancel = true
        for field  in view.subviews {
            if field.isMember(of: NSTextField.self) {
                field.setValue("", forKey: "stringValue")
                field.layer?.backgroundColor = NSColor.white.cgColor
                field.layer?.removeAllAnimations()
            }
        }
    }
    
    func isValid(arrays : Array<Array<Square>>) throws -> Bool {
        var valid = true
        for ar in arrays {
            let initial : (Int?, Bool) = (nil,true)
            let result = ar.sorted {  $0.value > $1.value }.filter { $0.value != 0 }.reduce(initial) {
                if (1...9).contains($1.value) == false {
                    return ($1.value,false)
                }
                guard let x = $0.0 else { return ($1.value,true)}
                if x == $1.value {
                    return ($1.value,false)
                }
                else {
                    return ($1.value,$0.1 && true)
                }
            }
            valid = valid && result.1
        }
        return valid
    }
    
    
    func loadSample(group : Array<Array<Int>>) -> Void {
        clear(nil)
        var index = 0
        for array in group {
            for value in array {
                let field =  view.subviews[index]
                if (value != 0){
                    field.setValue(value, forKey: "intValue")
                    field.layer?.backgroundColor = NSColor.gray.cgColor
                }
                else{
                    field.setValue("", forKey: "stringValue")
                    field.layer?.backgroundColor = NSColor.white.cgColor
                }
                index += 1
            }
        }
    }
    
    
    func control(_ control: NSControl, textShouldEndEditing fieldEditor: NSText) -> Bool {
        
        let errorColor : () -> Void = { () -> Void in
            fieldEditor.layer?.borderWidth = 2
            fieldEditor.layer?.borderColor = NSColor.red.cgColor
            fieldEditor.layer?.backgroundColor = NSColor.white.cgColor
        }
        
        let validColor : () -> Void = { () -> Void in
            fieldEditor.layer?.borderWidth = 1
            fieldEditor.layer?.borderColor = NSColor.clear.cgColor
        }
        
        guard let value = Int(fieldEditor.string) else {
            errorColor()
            return false
        }
        
        if (value >= 1 &&  value <= 9) {
            validColor()
            return true
        }
        
        errorColor()
        return false;
        
    }
    
    
    func updateValue(group : Array<Array<Int>>) -> Void {
        var index = 0
        for array in group {
            for value in array {
                if (value != 0){
                    let field =  view.subviews[index]
                    field.setValue(value, forKey: "intValue")
                    field.layer?.removeAllAnimations()
                    field.layer?.backgroundColor = NSColor.orange.cgColor
                }
                index += 1
            }
        }
    }
    
    
    
    func start(theBoard : Array<Array<Int>>, updateUi : @escaping (_ theBoard : Array<Array<Square>>) ->  Void , completed : @escaping (_ status : GameStatus) -> Void) -> Void {
        print(theBoard)
        queue.sync {[weak self] in
            guard let safeSelf = self else {return }
            _ =  safeSelf.runInCurrentThread(theBoard: theBoard, updateUI: { (board) in
                DispatchQueue.main.async {
                    if cancel == false {
                        updateUi(board)
                    }
                }
            }, completed: { (status) in
                DispatchQueue.main.async {
                    if cancel == false {
                        completed(status)
                    }
                }
            })
        }
    }
    
    
    func runInCurrentThread(theBoard : Array<Array<Int>>, updateUI : @escaping (_ theBoard : Array<Array<Square>>) ->  Void , completed : @escaping (_ status : GameStatus) -> Void) -> (GameStatus, Array<Array<Square>>) {
        var theNewBoard : Array<Array<Square>> = []
        
        var processLevel : Steps = .first
        
        for row in theBoard{
            var board : Array<Square> = []
            for val in row{
                board.append(Square(value: val))
            }
            theNewBoard.append(board)
        }
        
        //Set row
        
        for boards in theNewBoard{
            for board in boards{
                board.row = boards
            }
        }
        
        var theNewBox : Array<Array<Square>> = []
        
        var b1 : ArraySlice<Square> = []
        var b2 : ArraySlice<Square> = []
        var b3 : ArraySlice<Square> = []
        
        for index in [0,3,6]{
            let start = index
            let end = start + 2
            for boards in theNewBoard[start...end]{
                b1 += boards[0...2]
                b2 += boards[3...5]
                b3 += boards[6...8]
            }
            
            theNewBox.append(Array(b1))
            theNewBox.append(Array(b2))
            theNewBox.append(Array(b3))
            b1.removeAll()
            b2.removeAll();
            b3.removeAll();
        }
        
        //adding box
        
        for boards in theNewBox{
            for board in boards{
                board.box = boards
            }
        }
        
        
        var theNewCol : Array<Array<Square>> = []
        
        var col : Array<Square> = []
        
        
        for index in 0...8{
            for boards in theNewBoard{
                col.append(boards[index])
            }
            theNewCol.append(col)
            col.removeAll()
        }
        
        for boards in theNewCol{
            for board in boards{
                board.col = boards
            }
        }
        
        let valid = try? isValid(arrays: theNewBoard) && isValid(arrays: theNewBox) && isValid(arrays: theNewCol)
        
        if valid == nil || valid == false {
            gameStatus = .Invalid
            
            completed(gameStatus)
            
            return (gameStatus,theNewBoard)
        }
        
        func updateState(){
            for items in theNewBoard {
                for item in items{
                    item.collectPossibleValues()
                }
            }
        }
        
        
        func solve() {
            switch processLevel {
            case .first:
                updateState()
                break
            case .second:
                var arrayofPossibleValues : Array<Array<Int>> = [[]]
                for items in theNewCol {
                    arrayofPossibleValues.removeAll()
                    for item in items{
                        if item.possibleColValuesRefined.count != 0 {
                            arrayofPossibleValues.append(item.possibleColValuesRefined)
                        }
                    }
                    let subset = findSubset(arrays: arrayofPossibleValues)
                    
                    if subset.count != 0 {
                        for item in items{
                            if item.value == 0 {
                                item.possibleColValuesRefined = substractIfNotEqual(array: item.possibleColValuesRefined, substractWith: subset)
                                if item.possibleColValuesRefined.count == 1{
                                    processLevel = .first
                                }
                            }
                        }
                    }
                }
                break
            case .third:
                var arrayofPossibleValues : Array<Array<Int>> = [[]]
                for items in theNewBoard {
                    arrayofPossibleValues.removeAll()
                    for item in items{
                        if item.possibleRowValuesRefined.count != 0 {
                            arrayofPossibleValues.append(item.possibleRowValuesRefined)
                        }
                    }
                    let subset = findSubset(arrays: arrayofPossibleValues)
                    
                    if subset.count != 0 {
                        for item in items{
                            if item.value == 0 {
                                item.possibleRowValuesRefined = substractIfNotEqual(array: item.possibleRowValuesRefined, substractWith: subset)
                                if item.possibleRowValuesRefined.count == 1{
                                    processLevel = .first
                                }
                            }
                        }
                    }
                }
                break
            case .fourth:
                for row in theNewBoard{
                    var possibleValues : Array<Array<Int>> = [[]]
                    for item in row{
                        possibleValues.append(item.possibleRowValuesRefined)
                    }
                    let nonRepeatingValues = getNonRepeatingElements(arrays: possibleValues)
                    if nonRepeatingValues.count != 0{
                        for item in row{
                            item.possibleRowValuesRefined = shrink(array: item.possibleRowValuesRefined, iffoundAny: nonRepeatingValues)
                            processLevel = .first
                        }
                    }
                }
                for row in theNewCol{
                    var possibleValues : Array<Array<Int>> = [[]]
                    for item in row{
                        possibleValues.append(item.possibleColValuesRefined)
                    }
                    let nonRepeatingValues = getNonRepeatingElements(arrays: possibleValues)
                    if nonRepeatingValues.count != 0{
                        for item in row{
                            item.possibleColValuesRefined = shrink(array: item.possibleColValuesRefined, iffoundAny: nonRepeatingValues)
                            processLevel = .first
                        }
                    }
                }
                break
            case .final:
                diggingLevel += 1
                
                let sorted = theNewBoard.flatMap { $0 }.sorted(by: { $0.possibleRowValuesRefined.count < $1.possibleRowValuesRefined.count }).filter { $0.possibleRowValuesRefined.count != 0 }
                
                if let square = sorted.first {
                    let count : Int = square.possibleRowValuesRefined.count
                    for index in 0...count - 1{
                        if cancel { break }
                        if diggingLevel == 1 && (count - 1) == index {
                            square.possibleRowValuesRefined = [square.possibleRowValuesRefined[index]]
                            processLevel = .first
                            break
                        }
                        else{
                            square.value = square.possibleRowValuesRefined[index]
                            let theBoard = theNewBoard.map{$0.map{$0.value}}
                            square.value = 0
                            let result = runInCurrentThread(theBoard: theBoard, updateUI: {_ in }, completed: {_ in })
                            if  result.0 == GameStatus.Success {
                                theNewBoard = ^result.1
                                processLevel = .first
                                break;
                            }
                        }
                    }
                }
                
                diggingLevel -= 1
                break
            }
            
            
            var final : ResolveResult = .HasValue
            loop : for items in theNewBoard{
                for item in items{
                    switch item.Resolve(processedLevel: processLevel) {
                    case .HasValue:
                        updateUI(theNewBoard)
                        break
                    case .Conflict:
                        final = .Conflict
                        break
                    case .Resolved:
                        updateUI(theNewBoard)
                        final = .Resolved
                        break loop
                    case .Failed:
                        final = .Failed
                        break
                    }
                }
            }
            
            switch final {
            case .Resolved:
                processLevel = .first
                solve()
                break
            case .Conflict:
                processLevel.Next()
                solve()
                break
            case .HasValue:
                gameStatus = .Success
                break
            case .Failed:
                gameStatus = .Failed
            }
        }
        
        processLevel = .first
        solve()
        
        completed(gameStatus)
        
        return (gameStatus, theNewBoard)
    }
}



