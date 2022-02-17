library IEEE;
use IEEE.std_logic_1164.all;

entity prac is
end prac;

architecture inside of prac is 
process is
    -- this is where we initialize the variables
    -- for their assignment we use := and for signals we use <=
    variable i: integer := 0;
begin
    -- Use this to print in vhdl
    report "hello world";
    -- Use this to delay the signal timing
    wait for 10 ns;
    -- Once the processing is finished, it keeps on running in a loop
    -- thats why use wait; statement to pause it
    -- in case of signal assignments, these are though carried out sequentially
    -- but their results are only updated after the end of the loop
    -- so in order to really do sequential updatation we use variables
    
    --using this we go to an infinite loop and we have to break it internally
    loop 
        report "I'm in a loop";
        wait for 10 ns;
        if now >= 200 ns then
            exit;
        end if;
    end loop;
    -- now will give us the current time of program

    -- here for for loop we use this syntax
    -- integer'image(i) is used for conversion to string and & for concating
    for i in 1 to 10 loop
        report "i =" & integer'image(i);
    end loop;

    -- we already defined the variable at the top
    while i < 10 loop
        report "i=" & integer'image(i+1);
        wait for 10 ns;
        i := i + 1;
    end loop;
    wait;
end process;
end inside;