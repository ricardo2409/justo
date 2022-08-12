//
//  UserCell.swift
//  Justo
//
//  Created by Ricardo Trevino on 8/10/22.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class UserCell: UITableViewCell {
    
    var user: User? {
        didSet{
            if let user = user {
                
                let url = URL(string: user.profilePicThumbnail)
                userImage.kf.setImage(with: url)
                nameLabel.text = "Name: \(user.name)"
                emailLabel.text = "Email: \(user.email)"
                phoneLabel.text = "Phone: \(user.phoneNo)"
                print("Esto es lo que recibo:")
                print(user)
            }
        }
    }
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private let emailLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let phoneLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private let userImage : UIImageView = {
        let imageView = UIImageView(image: nil)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 50.0
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        [nameLabel, emailLabel, phoneLabel].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(userImage)
        addSubview(stackView)
        
        //Image and Stackview Constraints
        userImage.snp.makeConstraints({ make in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(100)
        })
        
        stackView.snp.makeConstraints({ make in
            make.top.bottom.equalToSuperview()
            make.right.equalToSuperview().offset(60.0)
            make.left.equalTo(userImage.snp.right).offset(30.0)
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
