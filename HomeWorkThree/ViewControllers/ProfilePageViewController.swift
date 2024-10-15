//
//  ProfilePageViewController.swift
//  HomeWorkThree
//
//  Created by Руслан Арыстанов on 11.10.2024.
//

import UIKit

class ProfilePageViewController: UIViewController {
    @IBOutlet var background: UIView!
    
    @IBOutlet var tabBarTitle: UINavigationItem!
    @IBOutlet var aboutMeLabel: UILabel!
    
    var tabBarName: String?
    var name: String?
    var surname: String?
    var placeOfWork: String?
    var hobbie: String?
    var target: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1).cgColor, #colorLiteral(red: 0.4449194074, green: 0.788621366, blue: 0.918802619, alpha: 1).cgColor]
        gradientLayer.shouldRasterize = true
        background.layer.insertSublayer(gradientLayer, at: 0)
        
        tabBarTitle.title = tabBarName
        aboutMeLabel.text = "\(name ?? "") \(surname ?? "") is a professional working at \(placeOfWork ?? ""). In their free time, they enjoy \(hobbie ?? ""), which helps them maintain a balance between work and personal life. \(name ?? "") main goal is \(target ?? ""), and every day they take steps toward achieving it. Through their work and hobbies, \(name ?? "") strives to grow both professionally and personally."
    }
}
