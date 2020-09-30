//
//  ViewController.swift
//  ScribbleBug
//
//  Created by Steven Lipton on 9/23/20.
//
// An exercise file for iOS Development Tips Weekly
// A weekly course on LinkedIn Learning for iOS developers
//  Season 12 (Q4 2020) video 09
//  by Steven Lipton (C)2020, All rights reserved
// Learn more at https://linkedin-learning.pxf.io/YxZgj
//This Week:  Fix a bug You might find when using scribble around other gestures
//  For more code, go to http://bit.ly/AppPieGithub

import UIKit

class ViewController: UIViewController, UIScribbleInteractionDelegate{
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textFieldToo: UITextField!
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let result = Int(sender.value)
        label.text = "Value: \(result)"
        textField.text = "\(result)"
    }
    
    @IBAction func textFieldEditingDidEnd(_ sender: UITextField) {
        if let result = Int(sender.text ?? ""){
            label.text = "Value: \(result)"
            slider.value = Float(result)
        } else {
            sender.text = "\(Int(slider.value))"
        }
    }
    
    func scribbleInteraction(_ interaction: UIScribbleInteraction, shouldBeginAt location: CGPoint) -> Bool {
        return false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let scribbleInteraction = UIScribbleInteraction(delegate:self)
        textField.addInteraction(scribbleInteraction)
        // Do any additional setup after loading the view.
    }
 

}

