#!/bin/bash

#Para copiar os arquivos cigcont....rsf que estao na pasta /CIGCONT (que sao os cigs continuados) para a pasta aonde farei a analise de velocidade (/Anavel):
cp -p $(find /processamento/peter/CIGCONT -name 'cigcont*.rsf') /processamento/peter/Anavel

#Para me certificar que copiei corretamente somente os cigcont....rsf eu conto quantos arquivos assim tenho na pasta /Anavel e tambem conto na pasta /CIGCONT. Se bater, esta tudo correto:
ls -dq *cigcont*.rsf* | wc -l
