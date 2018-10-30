/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module booleanTester_2 (
    input clk,
    input rst,
    input start,
    output reg [1:0] status
  );
  
  
  
  reg [3:0] M_counter_d, M_counter_q = 1'h0;
  
  localparam IDLE_state = 2'd0;
  localparam CASE_state = 2'd1;
  localparam CORRECT_state = 2'd2;
  localparam WRONG_state = 2'd3;
  
  reg [1:0] M_state_d, M_state_q = IDLE_state;
  
  wire [16-1:0] M_boo_out;
  reg [16-1:0] M_boo_a;
  reg [16-1:0] M_boo_b;
  reg [6-1:0] M_boo_alufn;
  boolean_10 boo (
    .a(M_boo_a),
    .b(M_boo_b),
    .alufn(M_boo_alufn),
    .out(M_boo_out)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_counter_d = M_counter_q;
    
    status = 1'h0;
    M_boo_a = 1'h0;
    M_boo_b = 1'h0;
    M_boo_alufn = 6'h00;
    if (start == 1'h0) begin
      M_state_d = IDLE_state;
    end
    
    case (M_state_q)
      IDLE_state: begin
        status = 1'h0;
        if (start == 1'h1) begin
          M_state_d = CASE_state;
        end
      end
      CASE_state: begin
        
        case (M_counter_q)
          1'h1: begin
            M_boo_alufn = 6'h18;
            M_boo_a = 16'h002a;
            M_boo_b = 16'h0018;
            if (M_boo_out != 16'h0008) begin
              M_state_d = WRONG_state;
            end
          end
          2'h2: begin
            M_boo_alufn = 6'h1e;
            M_boo_a = 16'h002a;
            M_boo_b = 16'h0018;
            if (M_boo_out != 16'h003a) begin
              M_state_d = WRONG_state;
            end
          end
          2'h3: begin
            M_boo_alufn = 6'h16;
            M_boo_a = 16'h002a;
            M_boo_b = 16'h0018;
            if (M_boo_out != 16'h0032) begin
              M_state_d = WRONG_state;
            end
          end
          3'h4: begin
            M_boo_alufn = 6'h1a;
            M_boo_a = 16'h002a;
            if (M_boo_out != 16'h002a) begin
              M_state_d = WRONG_state;
            end
          end
          3'h5: begin
            M_boo_alufn = 6'h18;
            M_boo_a = 16'h0000;
            M_boo_b = 16'h0000;
            if (M_boo_out != 16'h0000) begin
              M_state_d = WRONG_state;
            end
          end
          3'h7: begin
            M_boo_alufn = 6'h1e;
            M_boo_a = 16'h0000;
            M_boo_b = 16'h0000;
            if (M_boo_out != 16'h0000) begin
              M_state_d = WRONG_state;
            end
          end
          4'h8: begin
            M_boo_alufn = 6'h16;
            M_boo_a = 16'h0000;
            M_boo_b = 16'h0000;
            if (M_boo_out != 16'h0000) begin
              M_state_d = WRONG_state;
            end
          end
          4'h9: begin
            M_boo_alufn = 6'h1a;
            M_boo_a = 16'h0000;
            if (M_boo_out != 16'h0000) begin
              M_state_d = WRONG_state;
            end
          end
          4'ha: begin
            M_boo_alufn = 6'h18;
            M_boo_a = 16'hffff;
            M_boo_b = 16'hffff;
            if (M_boo_out != 16'hffff) begin
              M_state_d = WRONG_state;
            end
          end
          4'hb: begin
            M_boo_alufn = 6'h1e;
            M_boo_a = 16'hffff;
            M_boo_b = 16'hffff;
            if (M_boo_out != 16'hffff) begin
              M_state_d = WRONG_state;
            end
          end
          4'hc: begin
            M_boo_alufn = 6'h16;
            M_boo_a = 16'hffff;
            M_boo_b = 16'hffff;
            if (M_boo_out != 16'h0000) begin
              M_state_d = WRONG_state;
            end
          end
          4'hd: begin
            M_boo_alufn = 6'h1a;
            M_boo_a = 16'hffff;
            if (M_boo_out != 16'hffff) begin
              M_state_d = WRONG_state;
            end
          end
          4'he: begin
            M_state_d = CORRECT_state;
          end
        endcase
      end
      CORRECT_state: begin
        status = 1'h1;
      end
      WRONG_state: begin
        status = 2'h2;
      end
    endcase
    M_counter_d = M_counter_q + 1'h1;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_state_q <= 1'h0;
    end else begin
      M_state_q <= M_state_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_counter_q <= 1'h0;
    end else begin
      M_counter_q <= M_counter_d;
    end
  end
  
endmodule
