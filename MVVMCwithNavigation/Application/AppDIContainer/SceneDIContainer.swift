//
//  SceneDIContainer.swift
//  Coordinator
//
//  Created by Jun Ho JANG on 2022/05/04.
//

import UIKit

final class SceneDIContainer: ViewFlowCoordinatorDependencies {
    
    struct Dependencies {
        let apiDataTransferService: DataTransferService
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func makeViewFlowCoordinator(navigationController: UINavigationController) -> ViewFlowCoordinator {
        return ViewFlowCoordinator(navigationController: navigationController, dependencies: self)
    }
    
    func makeFirstRepository() -> FirstRepository {
        return DefaultFirstRepository(dataTransferService: self.dependencies.apiDataTransferService)
    }
    
    func makeFirstUseCase() -> FirstUseCase {
        return DefaultFirstUseCase(firstRepository: self.makeFirstRepository())
    }
    
    func makeFirstViewModel() -> FirstViewModel {
        return DefaultFirstViewModel(firstUseCase: self.makeFirstUseCase())
    }
    
    func makeFirstViewController() -> FirstViewController {
        return FirstViewController.create(with: self.makeFirstViewModel())
    }
    
}
