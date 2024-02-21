//
//  ViewController.swift
//  Lesson 2.04 Colorized
//
//  Created by Valentin on 04.02.2024.
//

import UIKit

final class SetColorViewController: UIViewController {

    @IBOutlet weak var colorizedView: UIView!
    @IBOutlet var scaleLabels: [UILabel]!
    @IBOutlet var colorSliders: [UISlider]!
    
    
    weak var delegate: SetColorViewControllerDelegate?
    var color: UIColor?
    
    private var colorsRGB: [CGFloat] = [0.0, 0.0, 0.0]
    
    override func viewDidLoad() {
        colorizedView.backgroundColor = color
    }
    
    @IBAction func colorSlider(_ sender: UISlider) {
        scaleLabels[sender.tag].text = String(format: "%.2f", sender.value)
        colorsRGB[sender.tag] = CGFloat(sender.value)
        
        color = UIColor(
            red: colorsRGB[0],
            green: colorsRGB[1],
            blue: colorsRGB[2],
            alpha: 1
        )
        
        colorizedView.backgroundColor = color
    }
    
    @IBAction func doneAction() {
        delegate?.setBackgroundColor(color!)
        dismiss(animated: true)
    }
}
