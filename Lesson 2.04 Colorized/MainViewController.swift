//
//  ViewController.swift
//  Lesson 2.04 Colorized
//
//  Created by Valentin on 22.02.2024.
//

import UIKit

protocol SetColorViewControllerDelegate: AnyObject {
    func setBackgroundColor(_ color: UIColor)
}

final class MainViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let setColorVC = segue.destination as? SetColorViewController
        setColorVC?.delegate = self
        setColorVC?.color = view.backgroundColor
    }
}

extension MainViewController: SetColorViewControllerDelegate {
    func setBackgroundColor(_ color: UIColor) {
        print("lol")
        
        view.backgroundColor = color
    }
}
