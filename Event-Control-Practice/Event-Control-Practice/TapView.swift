//
//  TapView.swift
//  Event-Control-Practice
//
//  Created by Philip on 2022/05/21.
//

import SwiftUI

//MARK: Combine, ObservableObject
struct TapView: View {
    @EnvironmentObject var notifier: EventMessenger

    var body: some View {
        VStack {
            Text("This is a SwiftUI Control.")
            Button("Tap Me") {
                notifier.tapCount += 1
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .background(Color.gray.opacity(0.3))
        .cornerRadius(8)
    }
}

//MARK: closure
//struct TapView: View {
//    private var handler: () -> ()
//
//    internal init(handler: @escaping () -> ()) {
//        self.handler = handler
//    }
//
//    @EnvironmentObject var notifier: EventMessenger
//
//    var body: some View {
//        VStack {
//            Text("This is a SwiftUI Control.")
//            Button("Tap Me") {
//                handler()
//            }
//            .buttonStyle(.borderedProminent)
//        }
//        .padding()
//        .background(Color.gray.opacity(0.3))
//        .cornerRadius(8)
//    }
//}

//MARK: Notification
//extension NSNotification.Name {
//    static let tapViewTapped = NSNotification.Name("tapViewTapped")
//}
//
//struct TapView: View {
//    @EnvironmentObject var notifier: EventMessenger
//
//    var body: some View {
//        VStack {
//            Text("This is a SwiftUI Control.")
//            Button("Tap Me") {
//                NotificationCenter.default.post(name: .tapViewTapped, object: nil)
//            }
//            .buttonStyle(.borderedProminent)
//        }
//        .padding()
//        .background(Color.gray.opacity(0.3))
//        .cornerRadius(8)
//    }
//}

//MARK: UIKit -> SwiftUI
//struct TapView: View {
//    @EnvironmentObject var notifier: EventMessenger
//
//    var body: some View {
//        VStack {
//            Text("This is a SwiftUI Control.\nTotap taps are \(notifier.tapCount)")
//            Button("Tap Me") {
//                notifier.tapCount += 1
//            }
//            .buttonStyle(.borderedProminent)
//        }
//        .padding()
//        .background(Color.gray.opacity(0.3))
//        .cornerRadius(8)
//    }
//}
