mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
root-dir := $(dir $(mkfile_path))
	
incdir := \
$(root-dir).bender/git/checkouts/common_cells-972044434126250f/include \
$(root-dir).bender/git/checkouts/apb-fff2c1aa9fcf2539/include \
$(root-dir).bender/git/checkouts/axi_stream-0676e821aabb04ed/include \
$(root-dir).bender/git/checkouts/axi-748ea77f6eda1e7b/include \
$(root-dir).bender/git/checkouts/obi-b673daa527717722/include \
$(root-dir).bender/git/checkouts/register_interface-25e60bdb85519130/include \
$(root-dir).bender/git/checkouts/idma-bca94d2c15732af8/src/include \
$(root-dir).bender/git/checkouts/idma-bca94d2c15732af8/target/rtl/include \
$(root-dir)hw/reqrsp_interface/include \
$(root-dir)hw/mem_interface/include \
$(root-dir)hw/tcdm_interface/include \
$(root-dir)hw/snitch/include \
$(root-dir)hw/snitch_ssr/include


list_incdir := $(foreach dir, ${incdir}, +incdir+$(dir))

vcs:
	vcs -f $(root-dir)filelist -full64 -sverilog +lint=TFIPC-L +notimingcheck +v2k $(list_incdir) -debug_access -debug_region=cell+lib -lca -l vcs.log -top top_tb +libext+.v +libext+.sv -assert svaext -o ./work-vcs -fsdb -R     +define+TARGET_RTL \
    +define+TARGET_SIMULATION \
    +define+TARGET_SNITCH_CLUSTER \
    +define+TARGET_TEST \
    +define+TARGET_VCS \

verdi:
	verdi -assert svaext $(list_incdir) -2012 -sverilog -f $(root-dir)filelist -top top_tb -ssf wave.fsdb &
