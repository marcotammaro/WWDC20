/*:
 
 # The SSD
 The **S**olid **S**tate **D**rive is the component that **collects** all the permanent **data**, it saves applications, the documents, and all the things that you can see when you turn on the PC because (unlike RAMs) the data are not lost if you turn off the PC.
 
 It looks like a rectangle made of metal or plastic with some connectors on one side.
 
 Its position is in the upper right zone of your PC case, sometimes in this area there are a lot of slots where you can plug more SSDs.
 
 # The PSU
 The **P**ower **S**upply **U**nit is the component that gives life to all the other components, it delivers the **eletrical power** to all the devices connected to the PC.
 
 It looks like a cube of metal with a lot of cables and connectors and it's build with a fan to disperse the heat.
 
 Its position is in the bottom left zone of your PC case.
 
 - Important:
 Be careful when you build or dismantle the PSU yourself because the eletrical power he gets is very high and can cause serious physical damage including death.
 
 */

//#-hidden-code
import UIKit
import PlaygroundSupport

let page = PlaygroundPage.current
let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy

public enum Components5 {
    case ssd
    case psu
}

func showComponents(_ type: Components5) {
    switch type {
      
    case .psu:
        proxy?.send(.string("psu"))
        
    case .ssd:
        proxy?.send(.string("ssd"))
        
        
    default:
        break
    }
}
//#-end-hidden-code
//Let's discover how SSD and PSU are made
//Start by adding here the necessary components...

showComponents(/*#-editable-code*/.<#Enter the component here#> /*#-end-editable-code*/)
showComponents(/*#-editable-code*/.<#Enter the component here#> /*#-end-editable-code*/)




