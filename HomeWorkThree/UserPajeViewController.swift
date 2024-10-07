//
//  UserPajeViewController.swift
//  HomeWorkThree
//
//  Created by Руслан Арыстанов on 03.10.2024.
//

import UIKit

class UserPajeViewController: UIViewController {
    @IBOutlet var viewBackgroundColor: UIView!
    @IBOutlet var welcomeMessage: UILabel!
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1).cgColor, #colorLiteral(red: 0.4449194074, green: 0.788621366, blue: 0.918802619, alpha: 1).cgColor]
        gradientLayer.shouldRasterize = true
        viewBackgroundColor.layer.insertSublayer(gradientLayer, at: 0)
        
        welcomeMessage.text = "Welcome, \(String(userName))"
    }
    
}
