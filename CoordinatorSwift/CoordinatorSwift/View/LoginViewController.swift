//
//  LoginViewController.swift
//  CoordinatorSwift
//
//  Created by Hyesung Jeon on 2023/04/02.
//

import UIKit

protocol LoginViewControllerDelegate {
    func login()
}

class LoginViewController: UIViewController {
    
    var delegate: LoginViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        let item = UIBarButtonItem(title: "로그인", style: .plain, target: self, action: #selector(self.loginButtonDidTap))
        self.navigationItem.rightBarButtonItem = item
    }
    
    deinit {
        print("- \(type(of: self)) deinit")
    }
    
    @objc
    func loginButtonDidTap() {
        self.delegate?.login()
    }

}
