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
    let numberOfUsers = 5
    
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
        fetchInfo(numberOfUsers)
    }
    
    func fetchInfo(_ numberOfUsers: Int) {
        for _ in 0..<numberOfUsers {
            viewModel.fetchUsers { [weak self] user in
                print("This is user:")
                print(user)
                guard let strongSelf = self else { return }
                strongSelf.displayUser(user)
            }
        }
    }
    
    
    func displayUser(_ user: User) {
        self.usersArray.append(user)
        self.tableView.reloadData()
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
        let controller = InfoViewController(user: usersArray[indexPath.row])
        show(controller, sender: Any?.self)
    }
    
}

extension UIView {
    var safeArea : ConstraintLayoutGuideDSL {
        return safeAreaLayoutGuide.snp
    }
}
