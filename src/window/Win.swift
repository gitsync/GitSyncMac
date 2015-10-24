import Foundation
import Cocoa

/*
* NOTE: Great doc about NSWin: https://www.google.no/url?sa=t&rct=j&q=&esrc=s&source=web&cd=1&cad=rja&uact=8&ved=0CCIQFjAAahUKEwig7tP06dbIAhXlnHIKHX4EDf4&url=https%3A%2F%2Fdeveloper.apple.com%2Flibrary%2Fmac%2Fdocumentation%2FCocoa%2FReference%2FApplicationKit%2FClasses%2FNSWindow_Class%2F&usg=AFQjCNEwF-62zCVqYtHRLdEo5vTD4Oo0Fw
* TODO: Add Broadcast/Subscribe to info win
* TODO: Add Transmit/Receive buttons to tab-bar
*/
class Win:NSWindow, NSApplicationDelegate, NSWindowDelegate{
    let titles:[String] = ["Add","Remove","Info","View","test"]
    //add a row of debug buttons bellow the tableview
    static var width = 800//Static variable, reachable on a class level
    static var height = 600
    static var sizeRect:NSRect = NSRect(x: 0, y: 0, width: Win.width, height: Win.height)//NSMakeRect(0, 0, TempWin.width, TempWin.height)
    var view:FlippedView = FlippedView(frame: Win.sizeRect)
    
    override init(contentRect: NSRect, styleMask aStyle: Int, backing bufferingType: NSBackingStoreType, `defer` flag: Bool) {
        super.init(contentRect: Win.sizeRect, styleMask: NSTitledWindowMask|NSResizableWindowMask|NSMiniaturizableWindowMask|NSClosableWindowMask, backing: NSBackingStoreType.Buffered, `defer`: false)
        self.backgroundColor = NSColor.whiteColor()
        self.makeKeyAndOrderFront(nil)//moves the window to the front
        self.makeMainWindow()//makes it the apps main menu?
        //Swift.print(self.deviceDescription)
        
        //Swift.print(self.windowNumber)
        //Swift.print(self.screen?.deviceDescription)
        //Swift.print(self.screen!.frame)//screen size
        //Swift.print(self.frame)//frame size
        Swift.print(view.bounds)
        //let controller = NSWindowController(window: newWindow)
        //controller.showWindow(self)
        self.center()
        self.contentView = view
        self.title = "GitSync"
        createContent()
        self.delegate = self
    }
    /*
    * Required by the NSWindow
    */
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    * I think this serves as a block for closing, i. promt the user to save etc
    */
    func windowShouldClose(sender: AnyObject) -> Bool {
        Swift.print("windowShouldClose")
        return true
    }
    /**
    *
    */
    func createContent(){ 
        createButtons()
        //createTextField()
        createTable()
    }
    /*
    *
    */
    func createButtons(){
        let topPadding:Int = 24
        let buttonSpacing:Int = 12
        
        var buttons:Array<NSButton> = []
        
        //TODO:  store buttons globaly, and switch in the myaction call
        //TODO: create a view named container with buttons that the tableview then can pin itself to
        //TODO: create debug button so you can test how to get the table row id of the selected row
        
        for title:String in titles{
            let button = Create.textButton(title)
            
            view.addSubview(button)//Add button to view
            button.target = self//event dispataches to this instance
            button.action = "myAction:"//event dispatches to this method
            buttons.append(button)//add button to button list
        }
        Align.horizontal(buttons,Win.width,topPadding,buttonSpacing)//aligns the buttons
    }
    /*
    * NSTableView
    */
    
    func createTable(){
        let tableContainerRect:NSRect = NSRect(x: Table.leftPadding, y: Table.topPadding, width: Table.width-Table.leftPadding,height:Win.height-Table.topPadding-EditMenu.height)//view.bounds
        let tableContainer = NSScrollView(frame: tableContainerRect)
        tableContainer.drawsBackground = false;
        tableContainer.borderType = NSBorderType.BezelBorder
        let table = Table()//tableContainer.frame.width-100, height: tableContainer.frame.height
        //self.makeFirstResponder(tableView)//focus tableView,doesnt work yet
        //self.initialFirstResponder = tableView
       
        table.autoresizingMask = NSAutoresizingMaskOptions.ViewWidthSizable //TODO: try to get height working here to
        
        tableContainer.documentView = table
        tableContainer.hasVerticalScroller = true
        view.addSubview(tableContainer)//add tableView to the window view
    }
    /*
    * NSTextField
    */
    func createTextField(){
        let textField = NSTextField(frame: NSRect(x: 0, y: 130, width: 100, height: 20))
        textField.stringValue = "Test"
        view.addSubview(textField)
        //print("Hello world again")
    }
    /*
    * EventHandler for the button
    */
    func myAction(obj:AnyObject!){
        //Swift.print(ClassParser.getClass(obj))
        //Swift.print("My class is \((obj as! NSObject).className)")
        if let button = obj as? NSButton{
            switch button.title{
            case titles[0]:
                Swift.print(titles[0])
            case titles[1]:
                Swift.print(titles[1])
            case titles[2]:
                Swift.print(titles[2])
            case titles[3]:
                Swift.print(titles[3])
            case titles[4]:
                Swift.print(titles[4])
                //do debug stuff
            default:
                break
            }
        }
    }
}
