set terminal pdfcairo size 15cm,8cm font 'Arial,14'
set output "out.pdf"

set key off

set style fill transparent solid 0.7 noborder

# Style for interfaces
set style line 100 lw 1.5 lc rgb "#000000"

# Style for well
set style line 101 lw 2.0 lc rgb "#0000CF"

# Style for rays
set style line 102 lw 0.5 lc rgb "#483737"

# Style for major and minor grid lines
set style line 120 lw 0.5 lt 0 lc rgb "#000000"
set style line 121 lw 0.5 lt 0 lc rgb "#000000"

# Style for layers
set style line 200 lw 1.0 lc rgb "#FDDAC7"
set style line 201 lw 1.0 lc rgb "#FDDAC7"
set style line 202 lw 1.0 lc rgb "#FE9D5D"
set style line 203 lw 1.0 lc rgb "#FEE97D"
set style line 204 lw 1.0 lc rgb "#BDBD58"
set style line 205 lw 1.0 lc rgb "#F3EACE"

set label 1 "1.500 km/s" at 20.00,0.14 tc rgb "#000000" front
set label 3 "2.000 km/s" at 20.00,0.58 tc rgb "#000000" front
set label 4 "3.000 km/s" at 20.00,1.23 tc rgb "#000000" front
set label 5 "4.500 km/s" at 20.00,2.30 tc rgb "#000000" front

set xlabel "Distance [km]"
set ylabel "Depth [km]"

set xrange [   0.000:  25.850]
set yrange [   3.000:   0.000]

set grid xtics ls 120, ls 121
set grid ytics ls 120, ls 121
set grid mxtics
set grid mytics
set mxtics 2
set mytics 2

plot "out.gdata" index 0 w filledcurves ls 200, \
     "" index 1 w filledcurves ls 201, \
     "" index 2 w filledcurves ls 202, \
     "" index 3 w filledcurves ls 203, \
     "" index 4 w filledcurves ls 204, \
     "" index 5 w l ls 100, \
     "" index 7 w l ls 100, \
     "" index 8 w l ls 100, \
     "" index 9 w l ls 100, \
     "" index 10 w l ls 100, \
     "" index 11 w l ls 102, \
     "" index 12 w l ls 102, \
     "" index 13 w l ls 102, \
     "" index 14 w l ls 102, \
     "" index 15 w l ls 102, \
     "" index 16 w l ls 102, \
     "" index 17 w l ls 102, \
     "" index 18 w l ls 102, \
     "" index 19 w l ls 102, \
     "" index 20 w l ls 102, \
     "" index 21 w l ls 102, \
     "" index 22 w l ls 102, \
     "" index 23 w l ls 102, \
     "" index 24 w l ls 102, \
     "" index 25 w l ls 102, \
     "" index 26 w l ls 102, \
     "" index 27 w l ls 102, \
     "" index 28 w l ls 102, \
     "" index 29 w l ls 102, \
     "" index 30 w l ls 102, \
     "" index 31 w l ls 102, \
     "" index 32 w l ls 102, \
     "" index 33 w l ls 102, \
     "" index 34 w l ls 102, \
     "" index 35 w l ls 102, \
     "" index 36 w l ls 102, \
     "" index 37 w l ls 102, \
     "" index 38 w l ls 102, \
     "" index 39 w l ls 102, \
     "" index 40 w l ls 102, \
     "" index 41 w l ls 102, \
     "" index 42 w l ls 102, \
     "" index 43 w l ls 102, \
     "" index 44 w l ls 102, \
     "" index 45 w l ls 102, \
     "" index 46 w l ls 102, \
     "" index 47 w l ls 102, \
     "" index 48 w l ls 102, \
     "" index 49 w l ls 102, \
     "" index 50 w l ls 102, \
     "" index 51 w l ls 102, \
     "" index 52 w l ls 102, \
     "" index 53 w l ls 102, \
     "" index 54 w l ls 102, \
     "" index 55 w l ls 102, \
     "" index 56 w l ls 102, \
     "" index 57 w l ls 102, \
     "" index 58 w l ls 102, \
     "" index 59 w l ls 102, \
     "" index 60 w l ls 102, \
     "" index 61 w l ls 102, \
     "" index 62 w l ls 102, \
     "" index 63 w l ls 102, \
     "" index 64 w l ls 102, \
     "" index 65 w l ls 102, \
     "" index 66 w l ls 102, \
     "" index 67 w l ls 102, \
     "" index 68 w l ls 102, \
     "" index 69 w l ls 102, \
     "" index 70 w l ls 102, \
     "" index 71 w l ls 102, \
     "" index 72 w l ls 102, \
     "" index 73 w l ls 102, \
     "" index 74 w l ls 102, \
     "" index 75 w l ls 102, \
     "" index 76 w l ls 102, \
     "" index 77 w l ls 102, \
     "" index 78 w l ls 102, \
     "" index 79 w l ls 102, \
     "" index 80 w l ls 102, \
     "" index 81 w l ls 102, \
     "" index 82 w l ls 102, \
     "" index 83 w l ls 102, \
     "" index 84 w l ls 102, \
     "" index 85 w l ls 102, \
     "" index 86 w l ls 102, \
     "" index 87 w l ls 102, \
     "" index 88 w l ls 102, \
     "" index 89 w l ls 102, \
     "" index 90 w l ls 102, \
     "" index 91 w l ls 102, \
     "" index 92 w l ls 102, \
     "" index 93 w l ls 102, \
     "" index 94 w l ls 102, \
     "" index 95 w l ls 102, \
     "" index 96 w l ls 102, \
     "" index 97 w l ls 102, \
     "" index 98 w l ls 102, \
     "" index 99 w l ls 102, \
     "" index 100 w l ls 102, \
     "" index 101 w l ls 102, \
     "" index 102 w l ls 102, \
     "" index 103 w l ls 102, \
     "" index 104 w l ls 102, \
     "" index 105 w l ls 102, \
     "" index 106 w l ls 102, \
     "" index 107 w l ls 102, \
     "" index 108 w l ls 102, \
     "" index 109 w l ls 102, \
     "" index 110 w l ls 102, \
     "" index 111 w l ls 102, \
     "" index 112 w l ls 102, \
     "" index 113 w l ls 102, \
     "" index 114 w l ls 102, \
     "" index 115 w l ls 102, \
     "" index 116 w l ls 102, \
     "" index 117 w l ls 102, \
     "" index 118 w l ls 102, \
     "" index 119 w l ls 102, \
     "" index 120 w l ls 102, \
     "" index 121 w l ls 102, \
     "" index 122 w l ls 102, \
     "" index 123 w l ls 102, \
     "" index 124 w l ls 102, \
     "" index 125 w l ls 102, \
     "" index 126 w l ls 102, \
     "" index 127 w l ls 102, \
     "" index 128 w l ls 102, \
     "" index 129 w l ls 102, \
     "" index 130 w l ls 102, \
     "" index 131 w l ls 102, \
     "" index 132 w l ls 102, \
     "" index 133 w l ls 102, \
     "" index 134 w l ls 102, \
     "" index 135 w l ls 102, \
     "" index 136 w l ls 102, \
     "" index 137 w l ls 102, \
     "" index 138 w l ls 102, \
     "" index 139 w l ls 102, \
     "" index 140 w l ls 102, \
     "" index 141 w l ls 102, \
     "" index 142 w l ls 102, \
     "" index 143 w l ls 102, \
     "" index 144 w l ls 102, \
     "" index 145 w l ls 102, \
     "" index 146 w l ls 102

set terminal svg size 531.5,283.5
set output "out.svg"

replot
