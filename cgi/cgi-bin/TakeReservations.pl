#!/usr/bin/perl
use warnings;
use CGI;
use DBI;
print "Content-Type: text/html\n\n";
#Getting values from the CGI Environment variable.
my $q = CGI::Vars();
my $dateOfAppointment = $q->{Date};
my $timeOfAppointment = $q->{Time};
my $Ailment_Issue = $q->{Description};
#remove trailing spaces u
$dateOfAppointment =~ s/^\s*(.*?)\s*$/$1/;
$timeOfAppointment =~ s/^\s*(.*?)\s*$/$1/;
$Ailment_Issue =~ s/^\s*(.*?)\s*$/$1/;
#Database operation using perl
my $driver = "mysql"; 
my $dbName = "appointmentPerldb";
my $dsn = "DBI:$driver:database=$dbName";
my $userName = "jasleensandhu13";
my $secret = "Groupfive497!";
#Connection to the database
my $dbh = DBI->connect($dsn, $userName, $secret ) or die $DBI::errstr;
#Insert records to the database;
my $sth = $dbh->prepare("INSERT INTO appointmentMaster
                       (appointment_date, appointment_time, description)
                        values
                       ('$dateOfAppointment', '$timeOfAppointment', '$Ailment_Issue')");
$sth->execute() or die $DBI::errstr;
$sth->finish();
# redirect to home page
print "<META HTTP-EQUIV=refresh CONTENT=\"1;URL=../index.html\">\n";

