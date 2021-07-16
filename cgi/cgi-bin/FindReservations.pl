#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use DBI;
use JSON;
my @output;
my $cgi = CGI->new;
#accept data as parameter
my $valueCheck = $cgi->param('data_search'); 
my $driver = "mysql"; 
my $dbName = "appointmentPerldb";
my $dsn = "DBI:$driver:database=$dbName";
my $userName = "jasleensandhu13";
my $secret = "Groupfive497!";
my $dbh = DBI->connect($dsn, $userName, $secret ) or die $DBI::errstr;
#SQL query to find search all the records from the dbName which matches string(id)
my $sqlc = "SELECT appointment_date, appointment_time, description FROM appointmentMaster where description like '%".$valueCheck."%'"; 
my $sth = $dbh->prepare($sqlc);
$sth->execute;
while ( my $row = $sth->fetchrow_hashref ){
    push @output, $row;
}
my $cgi = CGI->new;
print $cgi->header( 'application/json' );
#print objToJson( { myData => \@output } );
print objToJson(  \@output  );
