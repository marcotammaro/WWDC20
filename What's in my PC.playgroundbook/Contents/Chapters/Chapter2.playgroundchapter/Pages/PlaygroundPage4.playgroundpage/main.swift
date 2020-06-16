/*:
 
 # The GPU
 The **G**raphics **P**rocessing **U**nit is the component of PC that manages everything related to **video** output, it manages the monitor and all those processes that require **graphic support**.
 
 * Callout(Curious Fact):
 The CPU already has a little GPU inside but its power is less than a dedicated external GPU
 
 It is made from a large card on which the graphic processor is placed, above which is placed a large **heat sink** composed of two fans that cool down the huge amount of heat produced by the graphic processor; on the bottom there is a series of contacts similar to those we see on the RAM and they too have a gap between them.
 
 Its correct position is in the PCI express slot. This slot (as the RAM slot) shows a small **raised part** that must correspond with the gap betweem the GPU contacts.
 
 - Note:
 If you don't remeber where the PCI express slot is, go back to [Motherboard page](PlaygroundPage1).
 
 
 
 */

//#-hidden-code
import UIKit
import PlaygroundSupport

let page = PlaygroundPage.current
let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy

public enum Components4 {
    case motherboard
    case gpu
}

func addComponents(_ type: Components4) {
    switch type {
        
    case .motherboard:
        proxy?.send(.string("motherboard"))
        
        
    case .gpu:
        proxy?.send(.string("gpu"))
        
        
    default:
        break
    }
}
//#-end-hidden-code
//Let's add a GPU on the motherboard
//Start by adding here the necessary components...

addComponents(/*#-editable-code*/.<#Enter the component here#> /*#-end-editable-code*/)
addComponents(/*#-editable-code*/.<#Enter the component here#> /*#-end-editable-code*/)



