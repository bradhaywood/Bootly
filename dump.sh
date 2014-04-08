dbicdump -o dump_directory=./lib -o components='["InflateColumn::DateTime"]' Bootly::Schema dbi:SQLite:./bootly.db '{ quote_char => "\"" }'
