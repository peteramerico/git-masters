#!/bin/bash

#Indo pro diretorio aonde farei a continuacao do cig:
cd /home/peter/Documentos/projeto-peter/codigos-peter/Henrique/src/CIGCONT

#Para executar o Makefile:
make

#Antes de rodar o scons, tenho que ter o arquivo data_psdmvel2000.su, pois o SConstruct usa o cigcont e o data_psdmvel2000.su. Nos arquivos que Gustavo me passou, ele já colocou esse arquivo que foi gerado com os dados dele, mas aqui tenho que usar o que eu gerei com meus dados. Originalmente esse arquivo eh chamado data_psdm.su e foi gerado por mim ao migrar o meu dado. Gustavo tambem gerou esse mesmo arquivo e apenas modificou o nome aqui na pasta CIGCONT para lembrar que esse dado foi obtido ao migrar com velocidade constante de migracao de 2000m/s.
#O arquivo data_psdm.su que eu gerei esta no diretorio: /processamento/peter/Migracao/migrando, que se encontra no cluster e eu posso acessar o neuronio com ssh -X neuronio5 e dai usar o cd para chegar nessa pasta. Em seguida devo copiar esse data_psdm.su para a pasta CIGCONT na minha maquina mesmo, fora do cluster, em /home/peter/Documentos/projeto-peter/codigos-peter/Henrique/src/CIGCONT, pois o scons nao esta funcionando dentro do cluster.

#Para executar o SConstruct:
scons
 

