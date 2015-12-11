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
    
    @IBAction func openButton(sender: AnyObject) {
        whiteButton.hidden = false
        redButton.hidden = false
        yellowButton.hidden = false
        greenButton.hidden = false
        blueButton.hidden = false
        frequencySlider.hidden = false
        label.hidden = false
        colorText.hidden = false
        isOpen = true
    }
    @IBAction func closeButton(sender: AnyObject) {
        whiteButton.hidden = true
        redButton.hidden = true
        yellowButton.hidden = true
        greenButton.hidden = true
        blueButton.hidden = true
        frequencySlider.hidden = true
        label.hidden = true
        colorText.hidden = true
        isOpen = true

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
        }
        if (clickedColor == "(0,255,0)") {
            colorText.textColor  = UIColor.greenColor()
        }
        if (clickedColor == "(0,0,255)") {
            colorText.textColor  = UIColor.blueColor()
        }
        if (clickedColor == "(255,255,0)") {
            colorText.textColor  = UIColor.yellowColor()
        }
        if (clickedColor == "(255,255,255)") {
            colorText.textColor = UIColor.whiteColor()
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

