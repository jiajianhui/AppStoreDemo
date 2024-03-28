//
//  Animations.swift
//  AppStoreDemo
//
//  Created by 贾建辉 on 2024/3/26.
//

import Foundation
import SwiftUI

extension Animation {
    static var openCard: Animation {.spring(response: 0.6, dampingFraction: 0.7)}
    static var closeCard: Animation {.spring(response: 0.6, dampingFraction: 0.8)}
    static var closeBtn: Animation {.spring(response: 0.6, dampingFraction: 0.6)}
}
