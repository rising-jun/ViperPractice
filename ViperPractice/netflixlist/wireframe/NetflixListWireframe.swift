//
//  MainWireframe.swift
//  ViperPractice
//
//  Created by 김동준 on 2020/09/18.
//  Copyright © 2020 김동준. All rights reserved.
//

import UIKit

class NetflixListWireframe: NetflixListWireFrameProtocol{
    
    static func createMainViewModule(netflixlist: Array<NetflixData>) -> UIViewController {
        let netflixListController = NetflixListController()
        let preseneter: NetflixListPresenterProtocol = NetflixListPresenter()
        let wireFrame: NetflixListWireFrameProtocol = NetflixListWireframe()
        
        netflixListController.presenter = preseneter
        netflixListController.netflixlist = netflixlist
        preseneter.view = netflixListController
        preseneter.wireFrame = wireFrame
        return netflixListController
    }
    
}
