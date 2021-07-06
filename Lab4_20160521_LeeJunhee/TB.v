`timescale 1ns / 1ps

module TB();

///////////////////////////////////////

parameter NUM_DATA = 1000;
parameter CLK_FREQ = 100;

reg rst;
reg clk;

reg [3:0] din_a;
reg [3:0] din_b;
reg [3:0] din_c;
reg       din_valid;

wire [8:0] dout_a;
wire       dout_valid;

reg [3:0] golden_din_a   [0:NUM_DATA-1];
reg [3:0] golden_din_b   [0:NUM_DATA-1];
reg [3:0] golden_din_c   [0:NUM_DATA-1];
reg [8:0] golden_dout_a  [0:NUM_DATA-1];

reg [8:0] receive_dout_a [0:NUM_DATA-1];

integer err_cnt;

///////////////////////////////////////

initial begin
  clk = 0;
  #1;
  forever begin
    clk = #((1000/CLK_FREQ)/2) ~clk;
  end
end

///////////////////////////////////////

MAC u_MAC (
  .clk        ( clk        ),
  .rst        ( rst        ),
  
  .din_a      ( din_a      ),
  .din_b      ( din_b      ),
  .din_c      ( din_c      ),
  .din_valid  ( din_valid  ),

  .dout_a     ( dout_a     ),
  .dout_valid ( dout_valid )
);

///////////////////////////////////////

task generate_data ();
begin : task_0
  integer i;

  $display("Generate Data");
  
  for ( i=0 ; i<NUM_DATA ; i=i+1 ) begin

    golden_din_a[i] = $random;
    golden_din_b[i] = $random;
    golden_din_c[i] = $random;

    golden_dout_a[i] = golden_din_a[i] * golden_din_b[i] + golden_din_c[i];

  end
end
endtask

task transmit_data ();
begin : task_1
  integer i;

  $display("Transmit Data");
  
  din_a     = 0;
  din_b     = 0;
  din_c     = 0;
  din_valid = 0;

  repeat(10) @(posedge clk);
  #1;
 
  for ( i=0 ; i<NUM_DATA ; i=i+1 ) begin

    if (i%10 > 5) begin
      @(posedge clk);
      #1;
    end

    din_a     = golden_din_a[i];
    din_b     = golden_din_b[i];
    din_c     = golden_din_c[i];
    din_valid = 1;

    @(posedge clk);
    #1;

    din_valid = 0;

  end
end
endtask

task receive_data ();
begin : task_2
  integer i;
 
  $display("Receive Data");

  @(posedge clk);
  #1;

  for ( i=0 ; i<NUM_DATA ; i=i+1 ) begin

    wait(dout_valid)
    #1;
 
    receive_dout_a[i] = dout_a;

    @(posedge clk);
    #1;

  end
end
endtask

task err_check ();
begin : task_3
  integer i;

  $display("Error Check");
  
  err_cnt = 0;

  for ( i=0 ; i<NUM_DATA ; i=i+1 ) begin

    if(golden_dout_a[i]==receive_dout_a[i])
      err_cnt = err_cnt; 
    else
      err_cnt = err_cnt + 1; 

  end

  $display("Error Count: %d", err_cnt);

  if (err_cnt==0)
    $display("Successfuly completed");
  else 
    $display("Failed");

end
endtask


///////////////////////////////////////

initial begin

  // for iverilog waveform
  $dumpfile("myfile.dmp");
  $dumpvars;

  din_a     = 0;
  din_b     = 0;
  din_c     = 0;
  din_valid = 0;

  rst = 1;
  repeat(100) @(posedge clk);
  #1;
  rst = 0;     

  // ------------------------

  generate_data ();
  #1000;

  transmit_data ();
  #1000;

  err_check ();
  #1000;

  $finish; 
end

initial begin
  receive_data ();
end

endmodule
