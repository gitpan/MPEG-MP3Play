use strict;
use ExtUtils::MakeMaker;

my $SDK_DIR = '/usr/local/xaudiosdk';

$| = 1;

main: {
	# determine X-Audio SDK directory

	my $sdk_dir = get_sdk_directory();

	# See lib/ExtUtils/MakeMaker.pm for details of how to influence
	# the contents of the Makefile that is written.

	WriteMakefile(
	    'NAME'	=> 'MPEG::MP3Play',
	    'VERSION_FROM' => 'MP3Play.pm',
	    'LIBS'	=> ["-L$sdk_dir/lib -lxaudio"],
	    'DEFINE'	=> '',
	    'INC'	=> "-I$sdk_dir/include",
	    'MYEXTLIB'	=> 'conv_msg.o',
	);
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
