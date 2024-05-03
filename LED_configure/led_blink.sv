module led_blink (
    input logic clk,
    output logic [7:0] leds
);

    logic [25:0] counter = 0;
    logic [2:0] position = 3'b000;
    logic direction = 0;
	 logic toggle_it = 0;

    always_ff @(posedge clk) begin
        counter <= counter + 1'b1;
        if (counter == 1_000_000) begin
            counter <= '0 ;
            if (direction == 0) begin
					 if (toggle_it == 0) begin
						position <= position + 1'b1;
					 end	
                if (position == 3'b111 && toggle_it == 1) begin
                    direction <= 1;
						  toggle_it <= 0;
                end
					 if (position == 3'b110) begin
                    toggle_it <= 1;
                end
            end else begin
                if (toggle_it == 0) begin
						position <= position - 1'b1;
					 end
                if (position == 3'b000 && toggle_it == 1) begin
                    direction <= 0;
						  toggle_it <= 0;
                end
					 if (position == 3'b001) begin
                    toggle_it <= 1;
                end
            end
        end
    end

    always_comb begin
        leds = (1 << position);
    end
endmodule
