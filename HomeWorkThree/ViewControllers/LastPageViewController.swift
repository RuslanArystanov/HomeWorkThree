//
//  LastPageViewController.swift
//  HomeWorkThree
//
//  Created by Руслан Арыстанов on 12.10.2024.
//

import UIKit

class LastPageViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: "Image")
    }
}
