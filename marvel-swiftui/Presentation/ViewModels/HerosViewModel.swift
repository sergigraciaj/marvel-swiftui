//
//  HerosViewModel.swift
//  kcHerosMultiSwiftUI
//
//  Created by Jose Luis Bustos Esteban on 10/12/24.
//

import Foundation

@Observable
final class HerosViewModel {
    var herosData = [HerosModel]()
    
    @ObservationIgnored
    private var useCaseHeros: HerosUseCaseProtocol
    
    init(useCaseHeros: HerosUseCaseProtocol = HerosUseCase()) {
        self.useCaseHeros = useCaseHeros
        
        Task{
            await getHeros()
        }
    }
    
    @MainActor
    func getHeros() async {
        let data = await useCaseHeros.getHeros()
        self.herosData = data
    }
}
