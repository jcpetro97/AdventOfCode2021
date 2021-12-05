#!/usr/bin/perl


my $filename = $ARGV[0];
my @data;
my $data;
my @gamma;
my $gamma = @gamma;
my @epsilon;
my $epsilon = @epsilon;
# Common Values - 0 and 1 - used to calculate gamma
my @count0;
my $count0 = @count0;
my @count1;
my $count1 = @count1;
my $total;

open(IN,"$filename") || die "$filename can't be opened";

while (<IN>){
  chomp;
  @data = split //, $_;
  $data = @data;
  for ($x=0; $x <= $data-1; $x++)
  {
    if ($data[$x] == 0)
    {
      if ($count0[$x] eq "")
      {
        $count0[$x] = 1;
      }
      else 
      {
        $count0[$x]++;
      }

    }
    else
    {
      
      if ($count1[$x] eq "")
      {
        $count1[$x] = 1;
      }
      else 
      {
        $count1[$x]++;
      }

    }
  }
}
  $count0 = @count0;
  $count1 = @count1;
  for ($y=0; $y <= $count0-1; $y++)
  {

    if ($count0[$y] > $count1[$y])
    {
      $gamma[$y] = 0;
      $epsilon[$y] = 1;
    }
    elsif ($count1[$y] > $count0[$y])
    {
      $gamma[$y] = 1;
      $epsilon[$y] = 0;
    }
  }
$gamma = @gamma;
my $gambin = join('', @gamma);
my $epsbin = join('', @epsilon);
my $gamdec = oct("0b".$gambin);
my $epsdec = oct("0b".$epsbin);
$total = ( $gamdec * $epsdec);
print "Power Consumption is $total\n";