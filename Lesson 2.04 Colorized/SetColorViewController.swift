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
    
    private let redTag = 0, greenTag = 1, blueTag = 2
    private var colorsRGB: [CGFloat] = [0, 0, 0]
    
    override func viewDidLoad() {
        colorizedView.backgroundColor = color

        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        
        color?.getRed(&red, green: &green, blue: &blue, alpha: nil)

        prepareView(red: red, green: green, blue: blue)
    }
    
    @IBAction func colorSlider(_ sender: UISlider) {
        scaleLabels[sender.tag].text = String(format: "%.2f", sender.value)
        colorsRGB[sender.tag] = CGFloat(sender.value)
        
        color = UIColor(
            red: colorsRGB[redTag],
            green: colorsRGB[greenTag],
            blue: colorsRGB[blueTag],
            alpha: 1
        )
        
        colorizedView.backgroundColor = color
    }
    
    @IBAction func doneAction() {
        delegate?.setBackgroundColor(color ?? UIColor())
        dismiss(animated: true)
    }
}

extension SetColorViewController {
    private func prepareView(red: CGFloat, green: CGFloat, blue: CGFloat) {
        colorsRGB[redTag] = red
        colorsRGB[greenTag] = green
        colorsRGB[blueTag] = blue
        
        scaleLabels[redTag].text = String(format: "%.2f", red)
        scaleLabels[greenTag].text = String(format: "%.2f", green)
        scaleLabels[blueTag].text = String(format: "%.2f", blue)
        
        colorSliders[redTag].value = Float(red)
        colorSliders[greenTag].value = Float(green)
        colorSliders[blueTag].value = Float(blue)
    }
}
