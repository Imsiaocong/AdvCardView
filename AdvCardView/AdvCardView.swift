//
//  AdvCardView.swift
//  AdvCardView
//
//  Created by Di Wang on 2017/5/12.
//  Copyright © 2017年 Di Wang. All rights reserved.
//

import UIKit

class AdvCardView: UIView, UIGestureRecognizerDelegate {
    
    private var photo: UIImageView!
    private var gesture: UIPanGestureRecognizer!
    private var toView: UIView!
    private var getFrame: CGRect!
    fileprivate var cellId = "Cell"
    
//    public override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//        getFrame = frame
//    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 80, height: 80), collectionViewLayout: layout)
        cv.backgroundColor = UIColor.black
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    public init(mainFrame: CGRect){
        super.init(frame: mainFrame)
        self.frame = mainFrame
        self.getFrame = mainFrame
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.addSubview(collectionView)
        
        photo = UIImageView(frame: CGRect(x: 0, y: 120, width: 80, height: 80))
        photo.image = UIImage(named: "TS")
        self.addSubview(photo)
        print(self.frame.height)
        
        gesture = UIPanGestureRecognizer(target: self, action:  #selector(self.handleGesture(gestureRecognizer:)))
        gesture.delegate = self
        self.addGestureRecognizer(gesture)
        
        toView = UIView(frame: getFrame)
        toView.backgroundColor = UIColor.red
        let s = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 20))
        s.text = "asuhdaoshdoashodah"
        toView.addSubview(s)
        self.addSubview(toView)
    }
    
    @objc private func handleGesture(gestureRecognizer: UIGestureRecognizer) {
        //let transition = gesture.translation(in: self).x
        //print(transition)
        //self.frame.origin.x += (transition / 100)
        
        UIView.transition(from: self, to: toView, duration: 1, options: .transitionFlipFromRight) { (Bool) in
            return
        }
    }
    
}

extension AdvCardView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 3
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        cell.backgroundColor = UIColor.red
        return cell
    }
    
}
