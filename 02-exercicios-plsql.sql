set serveroutput on;

-- 1) Desenvolver um bloco PL/SQL que exiba o nome e a idade armazenados em variáveis.

declare
    v_nome varchar2(100);
    v_idade number := 10;
begin
    v_nome:='Aula PL';
    dbms_output.put_line(v_nome || ' ' || v_idade);
end;

-- 2) Desenvolver um bloco PL/SQL que receba 5 valores e armazene a média dos 5 valores. Armazenar somente números inteiros.

declare
    v_n1 number := 10;
    v_n2 number := 10;
    v_n3 number := 10;
    v_n4 number := 8.4;
    v_n5 number := 9.3;
    v_media number := 0;
begin
    v_media := trunc((v_n1 + v_n2 + v_n3 + v_n4 + v_n5)/5);
    --v_media := (v_n1 + v_n2 + v_n3 + v_n4 + v_n5)/5;
    --v_media := round((v_n1 + v_n2 + v_n3 + v_n4 + v_n5)/5);
    dbms_output.put_line(v_media);
end;


-- 3) Desenvolver um bloco PL/SQL que receba o nome completo e armazene somente o primeiro nome.

accept NomeCompleto prompt "Mensagem personalizada"
set scan on
declare
    v_nomecompleto varchar2(100):='&NomeCompleto';
begin
    dbms_output.put_line(substr(v_nomecompleto,1,instr(v_nomecompleto,' ')-1));
end;


select instr('aaaa bbbb',' ') from dual;

select substr('aaaa bbbb cccc',6,4) from dual;

select substr('aaaa bbbb cccc',1,instr('aaaa bbbb cccc',' ')) from dual;


select * from dual;



-- 4) Desenvolver um bloco PL/SQL que receba um nome completo em letras minúsculas e imprima todos os nomes com a primeira letra em maiúsculo.



declare
    v_nome_completo varchar2(100):='aaa bbb cccc';
begin
    dbms_output.put_line (initcap(v_nome_completo));
end;



-- 5) Desenvolver um bloco PL/SQL que receba uma data no formato 'dd/mm/yyyy' e imprima o dia da semana.

declare
    v_data date := to_date('01/01/2018','dd/mm/yyyy');
begin
    dbms_output.put_line (to_char(v_data,'dd mm yy d day'));
end;