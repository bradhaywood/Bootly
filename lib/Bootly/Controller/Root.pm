package Bootly::Controller::Root;

use strict;
use warnings;
use parent 'Catalyst::Controller';
use DateTime;

__PACKAGE__->config->{namespace} = '';

=head1 NAME

Bootly::Controller::Root - Root Controller for Bootly

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut

sub auto :Private {
    my ($self, $c) = @_;
    my $snippet_rs = $c->model('BootlyDB::Snippet');
    my $recent_rs  = $snippet_rs->search_rs(
        undef,
        { order_by => { -desc => 'created' }, rows => 5 }
    );
    
    if ($recent_rs->count > 0) { $c->stash(recent => [ $recent_rs->all ]); }
    1;
}

=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    my $params = $c->req->body_params;

    if ($params->{html} or $params->{css} or $params->{js}) {
        my $snippet_rs = $c->model('BootlyDB::Snippet');
        if ($params->{saveaction} and $params->{saveaction} eq 'save') {
            my $snippet_id = $params->{snippet_id};
            if ($snippet_id) {
                if (my $snippet = $snippet_rs->find({ snippet_id => $snippet_id })) {
                    my $html = $snippet->html;
                    my $css  = $snippet->css;
                    my $js   = $snippet->javascript;
                    
                    $html->update({ code => $params->{html} });
                    $css->update({ code => $params->{css} });
                    $js->update({ code => $params->{js} });

                    $c->stash->{success_msg} = "Successfully updated snippet";
                    $c->res->redirect("/" . $params->{snippet_id});
                    $c->detach;
                }
            }
        }
        else {
            my $html    = $c->model('BootlyDB::Html')->create({ code => $params->{html} });
            my $css     = $c->model('BootlyDB::Css')->create({ code => $params->{css} });
            my $js      = $c->model('BootlyDB::Javascript')->create({ code => $params->{js} });
            my $id;
            my @chars = ('a'..'z', '0'..'9', 'A'..'Z');
            $id .= $chars[rand($#chars)] for (0..8);
            my $snippet = $snippet_rs->create({
              snippet_id => $id,
              html       => $html->id,
              javascript => $js->id,
              css        => $css->id,
              created    => DateTime->now,
            });
            
            my $uri = $c->req->uri . "${id}";
            $c->flash->{success_msg} = "Successfully created snippet ${uri}";
            $c->res->redirect($uri);
            $c->detach;
        }
    }
}

sub preview :Local :Args(1) {
    my ($self, $c, $snippet_id) = @_;
    my $snippet_rs = $c->model('BootlyDB::Snippet');
    if (my $snippet = $snippet_rs->find({ snippet_id => $snippet_id })) {
        $c->stash->{wrapper} = 'blank.html';
        $c->stash->{snippet} = $snippet;
        $c->detach;
    }

    $c->res->redirect('/');
    $c->detach;
}

sub view :Local :Args(2) {
  my ($self, $c, $snippet_id, $size) = @_;
  
  my ($width, $height) = split 'x', $size
    unless $size eq 'full'; 
  
  $c->stash(
    wrapper    => 'blank.html',
    snippet_id => $snippet_id,
    height     => $height,
    width      => $width, 
  );
  
  $c->detach;
}

sub default :Path {
    my ( $self, $c ) = @_;
    my $id = $c->req->path;
    if (my $snippet = $c->model('BootlyDB::Snippet')->find({ snippet_id => $id })) {
        $c->stash(
            snippet => $snippet,
        );
    }
    else {
      $c->res->redirect('/');
      $c->detach;
    }
    
    $c->stash->{template} = 'index.html';
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Brad,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
__END__
