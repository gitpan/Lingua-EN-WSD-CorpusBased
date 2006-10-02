#!perl -w 

use Test::More tests => 7;
BEGIN { use_ok('Lingua::EN::WSD::CorpusBased'); };
BEGIN { use_ok('WordNet::QueryData'); }

my $wn = WordNet::QueryData->new;

ok($wn, 'Creation of WordNet::QueryData object');

my $corpus = Lingua::EN::WSD::CorpusBased::Corpus->new('wnref' => $wn,
						       'corpus' => '_democorpus_');
$corpus->init;
ok($corpus, 'Creation of Lingua::EN::WSD::CorpusBased::Corpus object');

ok(join('',@{$corpus->line(1)}) eq 'helloworld', 'Access-test of Corpus object');

my $wsd = Lingua::EN::WSD::CorpusBased->new('cref' => $corpus,
					    'wnref' => $wn);
ok($wsd, 'Creation of Lingua::EN::WSD::CorpusBased object');
ok(join('',@{$wsd->wsd('e-mail application')}) eq 'application#n#3', 'Test run of WSD system');
