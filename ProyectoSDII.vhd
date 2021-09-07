  ----PROYECTO SISTEMAS DIGITALES----
	 ---integrantes: José Espinales, Jhony López-----
	           ----Paralelo 101---
Library ieee;
Use ieee.std_logic_1164.all;

Entity ProyectoSDII is
	PORT( Clock, Resetn,START, Sensor, Tecla, clave, error3, es1min, es30seg, es10min : in std_logic;
		Error, Puerta, Alarma, Llamada,EnReg1, EnReg2, EnReg3, EnReg4, EnCerror, EnC1min, EnC30seg, EnC10min, Resetn_error, Resetn_1min, Resetn_30seg, Resetn_10min, EncDec: out std_logic);
END ProyectoSDII;

Architecture resolucion of ProyectoSDII is
Type estado is (Ta,Tb,Tc,Td,Te,Tf,Tg,Th,Ti,Tj,Tk, Tl, Tn, Tq, Tp);
SIGNAL y:estado;
BEGIN
-----ESTADOS----
	process(clock,Resetn)
	BEGIN
		if Resetn='0' then y<=Ta;
  		elsif (clock'event and clock='1') then
			case y is
			
				when Ta=> 	if START='1' then y<=Tb;
								else y<=Ta;
								end if;
				when Tb=> 	if START='1' then y<=Tb;
								else y<=Tc;
								end if;
				when Tc=> 	if tecla='1' then y<=Td;
								else y<=Tc;
								end if;
				when Td=> 	if tecla='0' then y<=Te;
								else y<=Td;
								end if;
				when Te=> 	if tecla='1' then y<=Tf;
								else y<=Te;
								end if;
				when Tf=> 	if tecla='0' then y<=Tg;
								else y<=Tf;
								end if;
				when Tg=> 	if tecla='1' then y<=Th;
								else y<=Tg;
								end if;
				when Th=> 	if tecla='1' then y<=Th;
								else y<=Ti;
								end if;
				when Ti=> 	if tecla='1' then y<=Tj;
								else y<=Ti;
								end if;
				when Tj=> 	if tecla='1' then y<=Tj;
								else y<=Tk;
								end if;
				when Tk=> 	if clave='1' then y<=Tl;
								else y<=Tq;
								end if;
				when Tl=> 	if sensor='0' then y<=Tc;
								elsif sensor='1' and es30seg='0' then y<=Tl;
								else y<=Tn; end if;
				when Tn=> 	if es10min='1' then y<=Tl;
								else y<=Tn;
								end if;
				when Tq=> 	if error3='1' then y<=Tp;
								else y<=Tc;
								end if;
				when Tp=> 	if es1min='1' then y<=Tc;
								else y<=Tp;
								end if;
		  end case;
		end if;
	end process;
	
	----- SALIDAS-----
	 process(y)
	BEGIN
		Error<='0'; Puerta<='0'; Alarma<='0'; Llamada<='0'; EnReg1<='0'; EnReg2<='0'; EnReg3<='0'; EnReg4<='0'; EnCerror<='0';  EnC1min<='0'; EnC30seg<='0';  EnC10min<='0';  Resetn_error<='0'; Resetn_1min<='0'; Resetn_30seg<='0'; Resetn_10min<='0'; EncDec<='0';
			
			case y is
				when Ta=> 	
				when Tb=> 	
				when Tc=>	Resetn_1min<='1'; Resetn_10min<='1'; Resetn_30seg<='1'; 
								if tecla='1' then EnReg1<='1';
								end if;
				when Td=> 	if tecla='1' then EnReg1<='1';
								end if;
				when Te=> 	if tecla='1' then EnReg2<='1';
								end if;
				when Tf=> 	if tecla='1' then EnReg2<='1';
								end if;
				when Tg=> 	if tecla='1' then EnReg3<='1';
								end if;
				when Th=> 	if tecla='1' then EnReg3<='1';
								end if;
				when Ti=> 	if tecla='1' then EnReg4<='1';
								end if;
				when Tj=> 	if tecla='1' then EnReg4<='1';
								end if;
				when Tk=> 	if clave='1' then Puerta<='1';EnC30seg<='1';EncDec<='1';
								else Error<='1';EnCerror<='1';
								end if;
				when Tl=> 	EncDec<='1'; Resetn_10min<='1';Resetn_error<='1';
								if  sensor='1' and es30seg='0' then EnC30seg<='1';
								end if;
				when Tn=> 	EnC10min<='1'; EncDec<='1'; Resetn_30seg<='1';
								if es10min <='1' then  Alarma<='1'; Llamada<='1';
								end if;
				when Tq=> 	 
								if error3 ='1' then  Alarma<='1';EnC1min<='1';
								end if;
				when Tp=> 	Alarma<='1';EnC1min<='1';Resetn_error<='1';
								if es1min='0' then EnC1min<='1'; 
								end if;
		  end case;
   end process;
end resolucion;