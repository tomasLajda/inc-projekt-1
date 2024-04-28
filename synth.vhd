library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity UART_RX is
  port (
    CLK: in std_logic;
    RST: in std_logic;
    DIN: in std_logic;
    DOUT: out std_logic_vector (7 downto 0);
    DOUT_VLD: out std_logic
  );
end entity;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity uart_rx_fsm is
  port (
    clk : in std_logic;
    rst : in std_logic;
    din : in std_logic;
    cnt_c : in std_logic_vector (4 downto 0);
    cnt_b : in std_logic_vector (3 downto 0);
    start_e : out std_logic;
    clock_e : out std_logic;
    bits_e : out std_logic;
    dout_vld : out std_logic);
end entity uart_rx_fsm;

architecture rtl of uart_rx_fsm is
  signal state : std_logic_vector (2 downto 0);
  signal n85_o : std_logic;
  signal n86_o : std_logic;
  signal n88_o : std_logic;
  signal n90_o : std_logic;
  signal n92_o : std_logic_vector (2 downto 0);
  signal n94_o : std_logic;
  signal n96_o : std_logic;
  signal n98_o : std_logic;
  signal n100_o : std_logic;
  signal n102_o : std_logic_vector (2 downto 0);
  signal n104_o : std_logic;
  signal n106_o : std_logic;
  signal n108_o : std_logic;
  signal n110_o : std_logic_vector (2 downto 0);
  signal n112_o : std_logic;
  signal n114_o : std_logic;
  signal n115_o : std_logic;
  signal n117_o : std_logic;
  signal n118_o : std_logic;
  signal n119_o : std_logic;
  signal n121_o : std_logic_vector (2 downto 0);
  signal n123_o : std_logic;
  signal n125_o : std_logic_vector (2 downto 0);
  signal n127_o : std_logic;
  signal n129_o : std_logic;
  signal n130_o : std_logic_vector (4 downto 0);
  signal n131_o : std_logic;
  signal n133_o : std_logic;
  signal n134_o : std_logic;
  signal n137_o : std_logic;
  signal n139_o : std_logic_vector (2 downto 0);
  signal n156_q : std_logic;
  signal n157_q : std_logic;
  signal n158_q : std_logic;
  signal n159_q : std_logic;
  signal n160_q : std_logic_vector (2 downto 0);
