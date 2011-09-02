package Template::Plugin::Filter::Minify::CSS::XS;

# ABSTRACT: CSS::Minifier::XS filter for Template Toolkit

use 5.006;
use strict;
use base 'Template::Plugin::Filter';
use CSS::Minifier::XS;

sub init {
    my $self = shift;

    $self->install_filter('minify_css');

    return $self;
}

sub filter {
    my ($self, $text) = @_;

    $text = CSS::Minifier::XS::minify($text);

    return $text;
}

1;

__END__

=begin Pod::Coverage

init
filter

=end Pod::Coverage

=head1 SYNOPSIS

  [% USE Filter.Minify.CSS.XS %]

  [% FILTER minify_css %]
    .foo {
        color: #aabbcc;
        margin: 0 10px 0 10px;
    }
  [% END %]

=head1 DESCRIPTION

This module is a Template Toolkit filter, which uses CSS::Minifier::XS to minify
css code from filtered content during template processing.

=head1 SEE ALSO

L<CSS::Minifier::XS>, L<Template::Plugin::Filter>, L<Template>

