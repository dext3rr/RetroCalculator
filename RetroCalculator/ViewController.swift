//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Martin Haładyn on 21.04.2017.
//  Copyright © 2017 Martin Haładyn. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var outputLabel: UILabel!
    var buttonSound: AVAudioPlayer!
    var runningNumber = ""
    var leftValueString = ""
    var rightValueString = ""
    var result = ""
    
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Add = "+"
        case Substract = "-"
        case Empty = "Empty"
    }
    
        var currentOperation = Operation.Empty
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: path!)
        
        
        
        do {
            try buttonSound = AVAudioPlayer(contentsOf: soundURL)
            buttonSound.prepareToPlay()
            
        }
        
        catch let err as NSError {
            print(err.debugDescription)
        }
        
        
    }
    
    @IBAction func numberPressed(sender: UIButton){
        
        playSound()
        
        runningNumber += "\(sender.tag)"
        outputLabel.text = runningNumber
    
    
    }
    
    @IBAction func onAddPressed(sender: AnyObject){
    
    processOperation(operation: .Add)
    
    }
    
    @IBAction func onSubstractPressed(sender: AnyObject){
        
        processOperation(operation: .Substract)
        
    }
    
    @IBAction func onMultiplyPressed(sender: AnyObject){
        
        processOperation(operation: .Multiply)
        
    }
    
    @IBAction func onDividePressed(sender: AnyObject){
        
        processOperation(operation: .Divide)
        
    }
    
    @IBAction func onEqualPressed(sender: AnyObject){
        
        processOperation(operation: currentOperation)
        
    }
    
    @IBAction func onClearPressed(_ sender: Any) {
        
        outputLabel.text = "0"
        runningNumber = ""
        leftValueString = ""
        rightValueString = ""
        result = ""
        
        currentOperation = Operation.Empty
    }
    
    
    
    
    
    func playSound() {
        if buttonSound.isPlaying {
            buttonSound.stop()
        }
        
        buttonSound.play()
    
    
    }
    
    
    
    func processOperation(operation: Operation){
        
        playSound()
        if currentOperation != Operation.Empty {
            
            if runningNumber != "" {
                
                rightValueString = runningNumber
                runningNumber = ""
                
            
            
            
            if currentOperation == Operation.Add{
                result = "\(Double(leftValueString)! + Double(rightValueString)!)"
            }
            
            else if currentOperation == Operation.Substract{
                result = "\(Double(leftValueString)! - Double(rightValueString)!)"
            }
            
            else if currentOperation == Operation.Multiply{
                result = "\(Double(leftValueString)! * Double(rightValueString)!)"
            }
            
            else if currentOperation == Operation.Divide {
                result = "\(Double(leftValueString)! / Double(rightValueString)!)"
            }
            
            leftValueString = result
            outputLabel.text = result
            
        }
        
        currentOperation = operation
        
        }
    
    
    
    
    else {
    
    leftValueString = runningNumber
    runningNumber = ""
    currentOperation = operation
    
    }
        
        
        
    
    
    
    
    
    
    
    
    
    
    
    
    
    

   
        
}

}

