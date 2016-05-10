//
//  Queue.swift
//  Project 499
//
//  Created by Antonio Martinez Garin on 10/5/16.
//  Copyright © 2016 Antonio Martinez Garin. All rights reserved.
//

import Foundation


struct Queue<Element> {
    var items = [Element]()
    var maxSize = 20
    mutating func push(item: Element) {
        if items.count<maxSize {
            items.append(item)
        }else{
            shiftRight()
            pop()
        }
    }
    mutating func pop() -> Element? {
        if !items.isEmpty {
            return items.removeFirst()
        }
        return nil
    }
    
    func shiftRight(var amount: Int = 1) -> [Element] {
        assert(-items.count...items.count ~= amount, "Shift amount out of bounds")
        if amount < 0 { amount += items.count }  // this needs to be >= 0
        return Array(items[amount ..< items.count] + items[0 ..< amount])
    }
    
    mutating func shiftRightInPlace(amount: Int = 1) {
        items = shiftRight(amount)
    }
    
    func toArray() -> [Element] {
        return items
    }
}

