#!/bin/bash

arrow_head="path 'M 0,0 l -30,-10 +10,+10 -10,+10 +30,-10 z'"
pointer="$arrow_head stroke-width 3 line 0,0, -100,0 "
xdateaxis="text 0,0 '10/1' text 200,0 '11/1' text 400,0 '12/1' \
           text 600,0 '12/31'"

# figure 1 -- Overall Hourly Availability
convert FNALViewHistoryParser2.jpg -pointsize 36 -crop 720x480+0+25 \
    -draw "text 90, 415 'Goal = 98%, Achieved = 98.8%'" \
    processed/1__Overall_Hourly_Availability.jpg

#figure 2 - performance tests
cp t1-performance-tests.jpg \
    processed/2__Performance_Tests.jpg


# figure 3 - site availability
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
    -draw "translate 0,125 text 400, 95 'FNAL'" \
    -strokewidth 10 \
    -draw "translate 0,125 translate 760,85 $arrow_head line 0,0 -240,0 line -660,0 -380,0 rotate 180 translate 660,0 $arrow_head" \
    processed/3__Site_Availability.png

# figure 4 - job robot rank
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
  processed/4__Job_Robot_Rank.png

# figure 5 - tape latency plots from CERN
convert -extent 720x604+0-100 tape_verified_delay_plot-90.jpg \
    -fill white -stroke white \
    -draw "rectangle 70,101 700,126" \
    -fill white -stroke white \
    -draw "rectangle 200,140 700,191" \
    -fill black -stroke black \
    -pointsize 32 \
    -draw " \
	text 220, 70 'Time to transfer files:' \
	text 240, 120 'Available at CERN' \
	text 200, 165 'to being on tape at FNAL'" \
    -strokewidth 1 \
    -fill red -stroke red \
    -draw "translate 0,362 stroke-width 3 line 70,0 700,0 stroke-width 1 text 100,-10 '12 Hour Goal'" \
    processed/5__Tape_Latency.png


# figure 6 - computing utilization
convert cms_farm_usgae.jpg \
    -fill lightblue -stroke lightblue \
    -pointsize 18 \
    -draw "translate 250, 0 text 250, 100 'LPC Analysis' text 280, 120 'Jobs'" \
    processed/6__Computing_Utilization.png

# figure 7 - queued jobs
cp cms_farm_usgae1.jpg \
    processed/7__Queued_Jobs.jpg

# figure 8a - processing share
convert processing-share.png \
    -fill \#ae8283 -stroke \#ae8283 \
    -fill \#118f2e -stroke \#118f2e \
    -pointsize 24 \
    -draw "translate 440,100 text 0, 0 'FNAL' translate -80,70 rotate 135 $pointer " \
    processed/8A__Processing_Share.png

#    -draw "translate 332,345 text 0, 0 'FNAL' translate -80,70 rotate 135 $pointer " \

# figure 8b - percent utilization wrt share
convert utilization_pledged.png \
    -fill \#521501 -stroke \#521501 \
    -pointsize 18 \
    -draw "translate 325,235 text -65, 10 'FNAL' translate -80,170 rotate 105 scale 1.5,1 $pointer " \
    -strokewidth 3 \
    -fill red -stroke red -strokewidth 5\
    -draw "translate 0, 445 line 100,0 718,0" \
    -strokewidth 1 \
    -draw "translate 500,370 text -90, -115 '100% utilization' translate -80,70 rotate 105 scale 1.75,1 $pointer " \
	processed/8B__Utilization_Pledged.png

# figure 9 - successful and failed jobs
cp siteActivity_individual.png \
    processed/9__Success_Failed_jobs.png

#figure 10 - dcache data rates
cp cms_dcache_transfers.jpg \
    processed/10__Dcache_Data_Rates.jpg

#figure 11 - bytes on tape
convert -extent 740x504 -crop 740x480+0-24 cms_bytes2.jpg \
    -fill white -stroke white \
    -draw "rectangle 70,401 720,504" \
    -fill black -stroke black \
    -pointsize 28 \
    -draw "translate 70,430 $xdateaxis" \
