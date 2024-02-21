//
//  ViewController.swift
//  Lesson 2.04 Colorized
//
//  Created by Valentin on 04.02.2024.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var colorizedView: UIView!
    @IBOutlet var scaleLabels: [UILabel]!
    
    private var colorsRGB: [CGFloat] = [0.0, 0.0, 0.0]
    
    @IBAction func colorSlider(_ sender: UISlider) {
        scaleLabels[sender.tag].text = String(format: "%.2f", sender.value)
        colorsRGB[sender.tag] = CGFloat(sender.value)
        
        colorizedView.backgroundColor = UIColor(
            red: colorsRGB[0],
            green: colorsRGB[1],
            blue: colorsRGB[2],
            alpha: 1
        )
    }
    
}
