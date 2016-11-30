#!/usr/bin/perl -w
##############################################################################

use strict;
use POSIX 'setsid';
my $WRITEPID=0;
my $PIDFILE;
if (@ARGV >= 1){
	if ($ARGV[0] eq "--pidfile" ){
		shift @ARGV;
		($PIDFILE)=shift @ARGV;
		$WRITEPID=1;
	}
}

sub daemonize {
   chdir '/'               or die "Can't chdir to /: $!";
   open STDIN, '/dev/null' or die "Can't read /dev/null: $!";
   open STDOUT, '>/dev/null'
						   or die "Can't write to /dev/null: $!";
   defined(my $pid = fork) or die "Can't fork: $!";
   if ($pid){
	if ($WRITEPID){
		open (F,">$PIDFILE")|| die($!);
		print F "$pid\n";
		close(F);
	}
	exit 0;
	}
   setsid                  or die "Can't start a new session: $!";
   open STDERR, '>&STDOUT' or die "Can't dup stdout: $!";
}

&daemonize(); 
exec(@ARGV);
