//
//  ThemeService.swift
//  Deluge
//
//  Created by Yotam Ohayon on 16/05/2017.
//  Copyright © 2017 Yotam Ohayon. All rights reserved.
//

import Foundation
import RxSwift
import Delugion

protocol ThemeServicing {
    var service: Observable<ThemeManaging> { get }
}

class ThemeService: ThemeServicing {
    
    let service: Observable<ThemeManaging>
    
    init(themeManager: ThemeManaging) {
        self.service = Observable.just(themeManager)
    }
    
}

protocol ThemeManaging {
    
    func color(forTorrentState state: TorrentState) -> UIColor
    
}

class ThemeManager: ThemeManaging {

    func color(forTorrentState state: TorrentState) -> UIColor {
        switch state {
        case .seeding: return UIColor(red: 97.0/255.0, green: 193.0/255.0, blue: 27.0/255.0, alpha: 1)
        case .paused: return UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1)
        case .error: return UIColor(red: 97.0/255.0, green: 193.0/255.0, blue: 27.0/255.0, alpha: 1)
        case .downloading: return UIColor(red: 101.0/255.0, green: 162.0/255.0, blue: 216.0/255.0, alpha: 1)
        case .queued: return UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1)
        case .checking: return UIColor(red: 153.0/255.0, green: 153.0/255.0, blue: 153.0/255.0, alpha: 1)
        }
    }
    
}
