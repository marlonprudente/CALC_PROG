library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rom is
	port( 
		clk		: in std_logic;
		endereco: in unsigned(7 downto 0);
		dado	: out unsigned(16 downto 0)
	);
end entity;

architecture a_rom of rom is
	type mem is array (0 to 127) of unsigned(16 downto 0);
	constant conteudo_rom : mem := (
		0  => "00000000000000000",--NOP (00000000)
		1  => "00010100000100000",--ADD A,B ==> A = A + B
		2  => "00100000000100000",--ADD A,C ==> A = A + C
		3  => "00100110000100000",--SUB n 	==> A = A - n (11010110)
		4  => "00110100000100000",--SUB B 	==> A = A - B 
		5  => "00100000010000010",--LD A,n 	==> A = n load n em A
		6  => "00100111100000011",--LD C,n 	==> C = n load n em C
		7  => "00100000010110010",--LD D,E 	==> D = E load C com o dado em E
		8  => "11111000000001010",--jump	==> Jump to address 20
		9  => "00000001100000000",--JP (IX)	==> PC = IX The data in IX is loaded into PC. Thus the address of the next instruction fetched is the data in IX.
		10 => "00001000000001100",--JR e 	==> PC = PC + e Adds a signed constant e to PC.
		
		others => (others=>'0')
	);
	
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			dado <= conteudo_rom(to_integer(endereco));
		end if;
	end process;
end architecture;

