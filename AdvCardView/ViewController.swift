//
//  ViewController.swift
//  AdvCardView
//
//  Created by Di Wang on 2017/5/12.
//  Copyright © 2017年 Di Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cardView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        cardView = AdvCardView(mainFrame: CGRect(x: 0, y: self.view.frame.size.height / 2, width: self.view.frame.width, height: 200))
        //cardView.frame = CGRect(x: 0, y: self.view.frame.size.height / 2, width: self.view.frame.width, height: 200)
        cardView.backgroundColor = UIColor.gray
        self.view.addSubview(cardView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

