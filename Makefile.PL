use ExtUtils::MakeMaker;
WriteMakefile(
	NAME          => 'Acme::Intercal',
	AUTHOR        => 'Dmitry Karasik <dmitry@karasik.eu.org>',
	ABSTRACT_FROM => 'Intercal.pm',
	VERSION_FROM  => 'Intercal.pm',
	PREREQ_PM     => { 'Keyword::Pluggable'  => 0 },
);
