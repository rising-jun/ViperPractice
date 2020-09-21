//
//  MainPresenter.swift
//  ViperPractice
//
//  Created by 김동준 on 2020/09/18.
//  Copyright © 2020 김동준. All rights reserved.
//

import Foundation
class NetflixListPresenter: NetflixListPresenterProtocol{
    weak var view: NetflixListProtocol?
    
    var interactor: NetflixListInteractorInputProtocol?
    
    var wireFrame: NetflixListWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showPost()
    }
    
}

extension NetflixListPresenter: NetflixListInteractorOutputProtocol{
    func giveData() {
        
    }
    
    
}
