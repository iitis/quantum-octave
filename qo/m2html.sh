#!/bin/bash
for f in *.m; do gvim -f +"syn on" +"run! syntax/2html.vim" +"wq" +"q" $f; done
