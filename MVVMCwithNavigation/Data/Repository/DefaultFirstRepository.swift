//
//  FirstRepository.swift
//  Coordinator
//
//  Created by Jun Ho JANG on 2022/05/04.
//

import Foundation

final class DefaultFirstRepository: FirstRepository {
    
    private let dataTransferService: DataTransferService
    
    init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
    
}
