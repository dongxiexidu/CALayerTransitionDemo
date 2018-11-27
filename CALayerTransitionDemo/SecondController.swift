//
//  SecondController.swift
//  CALayerTransitionDemo
//
//  Created by fashion on 2018/11/26.
//  Copyright © 2018年 shangZhu. All rights reserved.
//

import UIKit

class SecondController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button.addTarget(self, action: #selector(preventFlicker), for: UIControl.Event.allEvents)
    }
    
    @objc func preventFlicker(button : UIButton) {
        button.isHighlighted = false
    }

    @IBAction func clickButton(_ sender: Any) {
         _ = self.view.layer.transitionWithAnimType(animatonType: TransitionAnimType.suckEffect, subType: TransitionSubtypesFrom.random, curve: TransitionCurve.random, duration: 2)
        self.view.removeFromSuperview()
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+2) {
            self.removeFromParent()
        }
        
    }
    

}
