import Foundation

class CustomWin:Window{
    override func resolveSkin() {
        self.contentView = CustomView(frame.width,frame.height)/*Sets the mainview of the window*/
    }
    override func windowDidResize(notification: NSNotification) {
        //notification
        //Swift.print("CustomWin.windowDidResize")
        (self.contentView as! WindowView).setSize(self.frame.size)
    }
}