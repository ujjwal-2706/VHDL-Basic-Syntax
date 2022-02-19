library IEEE;
use IEEE.std_logic_1164.all;

entity prac is
end prac;

architecture inside of prac is 
-- This region is called the declarative region of the vhdl file
-- if we want to introduce the new signal then we introduce them here
signal temp1 : std_logic_vector(7 downto 0) := (others => '0');
-- temp1 is a vector of bits, here using others will set all 8 bits value of 0
-- downto is used to use the indexing from 7 to 0
-- we also have another alternative
signal temp2 : std_logic_vector(0 to 7) := (others => '1');
-- this will create a signal with initial value of 11111111 where the indexing 
-- starts form 0 to 7

-- now if we want to represent a integer in terms of an unsigned or signed 
-- binary then we use the data types of signed and unsigned
signal sig: signed(7 downto 0) := (others => '0');
signal unsig: unsigned(7 downto 0) := (others => '1');
signal concurrent : unsigned(9 downto 0);
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
    -- but their results are only updated after their is some delay (delta delay)
    -- like in the case of wait statements
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

    -- This is how we define if-elsif-else statement
    if i < 10 then 
        report "i is less then 10";
    elsif i = 10 then
        report "i is 10";
    else
        report "let's forget about i";
    end if;
    wait;
end process;

process(i) is
    report "i is getting changed";
    -- here we have created a process using a sensivity list
    -- this will get triggered everytime i value is changed
    -- so in these kind of processes we don't need wait statements
    -- to pause our process
    
    -- inorder to access the bit of vector signals use temp1(i)
    for i in 7 downto 0 loop
        temp2(i) <= temp1(i);
    end loop;
end process;
    concurrent <= unsig & "00";
    -- this is a way to create a concurrent signal
    -- in vhdl a concurrent signal is the one without
    -- any process, and it is same as the the process
    -- with sensitivity list same as that of the right operands
end inside;