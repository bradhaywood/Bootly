#!/usr/bin/env perl
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.
use inc::Module::Install;

name 'Bootly';
all_from 'lib/Bootly.pm';

requires 'Catalyst::Runtime' => '5.90061';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Action::RenderView';
requires 'parent';
requires 'Config::General'; # This should reflect the config file format you've chosen
                 # See Catalyst::Plugin::ConfigLoader for supported formats
requires 'Catalyst::Plugin::Session::State::Cookie';
requires 'Catalyst::Plugin::Session::Store::FastMmap';
requires 'Catalyst::View::TT::Alloy';
requires 'Catalyst::View::JSON';
requires 'Catalyst::Model::DBIC::Schema';
requires 'DateTime';
requires 'DateTime::Format::SQLite';
requires 'Moose';
requires 'namespace::autoclean';
requires 'Plack';
requires 'MooseX::MarkAsMethods';
requires 'MooseX::NonMoose';

catalyst;

install_script glob('script/*.pl');
auto_install;
WriteAll;
