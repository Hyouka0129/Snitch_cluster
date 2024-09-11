sidCmdLineBehaviorAnalysisOpt -incr -clockSkew 0 -loopUnroll 0 -bboxEmptyModule 0  -cellModel 0 -bboxIgnoreProtected 0 
debImport "-assert" "svaext" \
          "+incdir+/home/hyouka/project/snitch/.bender/git/checkouts/common_cells-972044434126250f/include" \
          "+incdir+/home/hyouka/project/snitch/.bender/git/checkouts/apb-fff2c1aa9fcf2539/include" \
          "+incdir+/home/hyouka/project/snitch/.bender/git/checkouts/axi_stream-0676e821aabb04ed/include" \
          "+incdir+/home/hyouka/project/snitch/.bender/git/checkouts/axi-748ea77f6eda1e7b/include" \
          "+incdir+/home/hyouka/project/snitch/.bender/git/checkouts/obi-b673daa527717722/include" \
          "+incdir+/home/hyouka/project/snitch/.bender/git/checkouts/register_interface-25e60bdb85519130/include" \
          "+incdir+/home/hyouka/project/snitch/.bender/git/checkouts/idma-bca94d2c15732af8/src/include" \
          "+incdir+/home/hyouka/project/snitch/.bender/git/checkouts/idma-bca94d2c15732af8/target/rtl/include" \
          "+incdir+/home/hyouka/project/snitch/hw/reqrsp_interface/include" \
          "+incdir+/home/hyouka/project/snitch/hw/mem_interface/include" \
          "+incdir+/home/hyouka/project/snitch/hw/tcdm_interface/include" \
          "+incdir+/home/hyouka/project/snitch/hw/snitch/include" \
          "+incdir+/home/hyouka/project/snitch/hw/snitch_ssr/include" "-2012" \
          "-sverilog" "-f" "/home/hyouka/project/snitch/filelist" "-top" \
          "top_tb"
debLoadSimResult /home/hyouka/project/snitch/wave.fsdb
wvCreateWindow
srcHBSelect "top_tb.dut" -win $_nTrace1
srcSetScope -win $_nTrace1 "top_tb.dut" -delim "."
srcHBSelect "top_tb.dut" -win $_nTrace1
srcHBSelect "top_tb.dut.i_snitch_cluster" -win $_nTrace1
srcSetScope -win $_nTrace1 "top_tb.dut.i_snitch_cluster" -delim "."
srcHBSelect "top_tb.dut.i_snitch_cluster" -win $_nTrace1
srcHBSelect "top_tb.dut.i_snitch_cluster.i_cluster" -win $_nTrace1
srcSetScope -win $_nTrace1 "top_tb.dut.i_snitch_cluster.i_cluster" -delim "."
srcHBSelect "top_tb.dut.i_snitch_cluster.i_cluster" -win $_nTrace1
srcHBSelect "\$root" -win $_nTrace1
srcHBSelect "top_tb" -win $_nTrace1
srcSetScope -win $_nTrace1 "top_tb" -delim "."
srcHBSelect "top_tb" -win $_nTrace1
srcHBSelect "top_tb" -win $_nTrace1
srcHBSelect "top_tb.dut" -win $_nTrace1
srcSetScope -win $_nTrace1 "top_tb.dut" -delim "."
srcHBSelect "top_tb.dut" -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "narrow_out_req" -line 38 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 2.524069
wvZoomAll -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "wide_out_resp" -line 41 -pos 1 -win $_nTrace1
srcDeselectAll -win $_nTrace1
srcSelect -signal "narrow_out_req" -line 61 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
srcDeselectAll -win $_nTrace1
srcSelect -signal "wide_out_req" -line 76 -pos 1 -win $_nTrace1
srcAddSelectedToWave -clipboard -win $_nTrace1
wvDrop -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvExpandBus -win $_nWave2 {("G1" 3)}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvExpandBus -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvScrollDown -win $_nWave2 2
wvScrollUp -win $_nWave2 2
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvCollapseBus -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvExpandBus -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvScrollDown -win $_nWave2 2
wvScrollUp -win $_nWave2 1
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvCollapseBus -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSetPosition -win $_nWave2 {("G1" 6)}
wvExpandBus -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 15)}
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSelectSignal -win $_nWave2 {( "G1" 6 )} 
wvSetPosition -win $_nWave2 {("G1" 6)}
wvCollapseBus -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 6)}
wvSetPosition -win $_nWave2 {("G1" 11)}
wvSelectSignal -win $_nWave2 {( "G1" 5 )} 
wvSelectSignal -win $_nWave2 {( "G1" 4 )} 
wvSetPosition -win $_nWave2 {("G1" 4)}
wvExpandBus -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 23)}
wvScrollDown -win $_nWave2 8
