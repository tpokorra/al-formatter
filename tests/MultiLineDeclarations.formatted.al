page 50132 "Pamphlet Lookup"
{
    PageType = List;
    SourceTable = "Pamphlet/Newspaper";
    SourceTableTemporary = true;
    Editable = false;
    CaptionML =
        DEU = 'Broschüren',
        ENU = 'Pamphlets';
    Permissions =
        tabledata "Contact" = r,
        tabledata "Pamphlet" = r,
        tabledata "Pamphlet/Newspaper" = id;

    procedure HelloWorld();
    var RecNotTemporaryErr : TextConst
        DEU='Der Datensatz ist nicht temporär; es handelt sich um einen Programmierfehler.',
        ENU='The record is not temporary; this is related to a programming mistake.';
    begin
        Message('Hello World from the code unit!');
    end;
}