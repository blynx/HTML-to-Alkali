/*

    HTML to Alkali

*/

{
    let indent = options.indent || false

    function makeAlkaliElement(name, attributes, content) {
        
        if(name.length < 3) {
            name = name.toUpperCase()
        } else {
            name = name.substring(0, 1).toUpperCase() + name.substr(1).toLowerCase()
        }

        // etc ...
    }
}

Document = 
    nodes:Node*
    {
        console.log(JSON.stringify(nodes) + "\n\n\n")
        return nodes.reduce((glob, value) => {
            console.log(value)
        })
    }

Node = 
    ( Tag / Text )

Text = text:([^<]+)
    {
        return {
            type: "textnode",
            content: text.join('')
        }
    }

Emptytag =
    "<" tagname:Emptytagname attributes:Attribute? ">"
    {
        return {
            type: "element",
            tagname: tagname,
            attributes: attributes
        }
    }

Tag = 
    "<" tagname:Tagname attributes:Attribute? ">" inner:(Node)* endtag:Endtag
    {
        return {
            type: "element",
            tagname: tagname,
            content: inner,
            attributes: attributes
        }
    }

Endtag = "</" Tagname ">" { return }

Attribute =
    _ attributeName:Attributename attributeValue:AttributeValue? _
    {
        return {
            attributeName: attributeName,
            attributeValue: attributeValue
        }
    }

Attributename = 
    // attributeName:([a-zA-Z][a-zA-Z\-]*) { return attributeName }
    // https://html.spec.whatwg.org/multipage/syntax.html#attributes-2
    attributeName:[^ \t\r\f\/\>"'=]+ 
    { 
        return attributeName.join('')
    }

AttributeValue = 
    "=" attributeValue:( (quot [^"]* quot) / (apos [^"]* apos) )
    {
        return attributeValue[1].join('')
    }

Tagname =
    "body"i/
    "main"i/
    "div"i/ 
    "section"i/
    "nav"i/
    "menu"i/
    "ul"i/
    "li"i/
    "span"i/
    "a"i/
    "em"i/
    "strong"i
// Video Source Media Audio UL Track Title TextArea Template TBody THead TFoot TR Table Col ColGroup TH TD Caption Style Span Shadow Select Script Quote Progress Pre Picture Param P Output Option Optgroup Object OL Ins Del Meter Meta Menu Map Link Legend Label LI KeyGen Img IFrame H1 H2 H3 H4 H5 H6 Hr FrameSet Frame Form Font Embed Article Aside Figure FigCaption Header Main Mark MenuItem Nav Section Summary WBr Div Dialog Details DataList DL Canvas Button Base Br Area A


Emptytagname =
    "img"i

_ "whitespace"
    = [ \t\n\r]*

quot =
    "\""

apos = 
    "\'"