-- 1) Desenvolver um bloco PL/SQL que imprima os dados de clientes da tabela LOC_CLIENTE. Obs.: retornar somente clientes do tipo pessoa física.

declare
	cursor c_cliente is
		select *
		  from loc_cliente
		 where tp_cliente='F';
	
	v_cliente 	c_cliente%rowtype;
begin
	open c_cliente;
	loop
		fetch c_cliente into v_cliente;
		exit when c_cliente%notfound;
		dbms_output.put_line (v_cliente.nm_cliente || ' ' || v_cliente.tp_cliente);
	end loop;
	close c_cliente;
end;