use utf8;
package Bootly::Schema::Result::Javascript;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Bootly::Schema::Result::Javascript

=cut

use strict;
use warnings;

use base 'DBIx::Class::Core';

=head1 COMPONENTS LOADED

=over 4

=item * L<DBIx::Class::InflateColumn::DateTime>

=back

=cut

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 TABLE: C<javascript>

=cut

__PACKAGE__->table("javascript");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 code

  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "code",
  { data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 snippets

Type: has_many

Related object: L<Bootly::Schema::Result::Snippet>

=cut

__PACKAGE__->has_many(
  "snippets",
  "Bootly::Schema::Result::Snippet",
  { "foreign.javascript" => "self.id" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-04-07 22:26:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rKRB6UC7NxTH8LKEUkKDRA


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
