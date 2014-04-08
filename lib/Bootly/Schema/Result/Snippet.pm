use utf8;
package Bootly::Schema::Result::Snippet;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

Bootly::Schema::Result::Snippet

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

=head1 TABLE: C<snippets>

=cut

__PACKAGE__->table("snippets");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0

=head2 snippet_id

  data_type: 'varchar'
  is_nullable: 0

=head2 css

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 html

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=head2 javascript

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", is_auto_increment => 1, is_nullable => 0 },
  "snippet_id",
  { data_type => "varchar", is_nullable => 0 },
  "css",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "html",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
  "javascript",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</id>

=back

=cut

__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 css

Type: belongs_to

Related object: L<Bootly::Schema::Result::Css>

=cut

__PACKAGE__->belongs_to(
  "css",
  "Bootly::Schema::Result::Css",
  { id => "css" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 html

Type: belongs_to

Related object: L<Bootly::Schema::Result::Html>

=cut

__PACKAGE__->belongs_to(
  "html",
  "Bootly::Schema::Result::Html",
  { id => "html" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 javascript

Type: belongs_to

Related object: L<Bootly::Schema::Result::Javascript>

=cut

__PACKAGE__->belongs_to(
  "javascript",
  "Bootly::Schema::Result::Javascript",
  { id => "javascript" },
  {
    is_deferrable => 0,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07039 @ 2014-04-08 15:54:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:s+yJKFXfZp41CglXMh3Lew


# You can replace this text with custom code or comments, and it will be preserved on regeneration
1;
