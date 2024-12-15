unit module FederalDocuments;


role Document {
    has $.number;
    has $!valid = False;
    has @!weight-masc-first-digit;
    has @!weight-masc-second-digit;
    has @!digits;

    method is-valid() {
        $!valid
    }

    method verify {
        $!valid = False;

        return if $!number.chars > @!weight-masc-second-digit.elems + 1;

        my $total-len = @!weight-masc-second-digit.elems + 1;
        @!digits = (("0" x ($total-len - $.number.chars)) ~ $.number).split(/\d/, :v, :skip-empty);

        my $first-digit  = sum(@!digits Z* @!weight-masc-first-digit)  * 10 % 11;
        my $second-digit = sum(@!digits Z* @!weight-masc-second-digit) * 10 % 11;

        return if @!digits[$total-len - 2] != $first-digit;
        return if @!digits[$total-len - 1] != $second-digit;

        $!valid = True;
    }
}


class CPF does Document {
    submethod BUILD(:$!number) {
        @!weight-masc-first-digit  = <10 9 8 7 6 5 4 3 2>;
        @!weight-masc-second-digit = <11 10 9 8 7 6 5 4 3 2>;

        self.verify;
    }
}


class CNPJ does Document {
    submethod BUILD(:$!number) {
        @!weight-masc-first-digit  = <5 4 3 2 9 8 7 6 5 4 3 2>;
        @!weight-masc-second-digit = <6 5 4 3 2 9 8 7 6 5 4 3 2>;

        self.verify;
    }
}

=begin pod

=head1 NAME

Brazilian::FederalDocuments - Brazilian federal documents validations

=head1 SYNOPSIS

=begin code :lang<raku>

use Brazilian::FederalDocuments;

if FederalDocuments::CPF(number => 6931987887).is-valid {
    say "Valid CPF!!!"
}
else {
    say "Invalid CPF..."
}

if FederalDocuments::CNPJ(number => 394411000109).is-valid {
    say "Valid CNPF!!!"
}
else {
    say "Invalid CNPF..."
}

=end code

=head1 DESCRIPTION

n Brazil, there are two numbers of documents used especially for financial transactions. For individuals, the CPF (Individual Persons Registry), and for companies, the CNPJ (National Registry of Legal Entities).

This module verifies that the numbers are valid.

=head1 AUTHOR

Paulo Henrique Rodrigues Pinheiro

=head1 COPYRIGHT AND LICENSE

Copyright 2017 - 2020 Paulo Henrique Rodrigues Pinheiro

Copyright 2024 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
