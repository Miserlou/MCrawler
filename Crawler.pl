#!/usr/bin/perl

# start a daemon that crawls all feeds in the database.
use strict;
use warnings;

BEGIN
{
    use FindBin;
    use lib "$FindBin::Bin/lib";
}

use MCrawler;

sub main
{
    my $crawler = MCrawler->new();
    
    $crawler->start_server();
    $crawler->processes(3);
    $crawler->throttle(1);
    $crawler->sleep_interval(10);

    $| = 1;

    $crawler->crawl();
}

main();
