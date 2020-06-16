/*:
 
 # The CPU
 The **C**entral **P**rocessor **U**nit is the brain of your computer, it retrieves, analyzes and sends data to all the other components.
 
 It looks like a little piece of metal with a huge quantity of golden pins on the bottom.
 
 The right position of the CPU is the **socket**, it's located in the upper middle of the motherboard; on the CPU there is a little red arrow, and another one is on the socket, these two arrows defines the orientation and must be aligned when the CPU is placed on the socket.
 
 
 - Note:
 If you don't remeber where the socket is, go back to [Motherboard page](PlaygroundPage1).
 
 
 ***
 # The Heat Sink
 The CPU can become really hot when it works for a while, to **dissipate** the heat that the CPU produce, we can use a heat sink, it is made up of copper sheets and a fan on top that collects all the heat from the sheets and **pushes** it away.
 
 The right position of the heat sink is on top of the CPU and it is connected to the motherboard with 4 screws.
 
 ***
 # Thermal Paste
 To connect the heat sink with the CPU you need to use a **Thermal Paste** that can be placed on top of the CPU to ensure better heat exchange between the CPU and the heat sink.
 */

//#-hidden-code
import UIKit
import PlaygroundSupport

let page = PlaygroundPage.current
let proxy = page.liveView as? PlaygroundRemoteLiveViewProxy

public enum Components2 {
    case motherboard
    case cpu
    case thermale_paste
    case heat_sink
}

func addComponents(_ type: Components2) {
    switch type {
        
    case .motherboard:
        proxy?.send(.string("motherboard"))

        
    case .cpu:
        proxy?.send(.string("cpu"))
        
        
    case .thermale_paste:
        proxy?.send(.string("thermal_paste"))


    case .heat_sink:
        proxy?.send(.string("heat_sink"))


    default:
            break
    }
}

//to add the "insert the components here" i do: <# insert the component here #?> without the ?

//#-end-hidden-code
//Let's assemble together the Motherboard, the CPU, the Thermal Paste and the Heat Sink
//Start by adding here the necessary components...

addComponents(/*#-editable-code*/.<#Enter the component here#> /*#-end-editable-code*/)
addComponents(/*#-editable-code*/.<#Enter the component here#> /*#-end-editable-code*/)
addComponents(/*#-editable-code*/.<#Enter the component here#> /*#-end-editable-code*/)
addComponents(/*#-editable-code*/.<#Enter the component here#> /*#-end-editable-code*/)

