//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  Provides supporting functions for setting up a live view.
//

import UIKit
import PlaygroundSupport

public func instantiateLiveView() -> PlaygroundLiveViewable {
    let storyboard = UIStoryboard(name: "LiveView", bundle: nil)

    guard let viewController = storyboard.instantiateInitialViewController() else {
        fatalError("LiveView.storyboard does not have an initial scene; please set one or update this function")
    }

    guard let liveViewController = viewController as? LiveViewController else {
        fatalError("LiveView.storyboard's initial scene is not a LiveViewController; please either update the storyboard or this function")
    }

    return liveViewController
}

public func instantiateLiveView(chapter: Int, page: Int) -> PlaygroundLiveViewable {
    
    switch (chapter, page) {
    case (1, 1):
        return LiveViewController_1_1()
    case (2, 1):
        return LiveViewController_2_1()
    case (2, 2):
        return LiveViewController_2_2()
    case (2, 3):
        return LiveViewController_2_3()
    case (2, 4):
        return LiveViewController_2_4()
    case (2, 5):
        return LiveViewController_2_5()
    case (2, 6):
        return LiveViewController_2_6()
    default:
        return LiveViewController()
    }
}
