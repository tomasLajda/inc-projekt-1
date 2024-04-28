-- uart_rx_fsm.vhd: UART controller - finite state machine controlling RX side
-- Author: Tomáš Lajda (xlajdat00)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



entity UART_RX_FSM is
    port(
        -- inputs
        CLK : in std_logic;
        RST : in std_logic;
        DIN : in std_logic;
        CNT_C : in std_logic_vector(4 downto 0);
        CNT_B : in std_logic_vector(3 downto 0);
        -- outputs
        START_E : out std_logic;
        CLOCK_E : out std_logic;
        BITS_E : out std_logic;
        DOUT_VLD : out std_logic
    );
end entity;



architecture behavioral of UART_RX_FSM is
    -- states
    type state_type is (WAIT_STATE, START_STATE, READ_STATE, STOP_STATE, SUCCESS_STATE);
    signal state : state_type;

    begin
        process(CLK, RST)
        begin
            if RST = '1' then
                state <= WAIT_STATE;
                CLOCK_E <= '0';
                BITS_E <= '0';
                START_E <= '0';
                DOUT_VLD <= '0';
            elsif rising_edge(CLK) then
                case state is
                    -- waits for start bit
                    when WAIT_STATE =>
                        DOUT_VLD <= '0';
                        if DIN = '0' then
                            state <= START_STATE;
                            START_E <= '1';
                            CLOCK_E <= '1';
                        end if;

                    -- waits for start bit to end
                    when START_STATE =>
                        if CNT_C = "01000" then
                            state <= READ_STATE;
                            START_E <= '0';
                            BITS_E <= '1';
                        end if;

                    -- reads data bits
                    when READ_STATE =>
                        if CNT_B = "1000" then
                            state <= STOP_STATE;
                            BITS_E <= '0';
                        end if;

                    -- waits for stop bit
                    when STOP_STATE =>
                        if CNT_C = "10000" and DIN = '1' then
                            state <= SUCCESS_STATE;
                            CLOCK_E <= '0';
                        elsif CNT_C = "10000" and DIN = '0' then
                            state <= WAIT_STATE;
                        end if;

                    -- signalizes successful read
                    when SUCCESS_STATE =>
                        CLOCK_E <= '0';
                        DOUT_VLD <= '1';
                        state <= WAIT_STATE;

                    when others => null;
                end case;
            end if;
        end process;

end architecture;
