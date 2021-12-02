#!/usr/bin/perl


my $filename = $ARGV[0];
my @data = ();
my $data = 0;
my @newdata = ();
my $newdata = 0;
my $depthinc = 0;
my $measurement = 0;

open(IN,"$filename") || die "$filename can't be opened";

while (<IN>){
       chomp;
       push (@data,$_);
}
$data = @data;

# push the sliding window data into array
for ($first=0; $first <= $data-3; $first++)
{
  $measurement = $data[$first] + $data[$first+1] + $data[$first+2];
  push (@newdata,$measurement);
}

# find the depth increases from the new sliding window array
$newdata = @newdata;
for ($second=0; $second <= $newdata-1; $second++)
{
  if ($newdata[$second] < $newdata[$second+1])
  {
    $depthinc++;
  }
}

print "Depth increases $depthinc times\n";