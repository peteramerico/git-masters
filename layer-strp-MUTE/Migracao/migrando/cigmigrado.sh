#! /bin/bash

suwind<data_psdm_cdp_off.su key=cdp min=7550 max=7550 >cig7550.su

sustrip < cig7550.su head=data.headers >cig7550.bin
