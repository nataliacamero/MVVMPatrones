//
//  SplashViewModel.swift
//  MVVMPatrones
//
//  Created by Natalia Camero on 3/10/23.
//

import Foundation

//MARK: - PROTOCOLO
protocol SplashViewModelProtocol {
    func onViewLoaded()
}


//MARK: - CLASE -
final class SplashViewModel {
    private weak var viewDelegate: SplashViewControllerProtocol?
    
    init(viewDelegate: SplashViewControllerProtocol?) {
        self.viewDelegate = viewDelegate
    }
    
    //FUNCIONES PRIVADA
    private func loadData() {
        viewDelegate?.showLoding(true)
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self] in
            // Esto es lo que se ejecutará después de 3 segundos
            print("Datos cargados")
            self?.viewDelegate?.showLoding(false)
            self?.viewDelegate?.navigateToHome()
        }
    }
 
}

// MARK: - EXTENSION -
extension SplashViewModel: SplashViewModelProtocol {
    func onViewLoaded() {
       loadData()
    }
}
