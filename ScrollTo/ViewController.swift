//
//  ViewController.swift
//  ScrollTo
//
//  Created by Yagiz Gurgul on 17/12/16.
//  Copyright © 2016 Lab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate
{

    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var blueView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        scrollView.delegate = self
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        print("offsety: ",scrollView.contentOffset.y)
    }
    
    @IBAction func redTop(_ sender: AnyObject)
    {
        self.scrollView.scrollTo(view: redView, position: .top)
    }
    @IBAction func redMiddle(_ sender: AnyObject)
    {
        self.scrollView.scrollTo(view: redView, position: .middle)
    }
    @IBAction func redBottom(_ sender: AnyObject)
    {
        self.scrollView.scrollTo(view: redView, position: .bottom)
    }
    
    
    @IBAction func greenTop(_ sender: AnyObject)
    {
        self.scrollView.scrollTo(view: greenView, position: .top)
    }
    @IBAction func greenMiddle(_ sender: AnyObject)
    {
        self.scrollView.scrollTo(view: greenView, position: .middle)
    }
    @IBAction func greenBottom(_ sender: AnyObject)
    {
        self.scrollView.scrollTo(view: greenView, position: .bottom)
    }
    
    
    @IBAction func blueTop(_ sender: AnyObject)
    {
        self.scrollView.scrollTo(view: blueView, position: .top)
    }
    @IBAction func blueMiddle(_ sender: AnyObject)
    {
        self.scrollView.scrollTo(view: blueView, position: .middle)
    }
    @IBAction func blueBottom(_ sender: AnyObject)
    {
        self.scrollView.scrollTo(view: blueView, position: .bottom)
    }
}

