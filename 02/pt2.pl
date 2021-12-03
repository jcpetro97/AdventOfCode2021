#!/usr/bin/perl


my $filename = $ARGV[0];
my $total = 0;
my @data;
my $data;
my $horizontal = 0;
my $depth = 0;
my $aim = 0;

print "filename is $filename\n";

open(IN,"$filename") || die "$filename can't be opened";

while (<IN>){
  chomp;
  @data = split / /, $_;
  $data = @data;
  if ( $data[0] eq "forward" )
  {
    $horizontal = $horizontal + $data[1];
    $depth = $depth + ($aim * $data[1]);
    print "horizontal = $horizontal.  depth = $depth\n";
  }
  elsif ( $data[0] eq "down")
  {
    $aim = $aim + $data[1];
    print "aim = $aim\n";
  }
  elsif ( $data[0] eq "up")
  {
    $aim = $aim - $data[1];
    print "aim = $aim\n";
  }
}

$total = $depth * $horizontal;
print "total = $total\n";
