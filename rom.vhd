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
	--OS OPCODE CONTÉM 8 BITS, OS DADOS 17 BITS
	constant conteudo_rom : mem := (
		0  => "00000000000000000",--NOP (00000000) 
		1  => "10000000000100000",--ADD A,B ==> A = A + B (10000000)
		2  => "10000001000100000",--ADD A,C ==> A = A + C (10000001)
		3  => "11010110000100000",--SUB n 	==> A = A - n (11010110)
		4  => "10010000000100000",--SUB B 	==> A = A - B (10010000)
		5  => "00111110010000010",--LD A,n 	==> A = n load n em A (00111110)
		6  => "00001110100000011",--LD C,n 	==> C = n load n em C (00001110)
		7  => "01010011010110010",--LD D,E 	==> D = E load C com o dado em E (01010011)
		8  => "11111111000001010",--jump	==> Jump to address 20 (11111111)
		9  => "00000000000000000",--xxxx	
		10 => "00000000000000000",--xxxx
		11 => "00000000000000000",
		12 => "00000000000000000",
		13 => "00000000000000000",
		14 => "00000000000000000",
		15 => "00000000000000000",
		16 => "00000000000000000",
		17 => "00000000000000000",
		18 => "00000000000000000",
		19 => "00000000000000000",
		20 => "00000000000000000",
		21 => "00000000000000000",
		22 => "00000000000000000",
		23 => "00000000000000000",
		24 => "00000000000000000",
		others => (others=>'0')--Insere 0's em casos omissos
	);
	
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
		--PERCORRE OS ENDEREÇOS DE CONTEUDO_ROM E RETORNA 17 BITS DE DADOS
			dado <= conteudo_rom(to_integer(endereco));
		end if;
	end process;
end architecture;

