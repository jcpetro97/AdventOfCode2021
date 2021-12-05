#!/usr/bin/perl


my $filename = $ARGV[0];
my @data = ();
my $data = 0;
my @oxygen = ();
my $oxygen;
my @scrubber = ();
my $scrubber = @scrubber;
my $count0 = 0;
my $count1 = 0;
my @tmparray = ();
my $index = 0;
my $length = 0;
my $bit = 0;
#------------------------------------------------------------
open(IN,"$filename") || die "$filename can't be opened";
while (<IN>){
  chomp;
  push (@data,$_);
}
$data = @data;
@oxygen = @data;
$oxygen = @oxygen;
while ($oxygen > 1){
  $length = length($oxygen[0]);
# count the instnaces of 1's vs 0's in the $index column of the string
  if ($index <= $length-1){
    for ($x=0; $x <= $oxygen-1; $x++){
      $bit = substr($oxygen[$x],$index,1);
      if ($bit == 0){
        $count0++;
      }
      elsif($bit == 1){
        $count1++;
      }      
    }
    # Figure out oxygen generator rating
    for ($y=0; $y <= $oxygen-1; $y++){
      if ($count0 > $count1){
        $bit = substr($oxygen[$y],$index,1);
        if ($bit == 0){
          push(@tmparray,$oxygen[$y]);
        }
      }
      elsif ($count0 == $count1){
        $bit = substr($oxygen[$y],$index,1);
        if ($bit == 1){
          push(@tmparray,$oxygen[$y]);
        }
      }
      elsif ($count0 < $count1){
        $bit = substr($oxygen[$y],$index,1);
        if ($bit == 1){
          push(@tmparray,$oxygen[$y]);
        }
      
      }
    }
    @oxygen = @tmparray;
    @tmparray = ();
    $count0 = 0;
    $count1 = 0;
    $oxygen = @oxygen;
  }
  $index++;  
}

# figure out CO2 scrubber rating 
@scrubber = @data;
$scrubber = @scrubber;
$index=0;
while ($scrubber > 1){
  $length = length($scrubber[0]);
# count the instnaces of 1's vs 0's in the $index column of the string
  if ($index <= $length-1){
    for ($x=0; $x <= $scrubber-1; $x++){
      $bit = substr($scrubber[$x],$index,1);
      if ($bit == 0){
        $count0++;
      }
      elsif($bit == 1){
        $count1++;
      }      
    }
    # Figure out oxygen generator rating
    for ($y=0; $y <= $scrubber-1; $y++){
      if ($count0 < $count1){
        $bit = substr($scrubber[$y],$index,1);
        if ($bit == 0){
          push(@tmparray,$scrubber[$y]);
        }
      }
      elsif ($count0 == $count1){
        $bit = substr($scrubber[$y],$index,1);
        if ($bit == 0){
          push(@tmparray,$scrubber[$y]);
        }
      }
      elsif ($count0 > $count1){
        $bit = substr($scrubber[$y],$index,1);
        if ($bit == 1){
          push(@tmparray,$scrubber[$y]);
        }
      
      }
    }
    @scrubber = @tmparray;
    @tmparray = ();
    $count0 = 0;
    $count1 = 0;
    $scrubber = @scrubber;
  }
  $index++;  
}
my $oxdec = oct("0b".$oxygen[0]);
my $scrdec = oct("0b".$scrubber[0]);
my $total = ( $oxdec * $scrdec);
print "Oxygen Generator Rating is $oxygen[0] binary or $oxdec decimal\n";
print "CO2 scrubber rating is $scrubber[0] binary or $scrdec decimal\n";

print "life support rating is: $total\n";