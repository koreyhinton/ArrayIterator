//
//  LoopIterator.swift
//  LoopIteratorTest
//
//  Created by Korey Hinton on 3/23/15.
//  Copyright (c) 2015 koreyhinton.com. All rights reserved.
//



class ArrayIterator<T> {
    var array = Array<T>()
    var loops: Bool = false
    private(set) var index = 0
    
    func current() -> T? {
        var current: T? = nil
        if array.count > 0 {
            current = array[0]
        }
        return current
    }
    
    func next() -> T? {
        
        var next: T? = nil
        
        if loops {
            if index == array.count - 1 {
                index = 0
            } else {
                index += 1
            }
            
            next = array[index]
            
        } else {
            
            if index < array.count - 1 {
                index += 1
                next = array[index]
            }
        }
        return next
    }
    func previous() -> T? {
        var previous: T? = nil
        
        if loops {
            
            if index == 0 {
                index = array.count - 1
                
            } else {
                index -= 1
            }
            previous = array[index]
        } else {
            if index > 0 {
                index -= 1
                previous = array[index]
            }
        }
        return previous
    }
    
    
    func peekNext() -> T? {
        var next: T? = nil
        
        var newIndex = index
        
        if loops {
            
            if index == array.count - 1 {
                newIndex = 0
            } else {
                newIndex += 1
            }
            
            next = array[newIndex]
            
        } else {
            
            if index < array.count - 1 {
                newIndex = index + 1
                next = array[newIndex]
            }
        }
        return next
    }
    
    
    func peekPrevious() -> T? {
        var previous: T? = nil
        
        if loops {
            
            var newIndex = index
            
            if newIndex == 0 {
                newIndex = array.count - 1
            } else {
                newIndex = newIndex - 1
            }
            
            previous = array[newIndex]
        } else {
            if index > 0 {
                var newIndex = index - 1
                previous = array[newIndex]
            }
        }
        return previous
    }
    
    func atIndex(index idx:Int) -> T? {
        var item: T? = nil
        
        if idx >= 0 && idx <= array.count - 1 {
            item = array[idx]
            index = idx
        }
        
        return item
    }
    
    func peekAtIndex(index idx:Int) -> T? {
        
        var item: T? = nil

        if idx >= 0 && idx <= array.count - 1 {
            item = array[idx]
        }

        return item
    }
    
}
