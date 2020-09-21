//
//  InstaListWireFrame.swift
//  ViperPractice
//
//  Created by 김동준 on 2020/09/21.
//  Copyright © 2020 김동준. All rights reserved.
//

import Foundation
import UIKit

class InstaListWireFrame: InstaListWireFrameProtocol{

    
    static func createSpalshModule(instaList: Array<String>) -> UIViewController {
        let instaListController = InstaListController()
        let presenter: InstaListPresenterProtocol = InstaListPresenter()
        let wireFrame: InstaListWireFrameProtocol = InstaListWireFrame()
        
        instaListController.presenter = presenter
        instaListController.instaList = instaList
        presenter.view = instaListController
        presenter.wireFrame = wireFrame
        return instaListController
    }
}
