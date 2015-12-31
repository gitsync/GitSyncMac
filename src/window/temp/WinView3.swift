import Cocoa

class WinView3:NSView {
    override var wantsDefaultClipping:Bool{return false}//avoids clipping the view
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        createContent()
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    func createContent(){
        //continue here: make winview3.swift and start testing the SVGLib, you probably will need to look over some old notes
        //svgTest()
        regExpTest()
    }
    /**
     *
     */
    func svgTest(){
        let path = "~/Desktop/icons/cross.svg".tildePath
        let content = FileParser.content(path)
        //Swift.print("content: " + "\(content)")
        
        let xmlDoc:NSXMLDocument = try! NSXMLDocument(XMLString: content!, options: 0)
        let rootElement:NSXMLElement = xmlDoc.rootElement()!
        //Swift.print("rootElement.localName: " + "\(rootElement.localName)")
        //Swift.print("rootElement.childCount: " + "\(rootElement.childCount)")
        
        
        //let child:NSXMLElement = XMLParser.childAt(rootElement.children!, 0)!
        //Swift.print("child.stringValue: " + "\(child.stringValue)")
        //Swift.print("child.localName: " + "\(child.localName)")
        
        let svg:SVG = SVGParser.svg(rootElement);
        SVGParser.describeAll(svg)
        //SVGModifier.scale(svg, CGPoint(), CGPoint(2,2));
        //addSubview(svg);
    }
    func regExpTest(){
        let part1:String = "(?<=^|\\,|\\s|px|\\b)"
        let part2:String = "\\-?\\d*?"
        let part3:String = "(\\.?)"
        let part4:String = "((?1)\\d+?)"
        let part5:String = "(?=px|\\s|\\,|\\-|$)"
        let pattern:String = part1 + part2 + part3 + part4
        let stringArray:Array<String> = "".match(pattern);
        Swift.print("stringArray: " + "\(stringArray)")
        //let array:Array<CGFloat> = stringArray.map {CGFloat(Double($0)!)}//<--temp fix
    }
}
