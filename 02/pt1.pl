#!/usr/bin/perl


my $filename = $ARGV[0];
my $total = 0;
my @data;
my $data;
my $horizontal = 0;
my $depth = 0;

print "filename is $filename\n";

open(IN,"$filename") || die "$filename can't be opened";

while (<IN>){
  chomp;
  @data = split / /, $_;
  $data = @data;
  if ( $data[0] eq "forward" )
  {
    $horizontal = $horizontal + $data[1];
  }
  elsif ( $data[0] eq "down")
  {
    $depth = $depth + $data[1];

  }
  elsif ( $data[0] eq "up")
  {
    $depth = $depth - $data[1];
  }
}

$total = $depth * $horizontal;
print "total = $total\n";
