//
//  ViewController.swift
//  NewsFeed
//
//  Created by Abz Maxey on 14/05/2017.
//  Copyright © 2017 Joenabie Gamao. All rights reserved.
//

import UIKit

let cellId = "cellId"

class FeedViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.backgroundColor = UIColor(white: 0.95, alpha: 1)
        navigationItem.title = "Facebook Feed"
        
        
        //FOR CV Cells
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
    }

    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
  


}


class FeedCell: UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCells()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    let nameLabel : UILabel = {
        let label = UILabel()
        //label.text = "Joenabie Gamao"
        label.numberOfLines = 2
        
        let attrText = NSMutableAttributedString(string: "Joenabie", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 14)])
        
        let ps = NSMutableParagraphStyle()
        ps.lineSpacing = 4
        attrText.addAttribute(NSParagraphStyleAttributeName, value: ps, range: NSMakeRange(0, attrText.string.characters.count))
       
        attrText.append(NSAttributedString(string: "\nMarch 10, 2017 " + "Cebu City, Ph" + " - ", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12), NSForegroundColorAttributeName:
            UIColor.rgb(155, green: 161, blue: 161)]))
        
        let att = NSTextAttachment()
        att.image = #imageLiteral(resourceName: "globe_icon")
        att.bounds = CGRect(x: 0, y: -2, width: 12, height: 12)
        attrText.append(NSAttributedString(attachment: att))
        label.attributedText = attrText
        

        return label
        
    }()
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "abz")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        
        return imageView
    }()
    
    let statusTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Hello"
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isScrollEnabled = false
        return textView
    }()
    
    let statusImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "zuckdog")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        //imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    func setUpCells()  {
        backgroundColor = UIColor.white
        
        addSubview(nameLabel)
        addSubview(profileImageView)
        addSubview(statusTextView)
        addSubview(statusImageView)
        
        addConstraintsWithFormat(format: "H:|-8-[v0(44)]-8-[v1]|", views: profileImageView, nameLabel)

        addConstraintsWithFormat(format: "V:|-12-[v0(44)]", views: profileImageView) //top
        addConstraintsWithFormat(format: "V:|-12-[v0]", views: nameLabel)
        

        addConstraintsWithFormat(format: "H:|-4-[v0]-4-|", views: statusTextView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: statusImageView)
        
        addConstraintsWithFormat(format: "V:|-8-[v0(44)]-4-[v1]-4-[v2]|", views: profileImageView, statusTextView, statusImageView)
        
        
    }
}

extension UIView {
    func addConstraintsWithFormat(format:String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index,view) in views.enumerated(){
            let key = "v\(index)"
            viewsDictionary[key] = view // v["0"] = value
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format,
                                                      options: NSLayoutFormatOptions(),
                                                      metrics: nil,
                                                      views: viewsDictionary))
    
    }
}


extension UIColor {
    
    static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
}


