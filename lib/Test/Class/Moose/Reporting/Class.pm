package Test::Class::Moose::Reporting::Class;

use Moose;
use Carp;
use namespace::autoclean;

our $VERSION = 0.02;

with qw(
  Test::Class::Moose::Role::Reporting
);

has test_methods => (
    is      => 'rw',
    traits  => ['Array'],
    isa     => 'ArrayRef[Test::Class::Moose::Reporting::Method]',
    default => sub { [] },
    handles => {
        all_test_methods => 'elements',
        add_test_method  => 'push',
        num_test_methods => 'count',
    },
);

has 'error' => (
    is        => 'rw',
    isa       => 'Str',
    predicate => 'has_error',
);

__PACKAGE__->meta->make_immutable;

1;


__END__

=head1 NAME

Test::Class::Moose::Reporting::class - Reporting on test classes

=head1 VERSION

0.02

=head1 DESCRIPTION

Should be considered experimental and B<read only>.

=head1 IMPLEMENTS

C<Test::Class::Moose::Role::Reporting>.

=head1 ATTRIBUTES

=head2 C<test_methods>

Returns an array reference of L<Test::Class::Moose::Reporting::Method>
objects.

=head2 C<error>

If this class could not be run, returns a string explaining the error.

=head2 C<has_error>

Returns a boolean indicating whether or not the class has an error.
