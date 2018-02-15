//
//  ViewController.swift
//  UIAnimateChallenge
//
//  Created by Eduardo Vital Alencar Cunha on 25/08/17.
//  Copyright © 2017 VCode. All rights reserved.
//

import UIKit

enum Position: Int {
    case topRight = 0
    case bottomRight
    case bottomLeft
    case topLeft
}

class ViewController: UIViewController {
    @IBOutlet weak var topMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var leftMarginConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageToMove: UILabel!

    var willMoveTo: Position = .topRight

    @IBAction func animateButton(_ sender: UIButton) {
        sender.isHidden = true
        self.topMarginConstraint.constant = 0
        animate(withDuration: 2)
    }

    func move(_ ok: Bool) {
        if ok {
            switch self.willMoveTo {
            case .topRight:
                self.imageToMove.text = "Go to top right"
                self.rightMarginConstraint.constant = 0
                self.leftMarginConstraint.priority = 250
                self.rightMarginConstraint.priority = 500
            case .bottomRight:
                self.imageToMove.text = "Go to bottom right"
                self.topMarginConstraint.priority = 250
                self.bottomMarginConstraint.priority = 500
            case .bottomLeft:
                self.imageToMove.text = "Go to bottom left"
                self.leftMarginConstraint.constant = 0
                self.rightMarginConstraint.priority = 250
                self.leftMarginConstraint.priority = 500
            case .topLeft:
                self.imageToMove.text = "Go to top left"
                self.bottomMarginConstraint.priority = 250
                self.topMarginConstraint.priority = 500
            }
            
            self.willMoveTo = Position(rawValue: (self.willMoveTo.rawValue + 1) % 4)!

            animate(withDuration: 2)
        }
    }

    func animate(withDuration duration: Double) {
        UIView.animate(withDuration: duration, delay: 1, options: [.curveEaseInOut], animations: {
            self.view.layoutIfNeeded()
        }, completion: self.move)
    }
}


