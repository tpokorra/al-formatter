codeunit 50149 MyLibrary
{
    procedure HelloWorld();
    begin
        Message('Hello World from the code unit!');
    end;

    procedure HelloWorld2(test: Boolean);
    begin
        if test then begin
            Message('Hello World from the code unit!');
        end;
    end;

    procedure HelloWorld3(test: Boolean);
    begin
        if test then
        begin
            Message('Hello World from the code unit!');
        end;
    end;

    procedure HelloWorld4(test: Boolean);
    begin
        if test then
            begin
                Message('Hello World from the code unit!');
            end;
    end;

    procedure HelloWorld5(test: Boolean);
    begin
        if test then
            Message('Hello World from the code unit!');
    end;
}