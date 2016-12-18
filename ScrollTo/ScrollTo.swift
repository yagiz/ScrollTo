/*
 MIT License
 
 Copyright (c) 2016 yagiz
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all
 copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 SOFTWARE.
*/

import UIKit

public enum ScrollToPosition
{
    case top
    case middle
    case bottom
}

public extension UIScrollView
{
    public func scrollTo(view:UIView, position:ScrollToPosition)
    {
        switch position {
            
        case .top:
            self.scrollTopTo(view: view, margin: 0, animated: true)
        case .middle:
            self.scrollMiddleTo(view: view, margin: 0, animated: true)
        case .bottom:
            self.scrollBottomTo(view: view, margin: 0, animated: true)
        }
    }
    
    public func scrollTo(view:UIView, position:ScrollToPosition, margin:CGFloat)
    {
        switch position {
            
        case .top:
            self.scrollTopTo(view: view, margin: margin, animated: true)
        case .middle:
            self.scrollMiddleTo(view: view, margin: margin, animated: true)
        case .bottom:
            self.scrollBottomTo(view: view, margin: margin, animated: true)
        }
    }
    
    public func scrollTo(view:UIView, position:ScrollToPosition, margin:CGFloat,animated:Bool)
    {
        switch position {
            
        case .top:
            self.scrollTopTo(view: view, margin: margin, animated: animated)
        case .middle:
            self.scrollMiddleTo(view: view, margin: margin, animated: animated)
        case .bottom:
            self.scrollBottomTo(view: view, margin: margin, animated: animated)
        }
    }
    
    func scrollTopTo(view:UIView,margin:CGFloat,animated:Bool)
    {
        let setterBlock:() -> (Void) = { ()->(Void) in
            
            let minContentOffsetY = self.minContentOffsetY()
            let maxContentOffsetY = self.maxContentOffsetY()
            
            let rectOfView = view.superview?.convert(view.frame, to: self)
            
            let scrollPosition = (rectOfView?.origin.y)! + margin
            
            if scrollPosition > minContentOffsetY &&
                scrollPosition < maxContentOffsetY
            {
                self.contentOffset = CGPoint(x: 0, y: scrollPosition)
            }else
            {
                self.contentOffset = CGPoint(x: 0, y: maxContentOffsetY)
            }
            
        }
        
        if animated == true
        {
            self.animateBlock {
                setterBlock()
            }
        }else
        {
            setterBlock()
        }
    }
    
    func scrollMiddleTo(view:UIView,margin:CGFloat,animated:Bool)
    {
        let setterBlock:() -> (Void) = { ()->(Void) in
            
            let minContentOffsetY = self.minContentOffsetY()
            let maxContentOffsetY = self.maxContentOffsetY()
            
            let rectOfView = view.superview?.convert(view.frame, to: self)
            
            let scrollPosition = (rectOfView?.origin.y)! + ((rectOfView?.size.height)!)*0.5 - self.bounds.size.height*0.5 + margin
            
            if scrollPosition > minContentOffsetY &&
                scrollPosition < maxContentOffsetY
            {
                self.contentOffset = CGPoint(x: 0, y: scrollPosition)
            }else
            {
                let visibleHeight = self.visibleHeight()
                let viewYWithInset = rectOfView?.origin.y;
                
                
                if viewYWithInset! + (rectOfView?.size.height)! > visibleHeight * 0.5
                {
                    self.scrollTopTo(view: view,margin: margin,animated: animated)
                }else
                {
                    self.scrollBottomTo(view: view,margin: margin,animated: animated)
                }
            }
            
        }
        
        if animated == true
        {
            self.animateBlock {
                setterBlock()
            }
        }else
        {
            setterBlock()
        }
    }

    func scrollBottomTo(view:UIView,margin:CGFloat,animated:Bool)
    {
        let setterBlock:() -> (Void) = { ()->(Void) in
            
            let minContentOffsetY = self.minContentOffsetY()
            let maxContentOffsetY = self.maxContentOffsetY()
            
            let rectOfView = view.superview?.convert(view.frame, to: self)
            
            let scrollPosition = (rectOfView?.origin.y)! + (rectOfView?.size.height)! - self.bounds.size.height + margin
            
            if scrollPosition > minContentOffsetY &&
                scrollPosition < maxContentOffsetY
            {
                self.contentOffset = CGPoint(x: 0, y: scrollPosition)
            }else
            {
                self.contentOffset = CGPoint(x: 0, y: minContentOffsetY)
            }
            
        }
        
        if animated == true
        {
            self.animateBlock {
                setterBlock()
            }
        }else
        {
            setterBlock()
        }
    }

    
    func animateBlock(block:@escaping ()->Void)
    {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: { 
            
            block()
            
        }) { (Bool) in
        
        }
    }
    
    func minContentOffsetY() -> CGFloat
    {
        return -self.contentInset.top
    }
    
    func maxContentOffsetY() -> CGFloat
    {
        return self.contentSize.height - self.bounds.height + self.contentInset.bottom
    }
    
    func visibleHeight() -> CGFloat
    {
        return self.contentSize.height + self.contentInset.top + self.contentInset.bottom
    }
}


public extension UIView
{
    public func scrollTo(position:ScrollToPosition)
    {
        
        guard let scrollView = self.findFirstScrollView(view: self) else {
            return
        }
        
        switch position {
            
        case .top:
            scrollView.scrollTopTo(view: self, margin: 0, animated: true)
        case .middle:
            scrollView.scrollMiddleTo(view: self, margin: 0, animated: true)
        case .bottom:
            scrollView.scrollBottomTo(view: self, margin: 0, animated: true)
        }
    }
    
    public func scrollTo(position:ScrollToPosition, margin:CGFloat)
    {
        
        guard let scrollView = self.findFirstScrollView(view: self) else {
            return
        }
        
        switch position {
            
        case .top:
            scrollView.scrollTopTo(view: self, margin: margin, animated: true)
        case .middle:
            scrollView.scrollMiddleTo(view: self, margin: margin, animated: true)
        case .bottom:
            scrollView.scrollBottomTo(view: self, margin: margin, animated: true)
        }
    }
    
    public func scrollTo(position:ScrollToPosition, margin:CGFloat,animated:Bool)
    {
        
        guard let scrollView = self.findFirstScrollView(view: self) else {
            return
        }

        switch position {
            
        case .top:
            scrollView.scrollTopTo(view: self, margin: margin, animated: animated)
        case .middle:
            scrollView.scrollMiddleTo(view: self, margin: margin, animated: animated)
        case .bottom:
            scrollView.scrollBottomTo(view: self, margin: margin, animated: animated)
        }
    }
    
    public func findFirstScrollView(view:UIView) -> UIScrollView?
    {
        guard view.superview != nil else {
            return nil
        }
        
        if view.superview is UIScrollView
        {
            return view.superview as? UIScrollView
        }
        
        return self.findFirstScrollView(view: self.superview!)
    }
}