begin
  start_e <= n156_q;
  clock_e <= n157_q;
  bits_e <= n158_q;
  dout_vld <= n159_q;
  -- uart_rx_fsm.vhd:31:12
  state <= n160_q; -- (signal)
  -- uart_rx_fsm.vhd:42:19
  n85_o <= '1' when rising_edge (clk) else '0';
  -- uart_rx_fsm.vhd:47:32
  n86_o <= not din;
  -- uart_rx_fsm.vhd:47:25
  n88_o <= n156_q when n86_o = '0' else '1';
  -- uart_rx_fsm.vhd:47:25
  n90_o <= n157_q when n86_o = '0' else '1';
  -- uart_rx_fsm.vhd:47:25
  n92_o <= state when n86_o = '0' else "001";
  -- uart_rx_fsm.vhd:45:21
  n94_o <= '1' when state = "000" else '0';
  -- uart_rx_fsm.vhd:55:34
  n96_o <= '1' when cnt_c = "01000" else '0';
  -- uart_rx_fsm.vhd:55:25
  n98_o <= n156_q when n96_o = '0' else '0';
  -- uart_rx_fsm.vhd:55:25
  n100_o <= n158_q when n96_o = '0' else '1';
  -- uart_rx_fsm.vhd:55:25
  n102_o <= state when n96_o = '0' else "010";
  -- uart_rx_fsm.vhd:54:21
  n104_o <= '1' when state = "001" else '0';
  -- uart_rx_fsm.vhd:63:34
  n106_o <= '1' when cnt_b = "1000" else '0';
  -- uart_rx_fsm.vhd:63:25
  n108_o <= n158_q when n106_o = '0' else '0';
  -- uart_rx_fsm.vhd:63:25
  n110_o <= state when n106_o = '0' else "011";
  -- uart_rx_fsm.vhd:62:21
  n112_o <= '1' when state = "010" else '0';
  -- uart_rx_fsm.vhd:70:34
  n114_o <= '1' when cnt_c = "10000" else '0';
  -- uart_rx_fsm.vhd:70:44
  n115_o <= n114_o and din;
  -- uart_rx_fsm.vhd:73:37
  n117_o <= '1' when cnt_c = "10000" else '0';
  -- uart_rx_fsm.vhd:73:55
  n118_o <= not din;
  -- uart_rx_fsm.vhd:73:47
  n119_o <= n117_o and n118_o;
  -- uart_rx_fsm.vhd:73:25
  n121_o <= state when n119_o = '0' else "000";
  -- uart_rx_fsm.vhd:70:25
  n123_o <= n157_q when n115_o = '0' else '0';
  -- uart_rx_fsm.vhd:70:25
  n125_o <= n121_o when n115_o = '0' else "100";
  -- uart_rx_fsm.vhd:69:21
  n127_o <= '1' when state = "011" else '0';
  -- uart_rx_fsm.vhd:78:21
  n129_o <= '1' when state = "100" else '0';
  n130_o <= n129_o & n127_o & n112_o & n104_o & n94_o;
  -- uart_rx_fsm.vhd:43:17
  with n130_o select n131_o <=
    n156_q when "10000",
    n156_q when "01000",
    n156_q when "00100",
    n98_o when "00010",
    n88_o when "00001",
    n156_q when others;
  -- uart_rx_fsm.vhd:43:17
  with n130_o select n133_o <=
    '0' when "10000",
    n123_o when "01000",
    n157_q when "00100",
    n157_q when "00010",
    n90_o when "00001",
    n157_q when others;
  -- uart_rx_fsm.vhd:43:17
  with n130_o select n134_o <=
    n158_q when "10000",
    n158_q when "01000",
    n108_o when "00100",
    n100_o when "00010",
    n158_q when "00001",
    n158_q when others;
  -- uart_rx_fsm.vhd:43:17
  with n130_o select n137_o <=
    '1' when "10000",
    n159_q when "01000",
    n159_q when "00100",
    n159_q when "00010",
    '0' when "00001",
    n159_q when others;
  -- uart_rx_fsm.vhd:43:17
  with n130_o select n139_o <=
    "000" when "10000",
    n125_o when "01000",
    n110_o when "00100",
    n102_o when "00010",
    n92_o when "00001",
    state when others;
  -- uart_rx_fsm.vhd:42:13
  process (clk, rst)
  begin
    if rst = '1' then
      n156_q <= '0';
    elsif rising_edge (clk) then
      n156_q <= n131_o;
    end if;
  end process;
  -- uart_rx_fsm.vhd:42:13
  process (clk, rst)
  begin
    if rst = '1' then
      n157_q <= '0';
    elsif rising_edge (clk) then
      n157_q <= n133_o;
    end if;
  end process;
  -- uart_rx_fsm.vhd:42:13
  process (clk, rst)
  begin
    if rst = '1' then
      n158_q <= '0';
    elsif rising_edge (clk) then
      n158_q <= n134_o;
    end if;
  end process;
  -- uart_rx_fsm.vhd:42:13
  process (clk, rst)
  begin
    if rst = '1' then
      n159_q <= '0';
    elsif rising_edge (clk) then
      n159_q <= n137_o;
    end if;
  end process;
  -- uart_rx_fsm.vhd:42:13
  process (clk, rst)
  begin
    if rst = '1' then
      n160_q <= "000";
    elsif rising_edge (clk) then
      n160_q <= n139_o;
    end if;
  end process;
end rtl;


library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

architecture rtl of uart_rx is
  signal wrap_CLK: std_logic;
  signal wrap_RST: std_logic;
  signal wrap_DIN: std_logic;
  subtype typwrap_DOUT is std_logic_vector (7 downto 0);
  signal wrap_DOUT: typwrap_DOUT;
  signal wrap_DOUT_VLD: std_logic;
  signal cnt_c : std_logic_vector (4 downto 0);
  signal cnt_b : std_logic_vector (3 downto 0);
  signal start_e : std_logic;
  signal clock_e : std_logic;
  signal bits_e : std_logic;
  signal fsm_start_e : std_logic;
  signal fsm_clock_e : std_logic;
  signal fsm_bits_e : std_logic;
  signal fsm_dout_vld : std_logic;
  signal n8_o : std_logic;
  signal n10_o : std_logic_vector (4 downto 0);
  signal n12_o : std_logic_vector (4 downto 0);
  signal n13_o : std_logic;
  signal n15_o : std_logic_vector (3 downto 0);
  signal n17_o : std_logic;
  signal n18_o : std_logic;
  signal n20_o : std_logic;
  signal n22_o : std_logic;
  signal n24_o : std_logic;
  signal n26_o : std_logic;
  signal n28_o : std_logic;
  signal n30_o : std_logic;
  signal n32_o : std_logic;
  signal n34_o : std_logic;
  signal n35_o : std_logic_vector (7 downto 0);
  signal n36_o : std_logic;
  signal n37_o : std_logic;
  signal n38_o : std_logic;
  signal n39_o : std_logic;
  signal n40_o : std_logic;
  signal n41_o : std_logic;
  signal n42_o : std_logic;
  signal n43_o : std_logic;
  signal n44_o : std_logic;
  signal n45_o : std_logic;
  signal n46_o : std_logic;
  signal n47_o : std_logic;
  signal n48_o : std_logic;
  signal n49_o : std_logic;
  signal n50_o : std_logic;
  signal n51_o : std_logic;
  signal n53_o : std_logic_vector (3 downto 0);
  signal n54_o : std_logic_vector (7 downto 0);
  signal n56_o : std_logic_vector (3 downto 0);
  signal n58_o : std_logic;
  signal n60_o : std_logic;
  signal n61_o : std_logic;
  signal n62_o : std_logic;
  signal n64_o : std_logic_vector (4 downto 0);
  signal n75_o : std_logic_vector (7 downto 0);
  signal n76_q : std_logic_vector (7 downto 0);
  signal n77_q : std_logic_vector (4 downto 0);
  signal n78_q : std_logic_vector (3 downto 0);
