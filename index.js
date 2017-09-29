const parser = require('./html-to-alkali.js')
const fs = require('fs')

let html = fs.readFileSync('./markup.html', 'utf8')

let output = ""
let parseroptions = {
    myOption: "hi!"
}

try {
    output = parser.parse(html, parseroptions)
    console.log(output)

} catch (exception) {
    
    console.log("\n")
    console.log("Parser exception:")
    console.log("At line: " + exception.location.start.line + ", column: " + exception.location.start.column)
    // console.log(exception.expected)
    // console.log(exception.found)
    console.log(exception.message)
    console.log("\n")
}

fs.writeFileSync('./output.js', output)