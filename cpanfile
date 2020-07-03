# cpanfile
on runtime => sub {
    requires 'Moo';
    requires 'Moose';
    requires 'Types::Standard';
};

on test => sub {
    requires 'Test2::V0';
};
