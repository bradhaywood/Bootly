use strict;
use warnings;
use lib 'lib';
use Plack::Builder;
use Bootly;

builder {
    enable 'BufferedStreaming';
    Bootly->apply_default_middlewares(Bootly->psgi_app);
};

