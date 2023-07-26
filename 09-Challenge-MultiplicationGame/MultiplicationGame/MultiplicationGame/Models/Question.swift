//
//  Question.swift
//  MultiplicationGame
//
//  Created by Po Hsiang Chao on 2023/7/26.
//

import Foundation

struct Question {
    var multiplicationNumber: Int
    var operand: Int
    var options = [Int]()
    
    var answer: Int {
        multiplicationNumber * operand
    }
    
    init(multiplicationNumber: Int, operand: Int) {
        self.multiplicationNumber = multiplicationNumber
        self.operand = operand
        self.options = self.createOptions()
    }
    
    func createOptions() -> [Int] {
        var selectOptions = [Int]()
        selectOptions.append(answer)
        
        while selectOptions.count < 3 {
            let option = Int.random(in: 1...150)
            if selectOptions.contains(option) == false {
                selectOptions.append(option)
            }
        }
        
        return selectOptions.shuffled()
    }
}
