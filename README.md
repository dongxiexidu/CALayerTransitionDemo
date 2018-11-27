# CALayerTransitionDemo

## example

![demo](https://github.com/dongxiexidu/CALayerTransitionDemo/blob/master/demo.gif)

add View
```swift
_ = self.view.layer.transitionWithAnimType(animatonType: TransitionAnimType.rippleEffect, subType: TransitionSubtypesFrom.ramdom, curve: TransitionCurve.ramdom, duration: 2)

let custom = Bundle.main.loadNibNamed("CustormView", owner: self, options: nil)?.first as! UIView
customView = custom
custom.frame = view.bounds
view.addSubview(custom)
```
remove View
```swift
_ = self.view.layer.transitionWithAnimType(animatonType: TransitionAnimType.reveal, subType: TransitionSubtypesFrom.left, curve: TransitionCurve.ramdom, duration: 2)
customView?.removeFromSuperview()
```
