const fs = require('fs');
const { Elm } = require('./elm.js');

// Check if input and output paths are provided
if (process.argv.length !== 4) {
    console.error('Usage: node main.js <input.json> <output.json>');
    process.exit(1);
}

const inputPath = process.argv[2];
const outputPath = process.argv[3];

// Read input JSON file
let inputData;
try {
    const inputContent = fs.readFileSync(inputPath, 'utf8');
    inputData = JSON.parse(inputContent);
} catch (error) {
    console.error('Error reading input file:', error.message);
    process.exit(1);
}

// Initialize the Elm application
const app = Elm.Main.init();

// Set up the output handler
app.ports.sendOutput.subscribe(output => {
    try {
        fs.writeFileSync(outputPath, JSON.stringify(output, null, 2));
        console.log(`Output written to ${outputPath}`);
        process.exit(0);
    } catch (error) {
        console.error('Error writing output file:', error.message);
        process.exit(1);
    }
});

// Send input to Elm
app.ports.receiveInput.send(inputData);