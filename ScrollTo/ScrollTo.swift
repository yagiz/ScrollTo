//
//  ScrollTo.swift
//  ScrollTo
//
//  Created by Yagiz Gurgul on 17/12/16.
//  Copyright © 2016 Lab. All rights reserved.
//

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