begin
  wrap_clk <= clk;
  wrap_rst <= rst;
  wrap_din <= din;
  dout <= wrap_dout;
  dout_vld <= wrap_dout_vld;
  wrap_DOUT <= n76_q;
  wrap_DOUT_VLD <= fsm_dout_vld;
  -- uart_rx.vhd:24:12
  cnt_c <= n77_q; -- (signal)
  -- uart_rx.vhd:25:12
  cnt_b <= n78_q; -- (signal)
  -- uart_rx.vhd:26:12
  start_e <= fsm_start_e; -- (signal)
  -- uart_rx.vhd:27:12
  clock_e <= fsm_clock_e; -- (signal)
  -- uart_rx.vhd:28:12
  bits_e <= fsm_bits_e; -- (signal)
  -- uart_rx.vhd:32:5
  fsm : entity work.uart_rx_fsm port map (
    clk => wrap_CLK,
    rst => wrap_RST,
    din => wrap_DIN,
    cnt_c => cnt_c,
    cnt_b => cnt_b,
    start_e => fsm_start_e,
    clock_e => fsm_clock_e,
    bits_e => fsm_bits_e,
    dout_vld => fsm_dout_vld);
  -- uart_rx.vhd:50:15
  n8_o <= '1' when rising_edge (wrap_CLK) else '0';
  -- uart_rx.vhd:53:32
  n10_o <= std_logic_vector (unsigned (cnt_c) + unsigned'("00001"));
  -- uart_rx.vhd:52:13
  n12_o <= "00000" when clock_e = '0' else n10_o;
  -- uart_rx.vhd:59:23
  n13_o <= not bits_e;
  -- uart_rx.vhd:59:13
  n15_o <= cnt_b when n13_o = '0' else "0000";
  -- uart_rx.vhd:64:40
  n17_o <= '1' when cnt_c = "10000" else '0';
  -- uart_rx.vhd:64:30
  n18_o <= bits_e and n17_o;
  -- uart_rx.vhd:66:21
  n20_o <= '1' when cnt_b = "0000" else '0';
  -- uart_rx.vhd:67:21
  n22_o <= '1' when cnt_b = "0001" else '0';
  -- uart_rx.vhd:68:21
  n24_o <= '1' when cnt_b = "0010" else '0';
  -- uart_rx.vhd:69:21
  n26_o <= '1' when cnt_b = "0011" else '0';
  -- uart_rx.vhd:70:21
  n28_o <= '1' when cnt_b = "0100" else '0';
  -- uart_rx.vhd:71:21
  n30_o <= '1' when cnt_b = "0101" else '0';
  -- uart_rx.vhd:72:21
  n32_o <= '1' when cnt_b = "0110" else '0';
  -- uart_rx.vhd:73:21
  n34_o <= '1' when cnt_b = "0111" else '0';
  n35_o <= n34_o & n32_o & n30_o & n28_o & n26_o & n24_o & n22_o & n20_o;
  n36_o <= n76_q (0);
  -- uart_rx.vhd:65:17
  with n35_o select n37_o <=
    n36_o when "10000000",
    n36_o when "01000000",
    n36_o when "00100000",
    n36_o when "00010000",
    n36_o when "00001000",
    n36_o when "00000100",
    n36_o when "00000010",
    wrap_DIN when "00000001",
    n36_o when others;
  n38_o <= n76_q (1);
  -- uart_rx.vhd:65:17
  with n35_o select n39_o <=
    n38_o when "10000000",
    n38_o when "01000000",
    n38_o when "00100000",
    n38_o when "00010000",
    n38_o when "00001000",
    n38_o when "00000100",
    wrap_DIN when "00000010",
    n38_o when "00000001",
    n38_o when others;
  n40_o <= n76_q (2);
  -- uart_rx.vhd:65:17
  with n35_o select n41_o <=
    n40_o when "10000000",
    n40_o when "01000000",
    n40_o when "00100000",
    n40_o when "00010000",
    n40_o when "00001000",
    wrap_DIN when "00000100",
    n40_o when "00000010",
    n40_o when "00000001",
    n40_o when others;
  n42_o <= n76_q (3);
  -- uart_rx.vhd:65:17
  with n35_o select n43_o <=
    n42_o when "10000000",
    n42_o when "01000000",
    n42_o when "00100000",
    n42_o when "00010000",
    wrap_DIN when "00001000",
    n42_o when "00000100",
    n42_o when "00000010",
    n42_o when "00000001",
    n42_o when others;
  n44_o <= n76_q (4);
  -- uart_rx.vhd:65:17
  with n35_o select n45_o <=
    n44_o when "10000000",
    n44_o when "01000000",
    n44_o when "00100000",
    wrap_DIN when "00010000",
    n44_o when "00001000",
    n44_o when "00000100",
    n44_o when "00000010",
    n44_o when "00000001",
    n44_o when others;
  n46_o <= n76_q (5);
  -- uart_rx.vhd:65:17
  with n35_o select n47_o <=
    n46_o when "10000000",
    n46_o when "01000000",
    wrap_DIN when "00100000",
    n46_o when "00010000",
    n46_o when "00001000",
    n46_o when "00000100",
    n46_o when "00000010",
    n46_o when "00000001",
    n46_o when others;
  n48_o <= n76_q (6);
  -- uart_rx.vhd:65:17
  with n35_o select n49_o <=
    n48_o when "10000000",
    wrap_DIN when "01000000",
    n48_o when "00100000",
    n48_o when "00010000",
    n48_o when "00001000",
    n48_o when "00000100",
    n48_o when "00000010",
    n48_o when "00000001",
    n48_o when others;
  n50_o <= n76_q (7);
  -- uart_rx.vhd:65:17
  with n35_o select n51_o <=
    wrap_DIN when "10000000",
    n50_o when "01000000",
    n50_o when "00100000",
    n50_o when "00010000",
    n50_o when "00001000",
    n50_o when "00000100",
    n50_o when "00000010",
    n50_o when "00000001",
    n50_o when others;
  -- uart_rx.vhd:78:32
  n53_o <= std_logic_vector (unsigned (cnt_b) + unsigned'("0001"));
  n54_o <= n51_o & n49_o & n47_o & n45_o & n43_o & n41_o & n39_o & n37_o;
  -- uart_rx.vhd:64:13
  n56_o <= n15_o when n18_o = '0' else n53_o;
  -- uart_rx.vhd:82:22
  n58_o <= '1' when cnt_c = "10000" else '0';
  -- uart_rx.vhd:82:60
  n60_o <= '1' when cnt_c = "01000" else '0';
  -- uart_rx.vhd:82:50
  n61_o <= start_e and n60_o;
  -- uart_rx.vhd:82:32
  n62_o <= n58_o or n61_o;
  -- uart_rx.vhd:82:13
  n64_o <= n12_o when n62_o = '0' else "00001";
  -- uart_rx.vhd:64:30
  n75_o <= n76_q when n18_o = '0' else n54_o;
  -- uart_rx.vhd:50:9
  process (wrap_CLK, wrap_RST)
  begin
    if wrap_RST = '1' then
      n76_q <= "00000000";
    elsif rising_edge (wrap_CLK) then
      n76_q <= n75_o;
    end if;
  end process;
  -- uart_rx.vhd:50:9
  process (wrap_CLK, wrap_RST)
  begin
    if wrap_RST = '1' then
      n77_q <= "00000";
    elsif rising_edge (wrap_CLK) then
      n77_q <= n64_o;
    end if;
  end process;
  -- uart_rx.vhd:50:9
  process (wrap_CLK, wrap_RST)
  begin
    if wrap_RST = '1' then
      n78_q <= "0000";
    elsif rising_edge (wrap_CLK) then
      n78_q <= n56_o;
    end if;
  end process;
end rtl;
