# BubbleButton
BubbleButton is Swift 3 button wihch does producuse bubbles.

![N|Solid](http://146.185.160.107/wp-content/uploads/2016/12/bubbleButtonVideo.mov.gif)

### Installation

#### CocoaPods
```sh
pod 'BubbleButton', '~> 0.1.1'
```
#### Manually
Just download or clone the repo and move BubbleButton.swift file to your project.

### Usage

#### Interface Builder
In Interface Builder you can set BubbleButton to Custom Class property of your button. Just do not forget the module field. Then you can customize its properties.

![N|Solid](http://146.185.160.107/wp-content/uploads/2016/12/custom_class_ss.png)

#### By Code
```swift
button = BubbleButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
button.backgroundColor = UIColor.gray
button.bubbleColor = UIColor.red
button.bubbleCount = 5
..
self.view.addSubview(button)
```
#### Starting and Ending Animation

You can start animating button after it's tapped. After your progress is completed you can call "endAnimationWith" to reset button state.
```swift
@IBAction func buttonAction(_ sender: AnyObject) {
    bubbleButton.startBubbleAnimationWith(direction: .TopRight)
    print("startingAnimation")
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        print("endingAnimation")
        
        self.bubbleButton.endAnimationWith {
            print("animationIsEnded")
        }
    }
}
```

### Customize
You can customize these properties in Interface Builder or by code:

### Properties
```swift
titleForProgress:String
titleForCompletion:String
    
endAnimationDuration:Float
fadeOutAnimationDelay:Float
fadeOutAnimationDuration:Float
    
bubbleColor:UIColor
bubbleCount:Int
    
bubbleSpeedMin:CGFloat
bubbleSpeedMax:CGFloat
    
bubbleRadiusMin:CGFloat
bubbleRadiusMax:CGFloat
```

### Direction
direction argument of ```startBubbleAnimationWith```determines where bubbles move to.
```swift
public enum BubbleDirection
{
    case Top
    case Left
    case Bottom
    case Right
    
    case TopLeft
    case TopRight
    case BottomLeft
    case BottomRight
}
```

License
----
MIT

**Free Software, Hell Yeah!**