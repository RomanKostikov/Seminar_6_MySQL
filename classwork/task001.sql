use seminar_6;
drop procedure fibo;
-- Вывести N чисел Фибоначи
DELIMITER //
CREATE PROCEDURE fibo (IN n int)
BEGIN
	declare n1 int default 0;
    declare n2 int default 1;
    declare temp int;
    declare res varchar(100) default '0 1';
    if (n = 1) then  
		select concat(n1);
	elseif (n = 2) then
		select concat(n1, " ", n2);
    else
		while n > 2 do
        set res = concat(res, " ", n2 + n1);
        set temp = n2;
        set n2 = n2 + n1;
        set n1 = temp;
        set n = n - 1;
        end while;
        select res;
    end if;
END //
DELIMITER ;

call fibo(10);

-- в виде фунцкии
drop FUNCTION fibo;
DELIMITER //
CREATE FUNCTION fibo (n int)
returns varchar(100)
deterministic
BEGIN
	declare n1 int default 0;
    declare n2 int default 1;
    declare temp int;
    declare res varchar(100) default '0 1';
    if (n = 1) then  
		return concat(n1);
	elseif (n = 2) then
		return concat(n1, " ", n2);
    else
		while n > 2 do
        set res = concat(res, " ", n2 + n1);
        set temp = n2;
        set n2 = n2 + n1;
        set n1 = temp;
        set n = n - 1;
        end while;
        return res;
    end if;
END //
DELIMITER ;

select fibo(8);