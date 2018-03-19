--1) Desenvolver um bloco PL/SQL que armazene o resultado do comando select abaixo e imprima os valores utilizando  dbms_output.

Comando: select user, sysdate from dual;

alter session set nls_date_format ='dd/mm/yy hh24:mi:ss'
set serveroutput on
declare
    v_usuario   varchar2(100);
    v_data      date;
begin
    select user, sysdate 
      into v_usuario, v_data
      from dual;
    dbms_output.put_line (v_usuario || ' ' || v_data);
end;




-- 2) Desenvolver um bloco PL/SQL que realize a sumarização da pontuação dos clientes existentes na tabela pf0064.cliente_erp.


declare
    v_valor number;
begin
    select sum(pontuacao) 
      into v_valor
      from pf0064.cliente_erp;
    dbms_output.put_line(v_valor);
end;




-- 3) Desenvolver um bloco PL/SQL que retorne a quantidade de caracteres ocupados pelos dados da tabela pf0064.cliente_erp.

declare
    v_qtd  number;
begin
    select sum(length(cd_cliente||nm_cliente||pontuacao)) 
      into v_qtd
      from pf0064.cliente_erp;
    
    dbms_output.put_line ('Qtd de caracteres =>' || v_qtd);
end;