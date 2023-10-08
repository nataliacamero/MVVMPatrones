//
//  DetailViewModel.swift
//  MVVMPatrones
//
//  Created by Natalia Camero on 7/10/23.
//

import Foundation

//MARK: - PROTOCOLO -
protocol DetailViewModelProtocol {
    var character: CharacterModel? {get}
}

//MARK: - CLASE -
final class DetailViewModel {
    private weak var viewDelegate: DetailViewControllerProtocol?  //Conexion con la vista
    var character: CharacterModel?
    
    init(viewDelegate: DetailViewControllerProtocol? = nil, character: CharacterModel?) {
        self.viewDelegate = viewDelegate
        self.character = character
    }
    
    
}


//MARK: - EXTENSION -
extension DetailViewModel: DetailViewModelProtocol {
}
   
    
   
    

    
   
    
    
