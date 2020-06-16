//#-hidden-code
//
//  See LICENSE folder for this template’s licensing information.
//
//  Abstract:
//  The Swift file containing the source code edited by the user of this playground book.
//
//#-end-hidden-code

/*:
 
 # WELCOME
 
 Hey man, welcome in the **amazing** world of computers, this is **"What's in my PC"** and with this Playground Book you will be thrown in the basic components that allow a PC to work, you will learn what they are used for and how they are arranged inside a PC, in order to have a **full** experience of the book, be sure to reach at least the second page of chapter "The Components" and turn the volume up.
 
 Let's start and enjoy the experience 😁
 
 */

//#-hidden-code
import UIKit
import PlaygroundSupport

let page = PlaygroundPage.current
let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy

public class ProjectClass {
    public func showSpoiler() {
        proxy?.send(.string("showSpoiler"))
    }
}

let Project = ProjectClass()

//#-end-hidden-code