\
    -pointsize 24 \
    -draw "fill yellow stroke white text 200, 160 'Deleted/Squeezable'" \
    -draw "fill yellow stroke yellow text 200, 270 'Monte Carlo'" \
    -draw "text 200, 350 'Custodial Data'" \
    -pointsize 18 \
    -draw "text 200, 392 ' Legacy'" \
    -draw "fill magenta stroke magenta translate 500,255 text 0, 0 'Users'  scale .5,.5 translate 190,-80 rotate -30 $pointer " \
    processed/11__Bytes_On_Tape.png

# figure 12 - bytes on tape delta

#    -draw "translate 450,160 text 0, 0 'Additions'  scale 1,.75 translate 60, 20 rotate -90 $pointer " \

convert -extent 740x504 -crop 740x480+0-24 cms_bytes3.jpg \
    -fill white -stroke white \
    -draw "translate 0,20 rectangle 70,401 720,504" \
    -fill black -stroke black \
    -pointsize 28 \
    -draw "translate 0,20 translate 70,430 $xdateaxis" \
    -draw "translate 300,100 text 0, 0 'Additions'  scale 1,.75 translate 60, 20 rotate -90 " \
    -draw "translate 300,200 text 0, 0 'Deletions'  scale 1,.75 translate 60, -40 rotate 90 " \
    processed/12__Bytes_On_Tape_Delta.png

# take 2nd and 2nd to last points on y axis as 0 and 350.  Chop up
# as desired...

# figure 13 - bytes on tape since LHC start
convert ALL.jpg \
    \( custodial_tape_storage_pie.png -transparent white -crop 1000x700+0+50 -resize 250x  \) -geometry +80+40\
    -composite \
    -pointsize 28 -extent 740x540 \
\
    -fill white -stroke white \
    -draw "translate 0,70 rectangle 0,401 720,504" \
    -draw "translate 0,0 rectangle 0,0 88,500" \
    -draw "rectangle 0,0 740,30" \
\
    -fill black -stroke black \
    -draw "translate 10,85 \
	text 0,0 '11 PB' \
	text 0,58 '10 PB' \
	text 0,116 '9 PB' \
	text 0,174 '8 PB' \
	text 0,232 '7 PB' \
	text 0,290 '6 PB' \
        text 0,350 '5 PB' \
	" \
    -draw "translate 00,70 translate 70,430 \
    text 0,0 \"Sep '09\" \
    text 200,0 \"Jul '10\" \
    text 400,0 \"Jul '11\" \
    text 550,0 \"Dec '11\" " \
\
    -draw "text 400, 80 'Bytes on Tape'" \
    processed/13__Bytes_On_Tape_Since_LHC_Start.png

# figure 14a - disk at T1
convert diskActivityUsage-t1.jpg \
    processed/14A__Bytes_On_Disk_T1.png

# figure 14b - disk at T3
convert diskActivityUsage-t3.jpg \
    processed/14B__Bytes_on_Disk_T3.png

# figure 15 - data to FNAL (PhEDEx)
convert PhEDEx-cmlVolumeDestinFNAL.png \
    -pointsize 24 \
    -draw "translate 100, 100 text 0,0 'Data delivered from CMS to FNAL'" \
    -draw "translate 500, 200 text 0,0 'T0-CERN'" \
    processed/15__Phedex_to_FNAL.png

# figure 16 - data from FNAL (PhEDEx)
convert PhEDEx-cmlVolumeSourceFNAL.png \
    -pointsize 24 \
    -draw "translate 100, 100 text 0,0 'Data delivered to CMS from FNAL'" \
    processed/16__Phedex_from_FNAL.png

# figure 17a - node repair history
cp RepairHistory-stat-simple.jpg \
    processed/17A__Node_Repairs.jpg

# figure 17b - disk repair history
cp RepairHistory-disk-simple.jpg \
    processed/17B__Disk_Repairs.jpg


