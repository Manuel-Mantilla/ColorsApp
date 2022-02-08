//
//  ViewController.swift
//  Light
//
//  Created by Manuel Mantilla on 6/02/22.
//  Copyright © 2022 Manuel Mantilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var colorButton: UIButton!
    @IBOutlet var rgbColorLabel: UILabel!
    var chColor = UIColor.black
    var backColor = UIColor.white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = backColor
        colorButton.backgroundColor = UIColor.clear
        colorButton.tintColor = chColor
        colorButton.layer.borderColor = chColor.cgColor
        colorButton.layer.cornerRadius = 3
        colorButton.layer.borderWidth = 2
        colorButton.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
    }

    @IBAction func colorChanged(_ sender: UIButton) {
        backColor = newColor()
        chColor = antiColor(myColor: backColor)
        colorButton.tintColor = chColor
        colorButton.layer.borderColor = chColor.cgColor
        view.backgroundColor = backColor
        
    }
    
    func newColor() -> UIColor{
        //R.G.B
        var rgbArray = [Double]()
        let color: UIColor
        for _ in 0..<3{
            rgbArray.append(Double.random(in: 0..<255)/255.0)
        }
        color = UIColor.init(red: CGFloat(Double(rgbArray[0])), green: CGFloat(Double(rgbArray[1])), blue: CGFloat(Double(rgbArray[2])), alpha: 0.9)
        return color
    }
    
    func antiColor(myColor: UIColor) -> UIColor{
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        myColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        var newColorVal = [red, green, blue, alpha]
        for i in 0..<(newColorVal.count-1){
            if (newColorVal[i] < 0.392 || newColorVal[i] > 6.19) {
                newColorVal[i] = 1 - newColorVal[i]
            } else {
                newColorVal[i] = 0
            }
        }
        let newColor = UIColor.init(red: newColorVal[0], green: newColorVal[1], blue: newColorVal[2], alpha: newColorVal[3])
        return newColor
    }
}

