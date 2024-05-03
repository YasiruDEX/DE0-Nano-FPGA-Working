module switch_to_led (
    input [3:0] switches, // 4-bit input for switches
    output reg [3:0] leds // 4-bit output for LEDs
);

always @* begin
    leds = switches; // Assign the value of switches to leds directly
end

endmodule
