//
//  Coordinator.swift
//  CoordinatorSwift
//
//  Created by Hyesung Jeon on 2023/04/02.
//

import Foundation

protocol Coordinator: AnyObject {
    var childCoordinators : [Coordinator] { get set }
    func start()
}
