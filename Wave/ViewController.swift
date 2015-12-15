//
//  ViewController.swift
//  Wave
//
//  Created by Vendela Larsson on 12/10/15.
//  Copyright © 2015 wave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var clickedColor = "(0,0,0)"
    var isOpen = true
    @IBOutlet weak var whiteButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var frequencySlider: UISlider!
    @IBOutlet weak var colorText: UILabel!
    @IBOutlet weak var controls: UIImageView!
    @IBOutlet weak var whiteSelected: UIImageView!
    @IBOutlet weak var redSelected: UIImageView!
    @IBOutlet weak var yellowSelected: UIImageView!
    @IBOutlet weak var greenSelected: UIImageView!
    @IBOutlet weak var blueSelected: UIImageView!
    @IBOutlet weak var instructions: UIImageView!
    @IBOutlet weak var muteButton: UIButton!
    @IBOutlet weak var soundButton: UIButton!
    
    @IBAction func muteButton(sender: AnyObject) {
        muteButton.hidden = true
        soundButton.hidden = false
    }
    
    @IBAction func soundButton(sender: AnyObject) {
        soundButton.hidden = true
        muteButton.hidden = false
    }
    
    @IBAction func helpButton(sender: AnyObject) {
        controls.hidden = true
        frequencySlider.hidden = true
        whiteButton.hidden = true
        whiteSelected.hidden = true
        redButton.hidden = true
        redSelected.hidden = true
        yellowButton.hidden = true
        yellowSelected.hidden = true
        greenButton.hidden = true
        greenSelected.hidden = true
        blueButton.hidden = true
        blueSelected.hidden = true
        
        if (instructions.hidden == true) {
            instructions.hidden = false
        }
        else {
            instructions.hidden = true
        }
    }
    
    @IBAction func lightButton(sender: AnyObject) {
        instructions.hidden = true
        if (whiteButton.hidden == true) {
            whiteButton.hidden = false
        }
        else {
            whiteButton.hidden = true
        }
        
        if (redButton.hidden == true) {
            redButton.hidden = false
        }
        else {
            redButton.hidden = true
        }
        
        if (yellowButton.hidden == true) {
            yellowButton.hidden = false
        }
        else {
            yellowButton.hidden = true
        }
        
        if (greenButton.hidden == true) {
            greenButton.hidden = false
        }
        else {
            greenButton.hidden = true
        }
        
        if (blueButton.hidden == true) {
            blueButton.hidden = false
        }
        else {
            blueButton.hidden = true
        }
        
        if (frequencySlider.hidden == true) {
            frequencySlider.hidden = false
        }
        else {
            frequencySlider.hidden = true
        }
        
        if (label.hidden == true) {
            label.hidden = false
        }
        else {
            label.hidden = true
        }
        
        if (controls.hidden == true) {
            controls.hidden = false
        }
        else {
            controls.hidden = true
        }
        
        if (whiteSelected.hidden == false) {
            whiteSelected.hidden = true
        }
        
        if (redSelected.hidden == false) {
            redSelected.hidden = true
        }
        
        if (yellowSelected.hidden == false) {
            yellowSelected.hidden = true
        }
        
        if (greenSelected.hidden == false) {
            greenSelected.hidden = true
        }
        
        if (blueSelected.hidden == false) {
            blueSelected.hidden = true
        }
    }
    
    @IBAction func redButton(sender: AnyObject) {
        clickedColor = "(255,0,0)"
        checkColor()
    }
    @IBAction func yellowButton(sender: AnyObject) {
        clickedColor = "(255,255,0)"
        checkColor()
    }
    @IBAction func greenButton(sender: AnyObject) {
        clickedColor = "(0,255,0)"
        checkColor()
    }
    
    @IBAction func blueButton(sender: AnyObject) {
        clickedColor = "(0,0,255)"
        checkColor()
    }
    
    @IBAction func whiteButton(sender: AnyObject) {
        clickedColor = "(255,255,255)"
        checkColor()
    }
    
    func checkColor() {
        if (clickedColor == "(255,0,0)") {
            colorText.textColor  = UIColor.redColor()
            redSelected.hidden = false
            whiteSelected.hidden = true
            yellowSelected.hidden = true
            greenSelected.hidden = true
            blueSelected.hidden = true
        }
        if (clickedColor == "(0,255,0)") {
            colorText.textColor  = UIColor.greenColor()
            greenSelected.hidden = false
            redSelected.hidden = true
            whiteSelected.hidden = true
            yellowSelected.hidden = true
            blueSelected.hidden = true
        }
        if (clickedColor == "(0,0,255)") {
            colorText.textColor  = UIColor.blueColor()
            blueSelected.hidden = false
            greenSelected.hidden = true
            redSelected.hidden = true
            whiteSelected.hidden = true
            yellowSelected.hidden = true
        }
        if (clickedColor == "(255,255,0)") {
            colorText.textColor  = UIColor.yellowColor()
            yellowSelected.hidden = false
            greenSelected.hidden = true
            redSelected.hidden = true
            whiteSelected.hidden = true
            blueSelected.hidden = true
        }
        if (clickedColor == "(255,255,255)") {
            colorText.textColor = UIColor.whiteColor()
            whiteSelected.hidden = false
            redSelected.hidden = true
            yellowSelected.hidden = true
            greenSelected.hidden = true
            blueSelected.hidden = true
        }
    }
    
    @IBOutlet weak var label: UILabel!
    @IBAction func sliderValueChanged(sender: UISlider) {
        let currentValue = Int(sender.value)
        if (currentValue <= 33) {
            label.text = "slow"
        }
        else if (currentValue <= 66) {
            label.text = "medium"
        }
        else {
            label.text = "fast"
        }
    }
    
    let instrument = AKInstrument()

    let fm = touchInstrument()
    dynamic var horizontalPercentage: CGFloat = 0.0
    dynamic var verticalPercentage: CGFloat = 0.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        let instrument = AKInstrument()

        instrument.setAudioOutput(AKOscillator())
        AKOrchestra.addInstrument(instrument)
        AKOrchestra.addInstrument(fm)
        
        whiteButton.hidden = true
        whiteSelected.hidden = true
        redButton.hidden = true
        redSelected.hidden = true
        yellowButton.hidden = true
        yellowSelected.hidden = true
        greenButton.hidden = true
        greenSelected.hidden = true
        blueButton.hidden = true
        blueSelected.hidden = true
        controls.hidden = true
        frequencySlider.hidden = true
        instructions.hidden = true
        soundButton.hidden = true

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches{
            
            self.setPercentagesWithTouchPoint(touch.locationInView(self.view))
            let freqPercentage = (Float(horizontalPercentage) + abs(Float(verticalPercentage)) - 1) / 2.0
            
            fm.frequency.value = fm.frequency.maximum * freqPercentage
    
            fm.play()
            
        }
        
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch in touches{
            
            self.setPercentagesWithTouchPoint(touch.locationInView(self.view))
            let freqPercentage = (Float(horizontalPercentage) + abs(Float(verticalPercentage) - 1)) / 2.0
            
            fm.frequency.value = fm.frequency.maximum * freqPercentage
            
            
            
        }
        
    }
    override func touchesEnded(touches: Set<UITouch>?, withEvent event: UIEvent?) {

         fm.stop()
        
    }
    
    
    func setPercentagesWithTouchPoint(touchPoint: CGPoint) {
        if touchPoint.x > 0 && touchPoint.x < self.view.bounds.size.width &&
            touchPoint.y > 0 && touchPoint.y < self.view.bounds.size.height {
                
                self.horizontalPercentage = touchPoint.x / self.view.bounds.size.width
                self.verticalPercentage = touchPoint.y / self.view.bounds.size.height
        }
    }



}

