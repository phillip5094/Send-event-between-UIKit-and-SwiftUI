//
//  ViewController.swift
//  Event-Control-Practice
//
//  Created by Philip on 2022/05/21.
//

import UIKit
import SwiftUI
import Combine

//MARK: Combine, ObservableObject
class ViewController: UIViewController {
    private var subs: [AnyCancellable] = []
    private var notifier: EventMessenger = EventMessenger()
    private let countLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        notifier.$tapCount.sink { [weak self] count in
            self?.countLabel.text = "This is a UIKit Control.\nYou tapped \(count) times"
        }
        .store(in: &subs)

        view.addSubview(countLabel)

        NSLayoutConstraint.activate([
            countLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            countLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])


        let tapController = UIHostingController(rootView: TapView().environmentObject(notifier))
        tapController.view.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tapController.view)
        self.addChild(tapController)
        tapController.didMove(toParent: self)

        NSLayoutConstraint.activate([
            tapController.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            tapController.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 200),
        ])
    }
}

//MARK: closure
//class ViewController: UIViewController {
//    private var tapCount: Int = 0
//
//    private let countLabel: UILabel = {
//        let label = UILabel(frame: .zero)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        return label
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.addSubview(countLabel)
//        countLabel.text = "This is a UIKit Control.\nYou tapped \(self.tapCount) times"
//
//        NSLayoutConstraint.activate([
//            countLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            countLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//        ])
//
//
//        let tapView = TapView() { [weak self] in
//            self?.tapCount += 1
//            self?.countLabel.text = "This is a UIKit Control.\nYou tapped \(self?.tapCount ?? 0) times"
//        }
//
//        let tapController = UIHostingController(rootView: tapView)
//        tapController.view.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addSubview(tapController.view)
//        self.addChild(tapController)
//        tapController.didMove(toParent: self)
//
//        NSLayoutConstraint.activate([
//            tapController.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            tapController.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 200),
//        ])
//    }
//}

//MARK: Notification
//class ViewController: UIViewController {
//    private var subs: [AnyCancellable] = []
//    private var tapCount: Int = 0
//
//    private let countLabel: UILabel = {
//        let label = UILabel(frame: .zero)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        return label
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        view.addSubview(countLabel)
//        countLabel.text = "This is a UIKit Control.\nYou tapped \(self.tapCount) times"
//
//        NSLayoutConstraint.activate([
//            countLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            countLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//        ])
//
//
//        let tapController = UIHostingController(rootView: TapView())
//        tapController.view.translatesAutoresizingMaskIntoConstraints = false
//
//        view.addSubview(tapController.view)
//        self.addChild(tapController)
//        tapController.didMove(toParent: self)
//
//        NSLayoutConstraint.activate([
//            tapController.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            tapController.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 200),
//        ])
//
//        NotificationCenter.default.publisher(for: .tapViewTapped).sink { [weak self] tapEvent in
//            self?.tapCount += 1
//            self?.countLabel.text = "This is a UIKit Control.\nYou tapped \(self?.tapCount ?? 0) times"
//        }
//        .store(in: &subs)
//    }
//}

//MARK: UIKit -> SwiftUI
//class ViewController: UIViewController {
//    private var subs: [AnyCancellable] = []
//    private var notifier: EventMessenger = EventMessenger()
//    private let countLabel: UILabel = {
//        let label = UILabel(frame: .zero)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        return label
//    }()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        notifier.$tapCount.sink { [weak self] count in
//            self?.countLabel.text = "This is a UIKit Control.\nYou tapped \(count) times"
//        }
//        .store(in: &subs)
//
//        view.addSubview(countLabel)
//        NSLayoutConstraint.activate([
//            countLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            countLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//        ])
//
//
//        let uikitTapButton = UIButton(configuration: .borderedProminent(), primaryAction: UIAction(){ [weak self] _ in
//            self?.notifier.tapCount += 1
//        })
//        uikitTapButton.translatesAutoresizingMaskIntoConstraints = false
//        uikitTapButton.setTitle("UIKit Tap", for: .normal)
//        view.addSubview(uikitTapButton)
//        NSLayoutConstraint.activate([
//            uikitTapButton.centerXAnchor.constraint(equalTo: countLabel.centerXAnchor),
//            uikitTapButton.centerYAnchor.constraint(equalTo: countLabel.centerYAnchor, constant: 50),
//        ])
//
//
//        let tapController = UIHostingController(rootView: TapView().environmentObject(notifier))
//        tapController.view.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(tapController.view)
//        self.addChild(tapController)
//        tapController.didMove(toParent: self)
//        NSLayoutConstraint.activate([
//            tapController.view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            tapController.view.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 200),
//        ])
//    }
//}
