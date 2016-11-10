#!/usr/bin/perl
#

use v5.16;
use strict;


my $price =  25;
my $input =  13;
my $package_coef = 10.75;
my $tax = 0.05;

my $coef = 0.3;

#my $result = $ARGV[0];


for my $s ( 10000, 20000, 30000, 40000, 50000, 55000, 60000, 70000, 80000, 90000 ) {

    pr( $s );

}

my $title_printed;
sub pr {

    my $result = shift;

    my $result_services = $result * $coef;
    my $result_packages = $result - $result_services;

    my $num_packages_to_sold = int( $result_packages / $package_coef);


    if( 0 ) {
    say "          Result      Packages     Taxes";
    printf "%5s %10.2f%7s %6d %10.2f\n",          undef, $result_packages, "/${package_coef}=", $num_packages_to_sold,
            $num_packages_to_sold * $price * $tax;
    printf "%5s %10.2f%7s %6s %10.2f\n", '['.$coef.']', $result_services, undef, undef,  $result_services * $tax;
    say;

    say $num_packages_to_sold, ' per day(30):', $num_packages_to_sold, ' per hour(8):', $num_packages_to_sold / 30 / 8;
    say $num_packages_to_sold / 30 / 8 / 60;
    
    say;
    }

    my $result3 = $result; $result3 =~ s/(\d{1,3}?)(?=(\d{3})+$)/$1'/g; #$result3 .= '.00';
    my $result_services3 = $result_services; $result_services3 =~ s/(\d{1,3}?)(?=(\d{3})+$)/$1'/g; #$result_services3 .= '.00';
    my $result_packages3 = $result_packages; $result_packages3 =~ s/(\d{1,3}?)(?=(\d{3})+$)/$1'/g; #$result_packages3 .= '.00';

    my $pkg_turnover     = $num_packages_to_sold * $price;
   
    my $pkg_tax = $pkg_turnover * $tax;
    my $pkg_tax3 = int($pkg_tax);
                                         $pkg_tax3     =~ s/(\d{1,3}?)(?=(\d{3})+$)/$1'/g; #$pkg_turnover3 .= '.00';

    my $service_tax  = $result_services * $tax;
    my $service_tax3 = $service_tax;;
                                         $service_tax3     =~ s/(\d{1,3}?)(?=(\d{3})+$)/$1'/g; #$pkg_turnover3 .= '.00';

    my $pkg_turnover3     = $pkg_turnover;
                                         $pkg_turnover3     =~ s/(\d{1,3}?)(?=(\d{3})+$)/$1'/g; #$pkg_turnover3 .= '.00';
    my $pkg_turnover12_3  = $pkg_turnover * 12;
                                         $pkg_turnover12_3     =~ s/(\d{1,3}?)(?=(\d{3})+$)/$1'/g; #$pkg_turnover3 .= '.00';

    my $total_turnover    = $num_packages_to_sold * $price + $result_services;
    my $total_turnover12_3  = $total_turnover * 12;
          $total_turnover12_3  =~ s/(\d{1,3}?)(?=(\d{3})+$)/$1'/g; #$total_turnover12_3 .= '.00';

    my $total_turnover3 = $total_turnover;
                        $total_turnover3 =~ s/(\d{1,3}?)(?=(\d{3})+$)/$1'/g; #$total_turnover3 .= '.00';

    unless($title_printed) {
        say  "      Total =    Service    +  Pckgs  ;  NumP=/ 30/ 8/ 60 ;          Turnover[12]   =       Packages[12]  +   Srvs ;".
            "  Taxes:";
        $title_printed=1;
    }

    printf "%12s=[%.1f]:% 8s + %8s; %5d=%4d/%2d/%1.2f;". 
       "  %10s[%10s] =%9s[%9s] +%8s; %7s %7s", 

                            $result3, $coef, $result_services3, $result_packages3,
                $num_packages_to_sold,
                $num_packages_to_sold/30 ,
                $num_packages_to_sold/(30*8),
                $num_packages_to_sold/(30*8*60)
  
                ,$total_turnover3
                ,$total_turnover12_3
                ,$pkg_turnover3 
                ,$pkg_turnover12_3
                ,$result_services3

                ,$pkg_tax3
                ,$service_tax3

                ;

    say;
}


exit 0;
__END__

say "Sum packages:      $sum_packages";
#say "Sum services ($coef) $sum_services";

my $num_packages_to_sold = $sum_packages / $package_coef;
my $tax_on_packages = $num_packages_to_sold * $price * $tax;

say "Num packages to sold: ", $num_packages_to_sold;
say "Tax on packages: $tax_on_packages";

exit 0;

my $package_delta = $price -$input;
say "Income per package: ", $package_delta;

my $num_packages_to_sold = int ($sum_packages /  $package_delta );
say "Packages_to_sold: ", $num_packages_to_sold, " per day (30): ", $num_packages_to_sold / 30, " per hour (8): ", $num_packages_to_sold / ( 30 * 8 );

my $sum_to_buy = $price * $num_packages_to_sold;
say "Sum to buy packages:", $sum_to_buy;



