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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

