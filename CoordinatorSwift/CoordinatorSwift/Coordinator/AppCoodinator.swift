//
//  AppCoodinator.swift
//  CoordinatorSwift
//
//  Created by Hyesung Jeon on 2023/04/02.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator, LoginCoordinatorDelegate, MainCoordinatorDelegate {
    
    var childCoordinators: [Coordinator] = []
    private var navigationController: UINavigationController!
    
    var isLoggedIn: Bool = false
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        // isLoggedIn이 false면 Login화면을, 아니라면 Main화면을 보여준다.
        if self.isLoggedIn {
            self.showMainViewController()
        } else {
            self.showLoginViewController()
        }
    }
    
    private func showMainViewController() {
        let coordinator = MainCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
    
    private func showLoginViewController() {
        let coordinator = LoginCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self
        coordinator.start()
        self.childCoordinators.append(coordinator)
    }
       
    func didLoggedIn(_ coordinator: LoginCoordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
        self.showMainViewController()
    }
    
    func didLoggedOut(_ coordinator: MainCoordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== coordinator }
        self.showLoginViewController()
    }
}
