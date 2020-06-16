/*:
 
 # The RAM
 The **R**andom **A**ccess **M**emory is the storage where the CPU **collects** all the data of the program running on the PC. The contents of RAM are accessible faster than other types of storage but are lost every time the computer is turned off.
 
 It looks like a long strip with a series of golden connectors at the bottom and a **gap** between these golden pins.
 
 Its correct position is in the **RAM slot**, keep in mind that to insert it into the slots, the gap between the golden pins must correspond with the small raised part you see in the slot.
 Also remember that usually on the top of the RAM slot there is a **number** indicating the order in which to insert the RAM, respect it.
 
 - Note:
 If you don't remeber where the RAM slot is, go back to [Motherboard page](PlaygroundPage1).
 
 
 
 */

//#-hidden-code
import UIKit
import PlaygroundSupport

let page = PlaygroundPage.current
let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy

public enum Components3 {
    case motherboard
    case ram
}

func addComponents(_ type: Components3) {
    switch type {
        
    case .motherboard:
        proxy?.send(.string("motherboard"))
        
        
    case .ram:
        proxy?.send(.string("ram"))
        
        
    default:
        break
    }
}
//#-end-hidden-code
//Let's add some RAM to our motherboard
//Start by adding here the necessary components...

addComponents(/*#-editable-code*/.<#Enter the component here#> /*#-end-editable-code*/)
addComponents(/*#-editable-code*/.<#Enter the component here#> /*#-end-editable-code*/)





