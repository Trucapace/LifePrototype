//
//  ViewController.swift
//  LifePrototype
//
//  Created by David Blanck on 12/22/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lifeCountLabel: UILabel!
    @IBOutlet weak var maxLifeCountLabel: UILabel!
    @IBOutlet weak var activeTicksLabel: UILabel!
    @IBOutlet weak var maxActiveTicksLabel: UILabel!
    @IBOutlet weak var gridCollectionView: UICollectionView!
    @IBOutlet weak var lifeStatusLabel: UILabel!
   
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var stepButton: UIButton!
    @IBOutlet weak var goButton: UIButton!

    
    
    let sectionInsets = UIEdgeInsets(   top:  1.0,
                                       left:  1.0,
                                     bottom:  1.0,
                                      right:  1.0)

    var lifeManager = LifeManager()
    var itemsPerRow: CGFloat = 0
    
    
    override func viewDidLoad() {
        
        gridCollectionView.dataSource = self
        gridCollectionView.delegate = self
        gridCollectionView.reloadData()

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        
        itemsPerRow = CGFloat(lifeManager.matrix[0].count)
        stopButton.isEnabled = false
        
    }
    
    @IBAction func stepButtonPressed(_ sender: UIButton) {
        
        lifeManager.updateMatrix()
        updateDisplay()
    }
    
    @IBAction func goButtonPressed(_ sender: UIButton) {
        
        var runCount = 0
        lifeManager.isActive = true

        clearButton.isEnabled = false
        stopButton.isEnabled = true
        goButton.isEnabled = false
        stepButton.isEnabled = false
        gridCollectionView.allowsSelection = false
        
        _ = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
     
            self.lifeManager.updateMatrix()
            self.updateDisplay()
            runCount += 1
            if self.lifeManager.isActive == false || self.stopButton.isEnabled == false{
                timer.invalidate()
                self.clearButton.isEnabled = true
                self.stopButton.isEnabled = false
                self.goButton.isEnabled = true
                self.stepButton.isEnabled = true
                self.gridCollectionView.allowsSelection = true
            }
        }
    
    }
    
    @IBAction func stopButtonPressed(_ sender: UIButton) {
    
        clearButton.isEnabled = true
        stopButton.isEnabled = false
        goButton.isEnabled = true
        stepButton.isEnabled = true
        gridCollectionView.allowsSelection = true
    }
    
    
    @IBAction func clearButtonPressed(_ sender: UIButton) {
        
        lifeManager.clearMatrix()
        updateDisplay()
    }
    
    func updateDisplay() {
                
        lifeCountLabel.text = "Size: \(lifeManager.lifeCount) Cells"
        maxLifeCountLabel.text = "Max Size: \(lifeManager.maxLifeCount) Cells"
        activeTicksLabel.text = "Age: \(lifeManager.activeTicks) Days"
        maxActiveTicksLabel.text = "Max Age: \(lifeManager.maxActiveTicks) Days"
        lifeStatusLabel.text = "Status: \(lifeManager.lifeStatus)"
        
        gridCollectionView.reloadData()
    
    }
    
    func buttonEnabler() {
        clearButton.isEnabled = !clearButton.isEnabled
        stopButton.isEnabled = !stopButton.isEnabled
        stepButton.isEnabled = !stepButton.isEnabled
        goButton.isEnabled = !goButton.isEnabled
        gridCollectionView.allowsSelection = !gridCollectionView.allowsSelection
        
    }
    
}

//MARK: - UICollectionViewDelegate

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        lifeManager.userChangedGrid = true
        
        let row = indexPath.section
        let col = indexPath.row
        
        if lifeManager.matrix[row][col] == 0 {
            gridCollectionView.cellForItem(at: indexPath)?.backgroundColor = .red
            lifeManager.matrix[row][col] = 1
        } else {
            gridCollectionView.cellForItem(at: indexPath)?.backgroundColor = .blue
            lifeManager.matrix[row][col] = 0
        }
        gridCollectionView.reloadData()
        
    }
    
}

//MARK: - UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
 
        return lifeManager.matrix.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return lifeManager.matrix[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LifeCell", for: indexPath)
        
        let row = indexPath.section
        let col = indexPath.row

        if lifeManager.matrix[row][col] == 1 {
            cell.backgroundColor = .red
        } else {
            cell.backgroundColor = .blue
        }

        return cell
    }
    
}

//MARK: - UICollectionViewDelegateFlowLayout
   
extension ViewController: UICollectionViewDelegateFlowLayout {
       
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidthSpace = K.gridSpacing * CGFloat(K.numberOfColumns + 1)
        let paddingHeightSpace = K.gridSpacing * CGFloat(K.numberOfRows + 1)
        
        let availableWidth = gridCollectionView.frame.width - paddingWidthSpace
        let availableHeight = gridCollectionView.frame.height - paddingHeightSpace
        
        let widthPerItem = availableWidth / CGFloat(K.numberOfColumns)
        let heightPerItem = availableHeight / CGFloat(K.numberOfColumns)
        
        if widthPerItem < heightPerItem {
            return CGSize(width: widthPerItem, height: widthPerItem)
        } else {
            return CGSize(width: heightPerItem, height: heightPerItem)
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        return K.gridSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return sectionInsets
    }


    
    
   }
