use strict;
use ExtUtils::MakeMaker;
use Config;

# $Id: Makefile.PL,v 1.9 2000/09/29 16:42:04 joern Exp $

my $SDK_DIR = '/usr/local/xaudiosdk';

$| = 1;

main: {
	# determine X-Audio SDK directory

	my $sdk_dir = get_sdk_directory();

	WriteRunsample();

	# determine additional libs for this platform
	my $add_libs = get_add_libs();

	# See lib/ExtUtils/MakeMaker.pm for details of how to influence
	# the contents of the Makefile that is written.

	WriteMakefile(
	    'NAME'	=> 'MPEG::MP3Play',
	    'VERSION_FROM' => 'MP3Play.pm',
	    'LIBS'	=> ["-L$sdk_dir/lib -lxaudio $add_libs"],
	    'DEFINE'	=> '',
	    'INC'	=> "-I$sdk_dir/include",
	    'MYEXTLIB'	=> 'conv_msg.o',
	    'depend'	=> { 'MP3Play.xs' => 'constants.h' },
	    'dist'	=> {
	    	'PREOP' => 'perl tools/genreadme > README'
	    }
	);
}

sub WriteRunsample {
	my $perlpath = $Config{perlpath};
	open (OUT, "> runsample");
	print OUT <<__EOF;
#!/bin/sh
$perlpath -w -Iblib/arch -Iblib/lib samples/\$1
__EOF
	close OUT;
	chmod 0755, "runsample";
}

sub get_sdk_directory {
	my $ok;
	my $sdk_dir = $SDK_DIR;

	do {
		print "Xaudio SDK directory [$sdk_dir] : ";
		my $input;
		chomp ($input = <STDIN>);
		$sdk_dir = $input if $input;
		$sdk_dir =~ s!/$!!;
		$ok = -d "$sdk_dir/include" and -d "$sdk_dir/lib";
		print "\nHmm, the directory must contain include and lib subdirectories.\n".
		      "Try again or press Ctrl+C to abort.\n\n"
			if not $ok;
	} while ( not $ok );

	return $sdk_dir;
}

sub get_add_libs {
	# on Irix -laudio is needed due to a bug in the Xaudio SDK
	if ( $Config{osname} =~ /irix/i ) {
		print "Irix detected! Adding '-laudio'.\n";
		return '-laudio';
	}
}
