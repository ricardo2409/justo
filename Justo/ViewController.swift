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
    let numberOfUsers = 6
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.register(UserCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.snp.makeConstraints { make in
            make.center.width.equalToSuperview()
            make.top.equalTo(view.safeArea.top)
        }
        refreshControl.attributedTitle = NSAttributedString(string: "Pull down to refresh")
        refreshControl.tintColor = UIColor(.blue)
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        fetchInfo(numberOfUsers)
        print("Ya estoy fuera del loooooop")
    }
    
    func fetchInfo(_ numberOfUsers: Int) {
        for _ in 0..<numberOfUsers {
            viewModel.fetchUsers { [weak self] user in
                print("This is user:")
                print(user)
                guard let strongSelf = self else { return }
                print(strongSelf.usersArray.count)
                strongSelf.displayUser(user)
            }
        }
        print("Ya estoy fuera del loop")
        
    }
    
    func displayUser(_ user: User) {
        self.usersArray.append(user)
        self.tableView.reloadData()
        
    }
    
    @objc func refresh(_ sender: AnyObject) {
        print("refresh")
        self.usersArray.removeAll()
        self.fetchInfo(numberOfUsers)
        self.refreshControl.endRefreshing()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserCell
        cell.user = usersArray[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = InfoView(user: usersArray[indexPath.row])
        show(controller, sender: Any?.self)
    }
    
    
}

extension UIView {
    var safeArea : ConstraintLayoutGuideDSL {
        return safeAreaLayoutGuide.snp
    }
}
