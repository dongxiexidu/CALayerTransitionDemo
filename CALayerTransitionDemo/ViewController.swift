//
//  ViewController.swift
//  CALayerTransitionDemo
//
//  Created by fashion on 2018/11/26.
//  Copyright © 2018年 shangZhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    var customView : UIView?
    
    @IBOutlet weak var removeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        removeBtn.addTarget(self, action: #selector(removeViewAction), for: UIControl.Event.touchUpInside)
        button.addTarget(self, action: #selector(preventFlicker), for: UIControl.Event.allEvents)
    }
    @objc func removeViewAction() {
        _ = self.view.layer.transitionWithAnimType(animatonType: TransitionAnimType.reveal, subType: TransitionSubtypesFrom.left, curve: TransitionCurve.random, duration: 2)
        customView?.removeFromSuperview()
    }

    @objc func preventFlicker(button : UIButton) {
        button.isHighlighted = false
    }


    @IBAction func pushSecondController(_ sender: Any) {

        _ = self.view.layer.transitionWithAnimType(animatonType: TransitionAnimType.rippleEffect, subType: TransitionSubtypesFrom.random, curve: TransitionCurve.random, duration: 2)
        
        let custom = Bundle.main.loadNibNamed("CustormView", owner: self, options: nil)?.first as! UIView
        customView = custom
        custom.frame = view.bounds
        view.addSubview(custom)

    }
    
}

