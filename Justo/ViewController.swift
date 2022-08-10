//
//  ViewController.swift
//  Justo
//
//  Created by Ricardo Trevino on 8/10/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let tableView = UITableView()
    var usersArray = [User]()
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Viewdidload")

        view.addSubview(tableView)
        tableView.register(UserCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.snp.makeConstraints { make in
            make.center.width.equalToSuperview()
            make.top.equalTo(view.safeArea.top)
        }
        
        viewModel.fetchUsers { [weak self] user in
            print("This is user:")
            print(user)
            guard let strongSelf = self else { return }
            
            strongSelf.displayUser(user)
        }
        
    }
    
    func displayUser(_ user: User) {
        
        print("Estoy en display")
        print(user)
        
        self.tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserCell
        cell.user = usersArray[indexPath.row]
        return cell
    }
    
}

extension UIView {
    var safeArea : ConstraintLayoutGuideDSL {
        return safeAreaLayoutGuide.snp
    }
}
