//
//  LifeManager.swift
//  LifePrototype
//
//  Created by David Blanck on 12/22/20.
//

import Foundation

struct LifeManager {
    
    var matrix = [[Int]](repeating: [Int](repeating: 0, count: K.numberOfColumns), count: K.numberOfRows)
    var newMatrix = [[Int]](repeating: [Int](repeating: 1, count: K.numberOfColumns), count: K.numberOfRows)
    var oldMatrix = [[Int]](repeating: [Int](repeating: 1, count: K.numberOfColumns), count: K.numberOfRows)
    var twoOldMatrix = [[Int]](repeating: [Int](repeating: 1, count: K.numberOfColumns), count: K.numberOfRows)
    var lifeCount = 0
    var maxLifeCount = 0
    var isActive = false
    var isOscillator = false
    var userChangedGrid = false
    var activeTicks = 0
    var maxActiveTicks = 0
    var lifeStatus = "Dead"
    
    mutating func updateMatrix() {
        
        if userChangedGrid == true {
            activeTicks = 0
            userChangedGrid = false
            isActive = false
        }
        
        for row in 0...K.numberOfRows - 1 {
            for col in 0...K.numberOfColumns - 1 {
                newMatrix[row][col] = checkNeighbors(row, col)
            }
        }
        
        lifeCount = countLife(for: newMatrix)
        
        if lifeCount > maxLifeCount {maxLifeCount = lifeCount}
        
        if lifeCount == 0 {
            isActive = false
            isOscillator = false
            lifeStatus = "Dead"
        } else if matrix == newMatrix {
            isActive = false
            isOscillator = false
            lifeStatus = "Stable"
        } else if oldMatrix == newMatrix {
            isActive = true
            isOscillator = true
            lifeStatus = "2-Cycle Oscillator"
        } else if twoOldMatrix == newMatrix {
            isActive = true
            isOscillator = true
            lifeStatus = "3-Cycle Oscillator"
        } else {
            isActive = true
            isOscillator = false
            lifeStatus = "Active"
        }
        
        if isActive == true && isOscillator == false {
            activeTicks += 1
        } else {
            if activeTicks > maxActiveTicks {
                maxActiveTicks = activeTicks
            }
        }
        
        twoOldMatrix = oldMatrix
        oldMatrix = matrix
        matrix = newMatrix
        
    }
    
    func checkNeighbors(_ row: Int, _ col: Int) -> Int {
        
        var neighborCount: Int = 0
        
        if row > 0 && col > 0                                       {neighborCount += matrix[row - 1][col - 1]}  // up left
        if row > 0                                                  {neighborCount += matrix[row-1][col]}        // up
        if row > 0 && col < K.numberOfColumns - 1                   {neighborCount += matrix[row - 1][col + 1]}  // up right
        if col > 0                                                  {neighborCount += matrix[row][col - 1]}      // left
        if col < K.numberOfColumns - 1                              {neighborCount += matrix[row][col + 1]}      // right
        if row < K.numberOfRows - 1 && col > 0                      {neighborCount += matrix[row + 1][col - 1]}  // down left
        if row < K.numberOfRows - 1                                 {neighborCount += matrix[row + 1][col]}      // down
        if row < K.numberOfRows - 1 && col < K.numberOfColumns - 1  {neighborCount += matrix[row + 1][col + 1]}  // down right
        
        if matrix[row][col] == 1 {
            if neighborCount == 2 || neighborCount == 3 {
                return 1
            } else {
                return 0
            }
        } else {
            if neighborCount == 3 {
                return 1
            } else {
                return 0
            }
        }
        
    }
    
    mutating func countLife(for array: [[Int]]) -> Int {
        
        var count = 0
        
        for row in 0...K.numberOfRows - 1 {
            for col in 0...K.numberOfColumns - 1 {
                count += array[row][col]
            }
        }
        return count
    }
    
    mutating func clearMatrix() {
        for row in 0...K.numberOfRows - 1 {
            for col in 0...K.numberOfColumns - 1 {
                matrix[row][col] = 0
            }
        }

        activeTicks = 0
        lifeCount = 0
        lifeStatus = "Dead"
        
    }
    
    
}
