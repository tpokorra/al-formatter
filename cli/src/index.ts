/* --------------------------------------------------------------------------------------------
 * Copyright (c) Microsoft Corporation. All rights reserved.
 * Licensed under the MIT License. See License.txt in the project root for license information.
 * ------------------------------------------------------------------------------------------ */
'use strict';

import { IndentationHandler } from "../../server/src/components/indentation";
import { VariableHandler } from "../../server/src/components/variable";
import { ReadabilityHandler } from "../../server/src/components/readability";
import { KeywordHandler } from "../../server/src/components/keyword";

const fs = require('fs')
var glob = require('glob');

const tabSize = 4;

function AlFormatterFile(filepath) {
    var edits = [];
    var keywordHandler = new KeywordHandler();
    var indentationHandler = new IndentationHandler();
    var variableHandler = new VariableHandler();
    var readabilityHandler = new ReadabilityHandler();

    fs.readFile(filepath, 'utf8' , (err, data) => {
        if (err) {
            console.error(err)
            return
        }
        let doc = data

        doc = keywordHandler.casing(doc);
        doc = variableHandler.sort(doc);
        doc = readabilityHandler.spacing(doc);
        doc = indentationHandler.indent(doc, tabSize);

        if (doc != data) {
            fs.writeFile(filepath, doc, 'utf8', function (err) {
                if (err) return console.log(err);
                console.log(filepath + ' has been formatted.')
            });
        }
    })
}

async function AlFormatterDirectory(dirpath) {
    var alfiles = glob.sync(dirpath + "/**/*.al")
    for (const f of alfiles) {
        AlFormatterFile(f);
    }
}

const program = require('commander');

program
  .version('0.5.0')
  .description("Format AL files from the command line")
  .option('--path <path>', 'this is a directory where you want to format all *.al files inside')
  .option('--file <file>', 'this is an al file that you want to format')
  .parse(process.argv);

if (!process.argv.slice(2).length) {
  program.outputHelp();
}

if (program.path) {
    AlFormatterDirectory(program.path);
}

if (program.file) {
    AlFormatterFile(program.file);
}
