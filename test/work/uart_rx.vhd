-- uart_rx.vhd: UART controller - receiving (RX) side
-- Author: Tomáš Lajda (xlajdat00)

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


-- Entity declaration (DO NOT ALTER THIS PART!)
entity UART_RX is 
    port(
        CLK      : in std_logic;
        RST      : in std_logic;
        DIN      : in std_logic;
        DOUT     : out std_logic_vector(7 downto 0);
        DOUT_VLD : out std_logic
    );
end entity;


-- Architecture implementation (INSERT YOUR IMPLEMENTATION HERE)
architecture behavioral of UART_RX is
    -- my signals
    signal cnt_c : std_logic_vector(4 downto 0);
    signal cnt_b : std_logic_vector(3 downto 0);
    signal start_e : std_logic;
    signal clock_e : std_logic;
    signal bits_e : std_logic;

begin
    -- Instance of RX FSM
    fsm: entity work.UART_RX_FSM
    port map (
        CLK => CLK,
        RST => RST,
        DIN => DIN,
        CNT_C => cnt_c,
        CNT_B => cnt_b,
        START_E => start_e,
        CLOCK_E => clock_e,
        BITS_E => bits_e,
        DOUT_VLD => DOUT_VLD
    );

    process (CLK,RST) begin
        if (RST = '1') then
            cnt_c <= "00000";
            cnt_b <= "0000";
            DOUT <= "00000000";
        elsif rising_edge(CLK) then
            -- increment clock counter
            if (clock_e = '1') then
                cnt_c <= cnt_c + 1;
            else
                cnt_c <= "00000";
            end if;
            
            -- reset bits counter
            if(bits_e = '0') then
                cnt_b <= "0000";
            end if;

            -- store received data
            if (bits_e = '1' and cnt_c = "10000") then
                case cnt_b is
                    when "0000" => DOUT(0) <= DIN;
                    when "0001" => DOUT(1) <= DIN;
                    when "0010" => DOUT(2) <= DIN;
                    when "0011" => DOUT(3) <= DIN;
                    when "0100" => DOUT(4) <= DIN;
                    when "0101" => DOUT(5) <= DIN;
                    when "0110" => DOUT(6) <= DIN;
                    when "0111" => DOUT(7) <= DIN;

                    when others => null;
                end case;
                    
                cnt_b <= cnt_b + 1;
            end if;

            -- reset clock counter
            if(cnt_c = "10000" or (start_e = '1' and cnt_c = "01000")) then
                cnt_c <= "00001";
            end if;

        end if;
    end process;

    end architecture;
