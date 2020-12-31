codeunit 50149 MyLibrary
{
    procedure HelloWorld();
    begin
        if test then
            Message('Hello World from the code unit!');
    end;

    procedure HelloWorld2(test: Boolean);
    begin
        if not test then
            Message('Hello World from the code unit!');
    end;

    procedure HelloWorld3(test: Boolean);
    begin
        if not(test) then
            Message('Hello World from the code unit!');
    end;

    procedure HelloWorld4(test: Boolean);
    begin
        if not (test) then
            Message('Hello World from the code unit!');
    end;

    procedure HelloWorld5(test: Boolean; test2: Boolean);
    begin
        if (test) and (test2) then
            Message('Hello World from the code unit!');
    end;
}