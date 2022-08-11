//
//  InfoViewController.swift
//  Justo
//
//  Created by Ricardo Trevino on 8/11/22.
//

import Foundation
import UIKit
import Kingfisher
import SnapKit

class InfoViewController : UIViewController {
    var userInfo: User
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        
        let stackView: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.alignment = .fill
            stack.distribution = .fillEqually
            return stack
        }()
        
        let _: UIImageView = {
           let imageView = UIImageView(image: nil)
            let url = URL(string: userInfo.profilePicLarge)
           imageView.kf.setImage(with: url)
           imageView.contentMode = .scaleAspectFit
           imageView.clipsToBounds = true
           stackView.addArrangedSubview(imageView)
           return imageView
       }()
    
        let _: UILabel = {
            let label = UILabel()
            label.text = "Name: \(userInfo.name)"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textAlignment = .left
            stackView.addArrangedSubview(label)
            return label
        }()
        
        let _: UILabel = {
            let label = UILabel()
            label.text = "Gender: \(userInfo.gender)"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textAlignment = .left
            stackView.addArrangedSubview(label)
            return label
        }()
        
        let _: UILabel = {
            let label = UILabel()
            label.text = "Email: \(userInfo.email)"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textAlignment = .left
            stackView.addArrangedSubview(label)
            return label
        }()
        
        let _: UILabel = {
            let label = UILabel()
            //////
            label.text = "DOB: \(userInfo.dob)"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textAlignment = .left
            stackView.addArrangedSubview(label)
            return label
        }()
        
        let _: UILabel = {
            let label = UILabel()
            label.text = "Age: \(userInfo.age)"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textAlignment = .left
            stackView.addArrangedSubview(label)
            return label
        }()
        
        let _: UILabel = {
            let label = UILabel()
            label.text = "Phone: \(userInfo.phoneNo)"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textAlignment = .left
            stackView.addArrangedSubview(label)
            return label
        }()
        
        let _: UILabel = {
            let label = UILabel()
            label.text = "Cell: \(userInfo.cellNo)"
            label.textColor = .black
            label.font = UIFont.boldSystemFont(ofSize: 16)
            label.textAlignment = .left
            stackView.addArrangedSubview(label)
            return label
        }()
    
        
        view.addSubview(stackView)
    
        stackView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalToSuperview()
               
        }
    }
    
    
    
    init(user: User){
        userInfo = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
