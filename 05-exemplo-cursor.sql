-- Exemplo 1
select c.nm_cidade, e.nm_estado, e.nm_regiao
  from loc_cidade c, loc_estado e
 where c.cd_estado = e.cd_estado;
 

set serveroutput on
declare
    cursor c_dados is
       select c.nm_cidade, e.nm_estado, e.nm_regiao
         from loc_cidade c, loc_estado e
        where c.cd_estado = e.cd_estado;
    
    v_dados     c_dados%rowtype;
begin
    open c_dados;
    loop
        fetch c_dados into v_dados;
        exit when c_dados%notfound;
        
        dbms_output.put_line (v_dados.nm_cidade || ' ' || 
                              v_dados.nm_estado || ' ' || 
                              v_dados.nm_regiao );
    end loop;
    close c_dados;
exception
    when others then
        dbms_output.put_line (sqlerrm);
end;



--------------------------------------------------------------------------
-- Exemplo 2

create table dados_cidade as select c.nm_cidade, e.nm_estado, e.nm_regiao
  from loc_cidade c, loc_estado e
 where c.cd_estado = e.cd_estado
   and 1=0;
   
select * from dados_cidade;



select * from dados_cidade;
TRUNCATE TABLE dados_cidade;

CREATE UNIQUE INDEX UK_DADOS_CIDADE ON DADOS_CIDADE (NM_CIDADE, NM_ESTADO, NM_REGIAO);

declare
    cursor c_cidade is
        select c.nm_cidade, e.nm_estado, e.nm_regiao
          from loc_cidade c, loc_estado e
         where c.cd_estado = e.cd_estado;

    v_cidade    c_cidade%rowtype;
    cont    number:=0;
begin
    open c_cidade;
    loop
        fetch c_cidade into v_cidade;
        exit when c_cidade%notfound;
            begin
                insert into dados_cidade (NM_CIDADE,NM_ESTADO,NM_REGIAO) 
                values (v_cidade.nm_cidade, v_cidade.nm_estado, v_cidade.nm_regiao);
            exception
                when dup_val_on_index then
                    dbms_output.put_line ('Chave duplicada.' || v_cidade.nm_cidade);
                when others then
                    dbms_output.put_line (v_cidade.nm_cidade || sqlerrm);                    
            end;
    /*if cont >1000 then
        commit;
        cont:=0;
    end if;
    cont := cont +1;*/
    end loop;
    close c_cidade;
    commit;
exception
    when others then
        dbms_output.put_line ('Erro ' || sqlerrm);
end;












