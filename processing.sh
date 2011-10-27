#!/bin/bash

if ((0)); then
# figure 1 -- fnal history parser
convert FNALViewHistoryParser2.jpg -pointsize 36 -crop 720x480+0+25 -draw "text 90, 415 'Goal = 98%, Achieved = 99.6%'" processed/Overall_Hourly_Availability.jpg

#figure 2 - performance tests
cp t1-performance-tests.jpg processed


# figure 3 - site availability
arrow_head="path 'M 0,0 l -30,-10 +10,+10 -10,+10 +30,-10 z'"
convert site-avail.png -extent 900x620 -pointsize 36 \
    -fill white -stroke white \
    -draw "rectangle 0,500 800,620" \
    -fill red -stroke red \
    -draw "text 75, 530 '0'" \
    -draw "text 205, 530 '20'" \
    -draw "text 345, 530 '40'" \
    -draw "text 485, 530 '60'" \
    -draw "text 625, 530 '80'" \
    -draw "text 745, 530 '100%'" \
    -pointsize 24 \
    -draw "text 665, 480 'Fail'" \
    -draw "text 725, 480 'Pass'" \
    -pointsize 36 \
    -strokewidth 3 \
    -draw "line 715,50 715,498" \
    -strokewidth 1 -fill yellow -stroke yellow \
    -draw "text 400, 95 'FNAL'" \
    -strokewidth 10 \
    -draw "translate 760,85 $arrow_head line 0,0 -240,0 line -660,0 -380,0 rotate 180 translate 660,0 $arrow_head" \
\
  processed/site-availability.png

# figure 4 - job robot rank

arrow_head="path 'M 0,0 l -30,-10 +10,+10 -10,+10 +30,-10 z'"
convert month-ranking-plot.png  -pointsize 36 -extent 900x500 \
    -fill white -stroke white \
    -draw "rectangle 0,388 800,500" \
    -fill red -stroke red \
    -draw "translate 0,-100 text 75, 530 '0' \
	text 205, 530 '20' \
	text 345, 530 '40' \
	text 485, 530 '60' \
	text 625, 530 '80' \
	text 745, 530 '100%'" \
    -pointsize 24 \
    -draw "text 665, 375 'Fail' text 725, 375 'Pass' stroke-width 3 line 715,50 715,385" \
    -pointsize 36 \
    -draw "\
	scale .975,.75 translate 0,70
	stroke-width 1 fill yellow stroke yellow \
	text 400, 95 'FNAL' \
	stroke-width 10
	translate 760,85 $arrow_head
	line 0,0 -240,0 line -660,0 -380,0
	rotate 180 translate 660,0 $arrow_head" \
\
  processed/job-robot.png

# figure 5 - tape latency plots from CERN

convert -extent 720x604+0-100 tape_verified_delay_plot-90.jpg \
    -fill white -stroke white \
    -draw "rectangle 70,101 700,126" \
    -fill white -stroke white \
    -draw "rectangle 200,140 700,191" \
    -fill black -stroke black \
    -pointsize 36 \
    -draw " \
	text 220, 70 'Time to transfer files:' \
	text 240, 120 'Available at CERN' \
	text 200, 165 'to being on tape at FNAL'" \
    -strokewidth 1 \
    -fill red -stroke red \
    -draw "translate 0,362 stroke-width 3 line 70,0 700,0 stroke-width 1 text 100,-10 '12 Hour Goal'" \
\
    processed/tape-latency.png

fi
# figure 6 - computing utilization
convert cms_farm_usgae.jpg \
    -fill lightblue -stroke lightblue \
    -pointsize 18 \
    -draw "translate 10, 0 text 250, 100 'LPC Analysis' text 280, 120 'Jobs'" \
    processed/computing-utilization.png

# figure 7 - queued jobs
convert cms_farm_usgae1.jpg \
    processed/queued-jobs.png




