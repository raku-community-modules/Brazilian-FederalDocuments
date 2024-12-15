[![Actions Status](https://github.com/raku-community-modules/Brazilian-FederalDocuments/actions/workflows/linux.yml/badge.svg)](https://github.com/raku-community-modules/Brazilian-FederalDocuments/actions) [![Actions Status](https://github.com/raku-community-modules/Brazilian-FederalDocuments/actions/workflows/macos.yml/badge.svg)](https://github.com/raku-community-modules/Brazilian-FederalDocuments/actions) [![Actions Status](https://github.com/raku-community-modules/Brazilian-FederalDocuments/actions/workflows/windows.yml/badge.svg)](https://github.com/raku-community-modules/Brazilian-FederalDocuments/actions)

NAME
====

Brazilian::FederalDocuments - Brazilian federal documents validations

SYNOPSIS
========

```raku
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
```

DESCRIPTION
===========

n Brazil, there are two numbers of documents used especially for financial transactions. For individuals, the CPF (Individual Persons Registry), and for companies, the CNPJ (National Registry of Legal Entities).

This module verifies that the numbers are valid.

AUTHOR
======

Paulo Henrique Rodrigues Pinheiro

COPYRIGHT AND LICENSE
=====================

Copyright 2017 - 2020 Paulo Henrique Rodrigues Pinheiro

Copyright 2024 Raku Community

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

