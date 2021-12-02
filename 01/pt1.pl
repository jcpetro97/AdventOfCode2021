#!/usr/bin/perl


my $filename = $ARGV[0];
my @data = ();
my $data = 0;
my $depthinc = 0;

print "filename is $filename\n";

open(IN,"$filename") || die "$filename can't be opened";

while (<IN>){
       chomp;
       push (@data,$_);
}
$data = @data;

print "data - $data\n";

for ($first=0; $first <= $data-1; $first++)
{
  if ($data[$first] < $data[$first+1])
  {
    $depthinc++;
  }
}

print "Depth increases $depthinc times\n";