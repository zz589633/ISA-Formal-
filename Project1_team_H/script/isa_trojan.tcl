clear -all
check_cov -init -type all

analyze -sv [glob ./Project1_team_H/src/trojan/RV12/ahb3lite_pkg/*.sv]
analyze -sv [glob ./Project1_team_H/src/trojan/RV12/rtl/verilog/pkg/*.sv]
analyze -sv [glob ./Project1_team_H/src/trojan/RV12/memory/*.sv]
analyze -sv [glob ./Project1_team_H/src/trojan/RV12/rtl/verilog/core/ex/*.sv]
analyze -sv [glob ./Project1_team_H/src/trojan/RV12/rtl/verilog/core/memory/*.sv]
analyze -sv [glob ./Project1_team_H/src/trojan/RV12/rtl/verilog/core/cache/*.sv]
analyze -sv [glob ./Project1_team_H/src/trojan/RV12/rtl/verilog/core/*.sv]
analyze -sv [glob ./Project1_team_H/src/trojan/RV12/rtl/verilog/ahb3lite/*.sv]
analyze -sv [glob ./Project1_team_H/prop/isa.sva]


elaborate -top riscv_top_ahb3lite\
          -bbox_mul 64

clock HCLK
reset ~HRESETn

stopat dmem_ctrl_inst.mem_err_o
stopat core.du_unit.du_ie
stopat core.dbg_stall
assume {core.dbg_stall==1'b0}

stopat core.if_unit.active_parcel
stopat core.if_unit.pd_instr

assume {core.if_unit.pd_instr==formaltest_RV12.pd_instr}
set_prove_time_limit 259200s


assume -env {core.if_unit.pd_exception==16'd0}
assume -env {core.if_unit.if_exception==16'd0}
assume -env {core.id_unit.id_exception==16'd0}
assume -env {core.ex_units.ex_exception==16'd0}
assume -env {core.mem_unit.mem_exception==16'd0}
assume -env {core.wb_unit.wb_exception_o==16'd0}


set_engine_mode {Hp Ht B N AM K U Tri}



prove -all 