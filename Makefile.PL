require 5.008;
use threads (); # just to force breakage if threads are not available
use Module::Metadata;
use ExtUtils::MakeMaker;

WriteMakefile (
	NAME		=> "Thread::Status",
	AUTHOR		=> 'Elizabeth Mattijsen (liz@dijkmat.nl)',
	ABSTRACT	=> 'report stack status of all running threads',
	VERSION_FROM	=> 'lib/Thread/Status.pm',
	LICENSE		=> 'perl_5',
	CONFIGURE_REQUIRES => {
                'ExtUtils::MakeMaker' => '0',
                'Module::Metadata' => '1.000033',
                'threads' => '0'
        },
        BUILD_REQUIRES => {
                'Test::More' => '0',
		'threads' => '0',
		'threads::shared' => '0'
        },
	PREREQ_PM	=> {
		'Thread::Signal' => '1.07',
		'load' => 0,
	},
        dist  => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
        clean => { FILES => 'Thread-Status-*' },
        META_MERGE => {
                'meta-spec' => { version => 2 },
                resources => {
                        repository => {
                                type => 'git',
                                url  => 'https://github.com/ThisUsedToBeAnEmail/Thread-Status.git',
                                web  => 'https://github.com/ThisUsedToBeAnEmail/Thread-Status',
                        }
                }
        },
        META_ADD => {
                provides => Module::Metadata->provides(version => '2', dir => 'lib')
        }
);
