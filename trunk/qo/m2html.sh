#!/bin/bash
gvim -f +"syn on" +"run! syntax/2html.vim" +"wq" +"q" $1
