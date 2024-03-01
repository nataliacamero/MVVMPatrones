//
//  DetailViewModel.swift
//  MVVMPatrones
//
//  Created by Natalia Camero on 7/10/23.
//

import Foundation

//MARK: - PROTOCOLO -
protocol DetailViewModelProtocol {
    func onViewsLoaded()
}


//MARK: - CLASE -
final class DetailViewModel {
    //Conexion con la vista
    private weak var viewDelegate: DetailViewControllerProtocol?
   
    private var characterData: CharacterModel?
    
    init(viewDelegate: DetailViewControllerProtocol?, characterData: CharacterModel?) {
        self.viewDelegate = viewDelegate
        self.characterData = characterData
    }
}


//MARK: - EXTENSION -
extension DetailViewModel: DetailViewModelProtocol {
    func onViewsLoaded() {
        viewDelegate?.update(image: characterData?.image)
        viewDelegate?.update(name: characterData?.name)
        viewDelegate?.update(job: characterData?.job)
        viewDelegate?.update(description: characterData?.description)
    }
}
   
    
   
    

    
   
    
    
