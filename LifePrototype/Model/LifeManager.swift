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
    var maxLifeCount = 0
    var isActive = true
    var isOscillator = false
    var activeTicks = 0
    var maxActiveTicks = 0
    
    mutating func updateMatrix() {
        
        for row in 0...K.numberOfRows - 1 {
            for col in 0...K.numberOfColumns - 1 {
                newMatrix[row][col] = checkNeighbors(row, col)
            }
        }
        
        if matrix == newMatrix {
            print("no change")
            isActive = false
            isOscillator = false
        } else if oldMatrix == newMatrix {
            print("2-tick oscillator")
            isActive = true
            isOscillator = true
        } else if twoOldMatrix == newMatrix {
            print("3-tick oscillator")
            isActive = true
            isOscillator = true
        } else {
            print("active")
            isActive = true
            isOscillator = false
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
    
    mutating func lifeCount() -> Int{
        
        var lifeCount: Int = 0
        
        for row in 0...K.numberOfRows - 1 {
            for col in 0...K.numberOfColumns - 1 {
                lifeCount += matrix[row][col]
            }
        }
        if lifeCount > maxLifeCount {maxLifeCount = lifeCount}
        return lifeCount
    }
    
    mutating func clearMatrix() {
        for row in 0...K.numberOfRows - 1 {
            for col in 0...K.numberOfColumns - 1 {
                matrix[row][col] = 0
            }
        }
        maxLifeCount = 0
    }
    
    
}
