/*:
 
 # The Case
 The Case is the **container** of all the components that the PC uses to work, it is built with metal or plastic and sometimes it is **divided** into different parts to facilitate the assembly of your PC.
 
 It is often equipped with fans that allow it to guarantee air circulation inside the case in order to keep the temperatures of the various components as cold as possible

 The **motherboard** shuold be the first thing to insert in the PC and you need to put it in the **upper left** side of the case.
 
 - Note:
 If you don't remeber the right positions of SSD and PSU, go back to [previous page](@previous).
 
 */

//#-hidden-code
import UIKit
import PlaygroundSupport

let page = PlaygroundPage.current
let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy

public enum Components6 {
    case pcCase
    case motherboard
    case psu
    case ssd
}

func addComponents(_ type: Components6) {
    switch type {
        
    case .pcCase:
        proxy?.send(.string("case"))
        
    case .motherboard:
        proxy?.send(.string("motherboard"))
        
    case .psu:
        proxy?.send(.string("psu"))
        
    case .ssd:
        proxy?.send(.string("ssd"))
        
        
    default:
        break
    }
}
//#-end-hidden-code
//Let's put all the components together
//Start by adding here the necessary components...

addComponents(/*#-editable-code*/.<#Enter the component here#> /*#-end-editable-code*/)
addComponents(/*#-editable-code*/.<#Enter the component here#> /*#-end-editable-code*/)
addComponents(/*#-editable-code*/.<#Enter the component here#> /*#-end-editable-code*/)
addComponents(/*#-editable-code*/.<#Enter the component here#> /*#-end-editable-code*/)


