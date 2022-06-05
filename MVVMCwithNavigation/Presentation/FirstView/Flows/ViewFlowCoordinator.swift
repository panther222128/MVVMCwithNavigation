//
//  ViewFlowCoordinator.swift
//  Coordinator
//
//  Created by Jun Ho JANG on 2022/05/04.
//

import UIKit

protocol ViewFlowCoordinatorDependencies {
    func makeFirstViewController() -> FirstViewController
}

final class ViewFlowCoordinator {
    
    private weak var navigationController: UINavigationController?
    private let dependencies: ViewFlowCoordinatorDependencies
    
    private weak var firstViewController: FirstViewController?
    
    init(navigationController: UINavigationController, dependencies: ViewFlowCoordinatorDependencies) {
        self.navigationController = navigationController
        self.dependencies = dependencies
    }
    
    func start() {
        let viewController = dependencies.makeFirstViewController()
        navigationController?.pushViewController(viewController, animated: true)
        self.firstViewController = viewController
    }
    
}
