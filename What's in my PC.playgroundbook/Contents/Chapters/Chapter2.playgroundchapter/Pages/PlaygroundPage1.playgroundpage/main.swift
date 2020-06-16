/*:
 
 # The Motherboard
 
 Hey, welcome in the first component, it's called motherboard and maybe it's the most important component in your PC, it **coordinates** all the other elements of the PC and allows them to interact with each other.
 
 To understand the future components of this book we need to understand the **main zone** that form a motherboard:
 
 1. The **socket** of the CPU (🟥 frame).
 
 2. The **RAMs slot** (🟨 frame).
 
 3. The **PCI Express slot** (🟦 frame).
 
 - Note:
Complete and run the code and **tap** in the **colored frames** to see more details.
 
 */

//#-hidden-code
import UIKit
import PlaygroundSupport

let page = PlaygroundPage.current
let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy

public enum Components1 {
    case motherboard
}

func addComponents(_ type: Components1) {
    switch type {
        
    case .motherboard:
        proxy?.send(.string("motherboard"))
        
    default:
        break
    }
}

//#-end-hidden-code
//Add here the motherboard in order to see how it is made.

addComponents(/*#-editable-code*/.<#Enter the component here#> /*#-end-editable-code*/)


