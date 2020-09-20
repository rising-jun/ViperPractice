//
//  SplashPresenter.swift
//  ViperPractice
//
//  Created by 김동준 on 2020/09/17.
//  Copyright © 2020 김동준. All rights reserved.
//

import UIKit
class SplashPresenter: SplashPresenterProtocol{
    weak var view: SplashViewProtocol?
    var interactor: SplashInteractorInputProtocol?
    var wireFrame: SplashWireFrameProtocol?
    
    func viewDidLoad() {
        //sleep(2)
        interactor?.requestDatas()
    }
    
    
}

extension SplashPresenter: SplashInteractorOutputProtocol{
    func giveDatas(netflixList: Array<NetflixData>, instaList: Array<String>, naverList: Array<String>) {
        wireFrame?.presentMainScreen(from: view, netflixlist: netflixList, instaList: instaList, naverList: naverList)
        
    }
}
