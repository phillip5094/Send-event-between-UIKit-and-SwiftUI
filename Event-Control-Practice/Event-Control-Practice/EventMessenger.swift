//
//  EventMessenger.swift
//  Event-Control-Practice
//
//  Created by Philip on 2022/05/21.
//

import Foundation
import Combine

class EventMessenger: ObservableObject {
    @Published var tapCount: Int = 0
}
