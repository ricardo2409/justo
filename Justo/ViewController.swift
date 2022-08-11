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
        self.tableView.register(UserCell.self, forCellReuseIdentifier: "cell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        //self.tableView.isEditing = true
        self.tableView.snp.makeConstraints { make in
            make.center.width.equalToSuperview()
            make.top.equalTo(view.safeArea.top)
        }
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull down to refresh")
        self.refreshControl.tintColor = UIColor(.blue)
        self.refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        self.tableView.addSubview(refreshControl)
        self.fetchInfo(numberOfUsers)
    }
    
    func fetchInfo(_ numberOfUsers: Int) {
        for _ in 0..<numberOfUsers {
            viewModel.fetchUsers { [weak self] user in
                guard let strongSelf = self else { return }
                strongSelf.displayUser(user)
            }
        }
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
        print("Did select")
        let controller = InfoView(user: usersArray[indexPath.row])
        show(controller, sender: Any?.self)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            self.usersArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }
    
}

extension UIView {
    var safeArea : ConstraintLayoutGuideDSL {
        return safeAreaLayoutGuide.snp
    }
}
