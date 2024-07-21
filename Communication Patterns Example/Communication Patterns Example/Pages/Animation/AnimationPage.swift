//
//  AnimationPage.swift
//  Communication Patterns Example
//
//  Created by Wahyu Herdianto on 18/07/24.
//

import UIKit

class AnimationPage: UIViewController {

    @IBOutlet weak var animationImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadAnimation()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closePage(_:))))
    }
    
    func loadAnimation() {
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        
        let explosionGif = UIImage.gifImageWithName("clock")
        animationImage.image = explosionGif
    }
    
    @objc func closePage(_ gesture: UITapGestureRecognizer) {
        self.dismiss(animated: false)
    }

}
